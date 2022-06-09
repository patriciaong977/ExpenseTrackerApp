//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Patricia Ong on 6/8/22.
//

import Foundation

struct Transaction: Identifiable { // Identifiable - automatically use the property.
    // Each item in this list is unique.
    // Let - constant/read-only, var - editable.
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue // The string version.
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    // Establish a computed property for the transaction date.
    // Computed property - provides a getter and an optional setter to indirectly access other properties and values.
    var dateParsed : Date {
        date.dateParsed()
    }
    
    // Show negative amount if debit.
    var signedAmount: Double {
        // Return and check TransactionType.
        // Is the TransactionType.credit.rawValue?
            // Return the amount unchange, if not, return amount with negative sign infront. 
        return type == TransactionType.credit.rawValue ? amount : -amount
        
    }
}

// Create a user-defined data type that has fixed values.
// Enum - enumeration
enum TransactionType : String { // return a String
    case debit = "debit"
    case credit = "credit"
    
}
