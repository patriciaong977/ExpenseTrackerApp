//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Patricia Ong on 6/8/22.
//

import Foundation

struct Transaction: Identifiable { // Identifiable - automatically use the property.
    // Each item in this list is unique.
    let id: Int
    let date: String
    let institution: String
    let account: String
    let amount: Double
    let type: TransactionType.RawValue //
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
}
