//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Patricia Ong on 6/8/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    // Transaction List
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
            }.background(Color.background)
             .navigationBarTitleDisplayMode(.inline)
             .toolbar {
                 ToolbarItem{   // Notification Bell Icon
                     Image(systemName: "bell.badge")
                         .symbolRenderingMode(.palette)
                         .foregroundStyle(Color.icon, .primary)
                 }
             }
            
        }.navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        // Initialize an instance of TransactionListViewModel
        let transactionListVM = TransactionListViewModel()
        // Push transactionListPreviewData to its transactions property
        transactionListVM.transactions = transactionListPreviewData
        
        return transactionListVM
        
    }() // A trick to enforce a different value to the view model for the preview.
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
