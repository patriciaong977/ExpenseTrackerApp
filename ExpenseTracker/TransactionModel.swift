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
    let amount: Double
    let type: TransactionType.RawValue // The string version.
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
}

// Create a user-defined data type that has fixed values.
// Enum - enumeration
enum TransactionType : String { // return a String
    case debit = "debit"
    case credit = "credit"
    
}
