#!/usr/bin/env python3

import os
import re
import time
import subprocess
import requests
from bs4 import BeautifulSoup

# Directory containing HTML element files
ELEMENTS_DIR = "/Users/coen/Developer/coenttb/swift-html/Sources/HTML Elements"

def extract_element_name(filename):
    """Extract the element name from the filename."""
    match = re.search(r'<([^>]+)>', filename)
    if match:
        return match.group(1)
    return None

def is_stub(file_path):
    """Check if a file is just a stub by looking for struct and public keywords."""
    try:
        with open(file_path, 'r') as f:
            content = f.read()
            return "struct" not in content or "public" not in content
    except Exception as e:
        print(f"Error reading file {file_path}: {e}")
        return False

def fetch_mdn_content(element):
    """Fetch content from MDN for the given element."""
    url = f"https://developer.mozilla.org/en-US/docs/Web/HTML/Element/{element}"
    headers = {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36'
    }
    
    try:
        response = requests.get(url, headers=headers)
        if response.status_code != 200:
            print(f"  Warning: Could not fetch page for {element}, status code: {response.status_code}")
            return None
        
        # Parse HTML
        soup = BeautifulSoup(response.text, 'html.parser')
        
        # Find the article content section
        article_content = soup.select_one('article')
        if not article_content:
            print(f"  Warning: Could not find article content for {element}")
            return None
        
        # Extract readable text
        text = article_content.get_text(separator='\n', strip=True)
        
        # Clean up the text a bit
        text = re.sub(r'\n+', '\n', text)
        text = re.sub(r' +', ' ', text)
        
        return text, url
    except Exception as e:
        print(f"  Error fetching content for {element}: {e}")
        return None

def format_as_comments(text):
    """Format text as Swift comments."""
    lines = text.split('\n')
    commented_lines = [f"// {line}" for line in lines]
    return '\n'.join(commented_lines)

def main():
    print("Looking for HTML element stub files...")
    
    # Find all element files
    element_files = []
    for root, _, files in os.walk(ELEMENTS_DIR):
        for file in files:
            if file.startswith('<') and file.endswith('.swift'):
                element_files.append(os.path.join(root, file))
    
    element_files.sort()
    
    for file_path in element_files:
        filename = os.path.basename(file_path)
        
        # Check if file is a stub
        if is_stub(file_path):
            element = extract_element_name(filename)
            if not element:
                print(f"Warning: Could not extract element name from {filename}, skipping")
                continue
            
            print(f"Processing {filename} (element: {element})")
            
            # Fetch MDN documentation
            print(f"  Fetching from MDN for {element}...")
            result = fetch_mdn_content(element)
            
            if not result:
                continue
                
            content, url = result
            
            if not content:
                print(f"  Warning: No content retrieved for {element}")
                continue
            
            # Format content as comments
            commented_content = format_as_comments(content)
            
            # Add header
            header = f"//<{element}>: MDN Documentation\n//\n// Source: {url}\n//\n"
            
            # Read the existing file content
            with open(file_path, 'r') as f:
                original_content = f.read()
            
            # Prepare new content
            new_content = header + commented_content + "\n\n" + original_content
            
            # Write back to the file
            with open(file_path, 'w') as f:
                f.write(new_content)
            
            print(f"  Added MDN documentation to {file_path}")
            
            # Be nice to the server - add a small delay between requests
            time.sleep(2)
        else:
            print(f"Skipping {filename} (already implemented)")
    
    print("Done!")

if __name__ == "__main__":
    main()