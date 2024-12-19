//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 28/08/2024.
//

import Foundation
import PointFreeHTML

extension HTML {
    @HTMLBuilder
    public func id(_ id: String) -> some HTML {
        attribute("id", id)
    }
}

extension HTML {
    @HTMLBuilder
    public func `class`(_ class: String) -> some HTML {
        attribute("class", `class`)
    }
}

extension HTML {
    @HTMLBuilder
    public func onClick(unsafe javascript: String) -> some HTML {
        attribute("onClick", javascript)
    }
    
    @HTMLBuilder
    public func onClick(_ javascript: String) -> some HTML {
        self.onClick(unsafe: javascript)
    }
    
    @HTMLBuilder
    public func onclick(_ javascript: String) -> some HTML {
        self.onClick(unsafe: javascript)
    }
}

extension HTML {
    @HTMLBuilder
    public func type(_ type: InputType) -> some HTML {
        attribute("type", type.rawValue)
    }
}

extension HTML {
    @HTMLBuilder
    public func placeholder(_ placeholder: String) -> some HTML {
        attribute("placeholder", placeholder)
    }
}


import Foundation

extension HTML {
    @HTMLBuilder
    public func name(_ name: String) -> some HTML {
        attribute("name", name)
    }
    
    @HTMLBuilder
    public func value(_ value: String) -> some HTML {
        attribute("value", value)
    }
    
    @HTMLBuilder
    public func disabled(_ isDisabled: Bool = true) -> some HTML {
        isDisabled ? attribute("disabled", "") : self.attribute("", nil)
    }

    @HTMLBuilder
    public func required(_ isRequired: Bool = true) -> some HTML {
        isRequired ? attribute("required", "") : self.attribute("", nil)
    }

    @HTMLBuilder
    public func autofocus(_ hasAutofocus: Bool = true) -> some HTML {
        hasAutofocus ? attribute("autofocus", "") : self.attribute("", nil)
    }

    @HTMLBuilder
    public func checked(_ isChecked: Bool = true) -> some HTML {
        isChecked ? attribute("checked", "") : self.attribute("", nil)
    }

    @HTMLBuilder
    public func readonly(_ isReadonly: Bool = true) -> some HTML {
        isReadonly ? attribute("readonly", "") : self.attribute("", nil)
    }

    @HTMLBuilder
    public func maxlength(_ length: Int) -> some HTML {
        attribute("maxlength", String(length))
    }
    
   
    @HTMLBuilder
    public func min(_ value: String) -> some HTML {
        attribute("min", value)
    }
    
    @HTMLBuilder
    public func max(_ value: String) -> some HTML {
        attribute("max", value)
    }
    
    @HTMLBuilder
    public func step(_ value: String) -> some HTML {
        attribute("step", value)
    }
    
    @HTMLBuilder
    public func pattern(_ regex: String) -> some HTML {
        attribute("pattern", regex)
    }
    
    @HTMLBuilder
    public func `for`(_ id: String) -> some HTML {
        attribute("for", id)
    }
    
    @HTMLBuilder
    public func data(_ key: String, _ value: String) -> some HTML {
        attribute("data-\(key)", value)
    }
    
    // Event handlers
    @HTMLBuilder
    public func onSubmit(_ javascript: String) -> some HTML {
        attribute("onsubmit", javascript)
    }
    
    @HTMLBuilder
    public func onChange(_ javascript: String) -> some HTML {
        attribute("onchange", javascript)
    }
    
    @HTMLBuilder
    public func onFocus(_ javascript: String) -> some HTML {
        attribute("onfocus", javascript)
    }
    
    @HTMLBuilder
    public func onBlur(_ javascript: String) -> some HTML {
        attribute("onblur", javascript)
    }
    
    // Accessibility attributes
    @HTMLBuilder
    public func ariaLabel(_ label: String) -> some HTML {
        attribute("aria-label", label)
    }
    
    @HTMLBuilder
    public func ariaDescribedby(_ id: String) -> some HTML {
        attribute("aria-describedby", id)
    }
    
    @HTMLBuilder
    public func role(_ role: String) -> some HTML {
        attribute("role", role)
    }
}

// Form-specific extensions
extension HTML {
    @HTMLBuilder
    public func action(_ url: String) -> some HTML {
        attribute("action", url)
    }
    
    @HTMLBuilder
    public func method(_ method: String) -> some HTML {
        attribute("method", method.lowercased())
    }
    
    @HTMLBuilder
    public func enctype(_ type: String) -> some HTML {
        attribute("enctype", type)
    }
}

extension HTML {
    @HTMLBuilder
    public func method(_ method: HTMLMethod) -> some HTML {
        attribute("method", method.rawValue.lowercased())
    }
}

public enum HTMLMethod: String, Sendable, Codable, Hashable {
    case post
    case get
    case put
    case delete
}

// Media-specific extensions
extension HTML {
    @HTMLBuilder
    public func width(_ value: Int) -> some HTML {
        attribute("width", String(value))
    }
    
    @HTMLBuilder
    public func height(_ value: Int) -> some HTML {
        attribute("height", String(value))
    }
    
    @HTMLBuilder
    public func autoplay(_ shouldAutoplay: Bool = true) -> some HTML {
        shouldAutoplay ? attribute("autoplay", "") : self.attribute("", nil)
    }
    
    @HTMLBuilder
    public func controls(_ showControls: Bool = true) -> some HTML {
        showControls ? attribute("controls", "") : self.attribute("", nil)
    }
    
    @HTMLBuilder
    public func loading(_ loading: Loading? ) -> some HTML {
        attribute("loading", loading?.rawValue)
    }
}
