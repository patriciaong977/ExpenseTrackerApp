//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Patricia Ong on 6/8/22.
//

import Foundation

// To find Color in the scope.
import SwiftUI

// Extensions allow you to add methods to existing types to make them do things they weren't originally designed to do.

extension Color {
    // Static - variables whose values are shared among all the instance or object of a class.
    static let background = Color("Background") // Initializing with the name
    static let icon = Color("Icon")
    static let text = Color("Text")
    static let SystemBackground = Color(uiColor: .systemBackground) 
    
}

// For parsing a string date to a Swift date. (Helper Method)
extension DateFormatter {
    static let allNumericUSA: DateFormatter = { // Type DateFormatter
        print("Initializing DateFormatter")
        // Initializing a NEW DateFormatter.
        let formatter = DateFormatter()
        // Assign its dateFormat property to be the receiving format.
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }() // Calling the method directly, called lazymethod.
}

extension String {
    // Return a Date
    func dateParsed() -> Date {
        // Call the parsedDate from allNumericUSA method from DateFormatter, followed by the date method from the value itself.
        // Possibility above can fail, add guard.
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else {return Date()}
        
        // Otherwise
        return parsedDate
    }
}
