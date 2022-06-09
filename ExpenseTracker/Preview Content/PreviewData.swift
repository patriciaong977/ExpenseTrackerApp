//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Patricia Ong on 6/8/22.
//

import Foundation
import SwiftUI

// Setting up some initial data we can use to display in the previews without calling an API.
// Used for mockups.
// Any file in the Preview Content is not included in the Production build.
var transactionPreviewData = Transaction(id: 1, date: "06/08/2022", institution: "Desjardins", account: "Visa Desjardins", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 001, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

// To not map out each transaction, repeat a data type as many times in count, and make an array out of it.
var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
