//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Patricia Ong on 6/8/22.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    // @StateObject - stored in the view, so the view won't lose the data during redrawing.
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
