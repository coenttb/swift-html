//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 03/04/2025.
//

import Foundation
import PointFreeHTML
import HTML_Attributes

extension Input {
    /// Represents the possible types for HTML input elements.
    ///
    /// `InputType` encapsulates all standard HTML input types as defined
    /// in the HTML specification. Using this enum ensures type safety when
    /// specifying input types in your HTML.
    ///
    /// Example:
    /// ```swift
    /// input()
    ///     .attribute("type", InputType.email.rawValue)
    ///     .attribute("placeholder", "Enter your email")
    /// ```
    ///
    /// - Note: These values correspond directly to the values used in the
    ///   `type` attribute of HTML input elements.
    public enum Variant: Sendable, Equatable, CustomStringConvertible {
       
        /// A push button with no default behavior displaying the value of the value attribute, empty by default
        case button(Input.Button)
        
        /// A check box allowing single values to be selected/deselected.
        case checkbox(Input.Checkbox)
        
        /// A control for specifying a color; opening a color picker when active in supporting browsers.
        case color(Input.Color)
        
        /// A control for entering a date (year, month, and day, with no time). Opens a date picker or numeric wheels for year, month, day when active in supporting browsers.
        case date(Input.Date)
        
        /// A control for entering a date and time, with no time zone. Opens a date picker or numeric wheels for date- and time-components when active in supporting browsers.
        case datetimeLocal(Input.DatetimeLocal)
                
        /// A field for editing an email address. Looks like a text input, but has validation parameters and relevant keyboard in supporting browsers and devices with dynamic keyboards.
        case email(Input.Email)
        
        /// A control that lets the user select a file. Use the accept attribute to define the types of files that the control can select.
        case file(Input.File)
        
        /// A control that is not displayed but whose value is submitted to the server. There is an example in the next column, but it's hidden!
        case hidden(Input.Hidden)
        
        /// A graphical submit button. Displays an image defined by the src attribute. The alt attribute displays if the image src is missing.
        case image(Input.Image)
        
        /// A control for entering a month and year, with no time zone.
        case month(Input.Month)
        
        /// A control for entering a number. Displays a spinner and adds default validation. Displays a numeric keypad in some devices with dynamic keypads.
        case number(Input.Number)
        
        /// A single-line text field whose value is obscured. Will alert user if site is not secure.
        case password(Input.Password)
        
        /// A radio button, allowing a single value to be selected out of multiple choices with the same name value.
        case radio(Input.Radio)
        
        /// A control for entering a number whose exact value is not important. Displays as a range widget defaulting to the middle value. Used in conjunction min and max to define the range of acceptable values.
        case range(Input.Range)
                
        /// A button that resets the contents of the form to default values. Not recommended.
        case reset(Input.Reset)
        
        /// A single-line text field for entering search strings. Line-breaks are automatically removed from the input value. May include a delete icon in supporting browsers that can be used to clear the field. Displays a search icon instead of enter key on some devices with dynamic keypads.
        case search(Input.Search)
        
        /// A button that submits the form.
        case submit(Input.Submit)
        
        /// A control for entering a telephone number. Displays a telephone keypad in some devices with dynamic keypads.
        case tel(Input.Tel)
        
        /// The default value. A single-line text field. Line-breaks are automatically removed from the input value.
        case text(Input.Text)
        
        /// A control for entering a time value with no time zone.
        case time(Input.Time)
        
        /// A field for entering a URL. Looks like a text input, but has validation parameters and relevant keyboard in supporting browsers and devices with dynamic keyboards.
        case url(Input.Url)
        
        /// A control for entering a date consisting of a week-year number and a week number with no time zone.
        case week(Input.Week)
        
        /// A control for entering a date and time (hour, minute, second, and fraction of a second) based on UTC time zone.
        @available(*, deprecated)
        case datetime
    }
}

extension Input.Variant {
    public var description: String {
        switch self {
        case .button:
            "button"
        case .checkbox:
            "checkbox"
        case .color:
            "color"
        case .date:
            "date"
        case .datetimeLocal:
            "datetime-local"
        case .email:
            "email"
        case .file:
            "file"
        case .hidden:
            "hidden"
        case .image:
            "image"
        case .month:
            "month"
        case .number:
            "number"
        case .password:
            "password"
        case .radio:
            "radio"
        case .range:
            "range"
        case .reset:
            "reset"
        case .search:
            "search"
        case .submit:
            "submit"
        case .tel:
            "tel"
        case .text:
            "text"
        case .time:
            "time"
        case .url:
            "url"
        case .week:
            "week"
        case .datetime:
            "datetime"
        }
    }
}


extension Input {

    public enum `Type`: String, CustomStringConvertible {
       
        /// A push button with no default behavior displaying the value of the value attribute, empty by default
        case button
        
        /// A check box allowing single values to be selected/deselected.
        case checkbox
        
        /// A control for specifying a color; opening a color picker when active in supporting browsers.
        case color
        
        /// A control for entering a date (year, month, and day, with no time). Opens a date picker or numeric wheels for year, month, day when active in supporting browsers.
        case date
        
        /// A control for entering a date and time, with no time zone. Opens a date picker or numeric wheels for date- and time-components when active in supporting browsers.
        case datetimeLocal = "datetime-local"
                
        /// A field for editing an email address. Looks like a text input, but has validation parameters and relevant keyboard in supporting browsers and devices with dynamic keyboards.
        case email
        
        /// A control that lets the user select a file. Use the accept attribute to define the types of files that the control can select.
        case file
        
        /// A control that is not displayed but whose value is submitted to the server. There is an example in the next column, but it's hidden!
        case hidden
        
        /// A graphical submit button. Displays an image defined by the src attribute. The alt attribute displays if the image src is missing.
        case image
        
        /// A control for entering a month and year, with no time zone.
        case month
        
        /// A control for entering a number. Displays a spinner and adds default validation. Displays a numeric keypad in some devices with dynamic keypads.
        case number
        
        /// A single-line text field whose value is obscured. Will alert user if site is not secure.
        case password
        
        /// A radio button, allowing a single value to be selected out of multiple choices with the same name value.
        case radio
        
        /// A control for entering a number whose exact value is not important. Displays as a range widget defaulting to the middle value. Used in conjunction min and max to define the range of acceptable values.
        case range
                
        /// A button that resets the contents of the form to default values. Not recommended.
        case reset
        
        /// A single-line text field for entering search strings. Line-breaks are automatically removed from the input value. May include a delete icon in supporting browsers that can be used to clear the field. Displays a search icon instead of enter key on some devices with dynamic keypads.
        case search
        
        /// A button that submits the form.
        case submit
        
        /// A control for entering a telephone number. Displays a telephone keypad in some devices with dynamic keypads.
        case tel
        
        /// The default value. A single-line text field. Line-breaks are automatically removed from the input value.
        case text
        
        /// A control for entering a time value with no time zone.
        case time
        
        /// A field for entering a URL. Looks like a text input, but has validation parameters and relevant keyboard in supporting browsers and devices with dynamic keyboards.
        case url
        
        /// A control for entering a date consisting of a week-year number and a week number with no time zone.
        case week
        
        /// A control for entering a date and time (hour, minute, second, and fraction of a second) based on UTC time zone.
        @available(*, deprecated)
        case datetime
    }
}

extension Input.`Type` {
    public var description: String { self.rawValue }
}
