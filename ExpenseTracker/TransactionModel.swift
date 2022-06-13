//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Patricia Ong on 6/8/22.
//

import Foundation
import SwiftUIFontIcon // For Icons

struct Transaction: Identifiable, Decodable, Hashable { // Identifiable - automatically use the property.
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
    
    // Below are the following Computed Properties:
    // Establish a computed property for the transaction date.
    // Computed property - provides a getter and an optional setter to indirectly access other properties and values.
    var dateParsed: Date {
        date.dateParsed()
    }
    
    // Show negative amount if debit.
    var signedAmount: Double {
        // Return and check TransactionType.
        // Is the TransactionType.credit.rawValue?
            // Return the amount unchange, if not, return amount with negative sign infront. 
        return type == TransactionType.credit.rawValue ? amount : -amount
        
    }
    
    // Get the icon for the transaction according to its category.
    var icon: FontAwesomeCode {
        // Retrieve the first category returned from Category.all where the element's id is = to categoryId.
        if let category = Category.all.first(where: { $0.id == categoryId }) {
            // If category found
            return category.icon
        }
        
        // If not,
        return .question
    }
    
    // Month Computed Property, String type
    var month: String {
        // Returns a value from dateParsed.
        dateParsed.formatted(.dateTime.year().month(.wide))
    }
    
}

// Create a user-defined data type that has fixed values.
// Enum - enumeration
enum TransactionType : String { // return a String
    case debit = "debit"
    case credit = "credit"
    
}

// For Icons
struct Category {
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var mainCategoryId: Int? // Optional so declare with var and ?
    
}

// Creating an instance of Category for each possible transaction category.
extension Category {
    // Main Categories
    static let autoAndTransport = Category(id: 1, name:"Auto & Transport", icon: .car_alt)
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", icon: .file_invoice_dollar)
    static let entertainment = Category(id: 3, name:"Entertainment", icon:.film)
    static let feesAndCharges = Category(id: 4, name: "Fees & Charges", icon: .hand_holding_usd)
    static let foodAndDining = Category(id: 5, name:"Food & Dining", icon:.hamburger)
    static let home = Category(id: 6, name:"Home", icon:.home)
    static let income = Category(id:7,name: "Income", icon: .dollar_sign)
    static let shopping = Category(id: 8, name: "Shopping", icon: .shopping_cart)
    static let transfer = Category(id: 9, name: "Transfer", icon: .exchange_alt)
    
    // Sub-categories, contain an extra argument called mainCategoryId.
    static let publicTransportation = Category(id: 101, name: "Public Transportathin", icon: .bus,mainCategoryId: 1)
    static let taxi = Category(id: 102, name:"Taxi", icon: .taxi, mainCategoryId: 1)
    static let mobilePhone = Category(id: 201, name:"Mobile Phone", icon: .mobile_alt, mainCategoryId: 2)
    static let moviesAndDVDs = Category(id: 301, name:"Movies & DVDs", icon: .film, mainCategoryId: 3)
    static let bankFee = Category(id: 401, name:"Bank Fee", icon: .hand_holding_usd, mainCategoryId: 4)
    static let financeCharge = Category(id: 402, name:"Finance Charge", icon: .hand_holding_usd, mainCategoryId: 4)
    static let groceries = Category(id: 501, name: "Groceries", icon: .shopping_basket, mainCategoryId: 5)
    static let restaurants = Category(id: 502, name:"Restaurants", icon: .utensils, mainCategoryId: 5)
    static let rent = Category(id: 601, name: "Rent",icon: .house_user, mainCategoryId: 6)
    static let homeSupplies = Category(id: 602, name:"Home Supplies", icon:.lightbulb, mainCategoryId: 6)
    static let paycheque = Category(id: 701, name:"Paycheque", icon:.dollar_sign, mainCategoryId: 7)
    static let software = Category(id: 801, name:"Software", icon: .icons, mainCategoryId: 8)
    static let creditCardPayment = Category(id: 901, name: "Credit Card Payment", icon:.exchange_alt, mainCategoryId: 9)
}

// To organize the individual categories into main categories and subcategories.
extension Category {
    static let categories: [Category] = [
        .autoAndTransport,
        .billsAndUtilities,
        .entertainment,
        .feesAndCharges,
        .foodAndDining,
        .home,
        .income,
        .shopping,
        .transfer
    ]
    
    static let subCategories: [Category] = [
        .publicTransportation,
        .taxi,
        .mobilePhone,
        .moviesAndDVDs,
        .bankFee,
        .financeCharge,
        .groceries,
        .restaurants,
        .rent,
        .homeSupplies,
        .paycheque,
        .software,
        .creditCardPayment
    ]
    
    // Combining into a single array named all
    static let all: [Category] = categories + subCategories
}
