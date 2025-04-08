#!/bin/bash

# Script to fetch MDN documentation for HTML elements and add them as comments to Swift files
# Usage: ./fetch_mdn_docs.sh

ELEMENTS_DIR="./Sources/HTML Elements"
TEMP_DIR=$(mktemp -d)

# Function to convert HTML to comments
html_to_comments() {
  local content="$1"
  # Replace line breaks with line breaks followed by '//'
  echo "$content" | sed 's/^/\/\//; s/$//' | sed 's/\/\/$//'
}

# Function to extract element name from filename
extract_element_name() {
  local filename="$1"
  # Extract the tag name from between < and > characters using sed
  tag=$(echo "$filename" | sed -n 's/.*<\([^>]*\)>.*/\1/p')
  echo "$tag"
}

# Function to check if a file is just a stub
is_stub() {
  local file="$1"
  # If file contains a struct definition, it's likely implemented
  if grep -q "struct" "$file" && grep -q "public" "$file"; then
    return 1 # Not a stub
  else
    return 0 # Is a stub
  fi
}

echo "Looking for HTML element stub files..."

# Find all element files
element_files=$(find "$ELEMENTS_DIR" -type f -name "<*.swift" | sort)

for file in $element_files; do
  filename=$(basename "$file")
  
  # Check if file is a stub
  if is_stub "$file"; then
    element=$(extract_element_name "$filename")
    
    if [ -z "$element" ]; then
      echo "Warning: Could not extract element name from $filename, skipping"
      continue
    fi
    
    echo "Processing $filename (element: $element)"
    
    # Prepare URL
    url="https://developer.mozilla.org/en-US/docs/Web/HTML/Element/$element"
    
    # Fetch MDN documentation
    echo "  Fetching from $url"
    
    # Use curl to fetch the entire page
    html_content=$(curl -s "$url")
    
    # Check if page was found
    if echo "$html_content" | grep -q "Page not found"; then
      echo "  Warning: MDN page not found for $element"
      continue
    fi
    
    # Extract just the main article content - macOS compatible version
    # This uses awk to extract content between article-content div and article-footer div
    content=$(echo "$html_content" | 
              awk '/<div class="article-content">/,/<div class="article-footer">/' |
              # Basic HTML to text conversion - remove tags
              sed 's/<[^>]*>//g' | 
              # Remove extra whitespace and HTML entities
              sed 's/&nbsp;/ /g' | sed 's/&lt;/</g' | sed 's/&gt;/>/g' | sed 's/&amp;/\&/g' |
              # Clean up whitespace
              sed -E 's/[[:space:]]+/ /g')
    
    if [ -z "$content" ]; then
      echo "  Warning: Could not extract content for $element"
      continue
    fi
    
    # Format content for readability
    formatted_content=$(echo "$content" | sed 's/\. /.\n\/\//g')
    
    # Convert to comments
    comments=$(html_to_comments "$formatted_content")
    
    # Add a header
    header="//<$element>: MDN Documentation\n//\n// Source: $url\n//\n"
    
    # Prepare new content
    new_content="${header}${comments}"
    
    # Create a temporary file with new content
    temp_file="${TEMP_DIR}/$(basename "$file")"
    echo -e "$new_content" > "$temp_file"
    cat "$file" >> "$temp_file"
    
    # Replace the original file
    mv "$temp_file" "$file"
    
    echo "  Added MDN documentation to $file"
    
    # Be nice to the server - add a small delay between requests
    sleep 2
  else
    echo "Skipping $filename (already implemented)"
  fi
done

# Clean up temp directory
rm -rf "$TEMP_DIR"

echo "Done!"