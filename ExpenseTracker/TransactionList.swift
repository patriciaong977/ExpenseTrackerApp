//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Patricia Ong on 6/12/22.
//

import SwiftUI

struct TransactionList: View {
    // Type TransactionListView Model because we need the data.
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            List {
                // Transaction Groups
                ForEach(Array(transactionListVM.groupTransactionsByMonth()) , id: \.key) { month, transactions in
                    // Divide the group of transactions into different months.
                    Section  {   // Section - add hierarchy to certain views
                        // Transaction Data - loop it.
                        ForEach(transactions) { transaction in
                            TransactionRow(transaction: transaction)
                        }
                        
                    } header: {
                        // Transaction Month
                        Text (month)
                    }
                    .listSectionSeparator(.hidden) // Removes the line that comes with the header
                } // End of ForEach
            
            } // End of List
            .listStyle(.plain)
            
        } // End of VStack
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    } // End var body : some View
} // End struct TransactionList:View


struct TransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        // Initialize an instance of TransactionListViewModel
        let transactionListVM = TransactionListViewModel()
        // Push transactionListPreviewData to its transactions property
        transactionListVM.transactions = transactionListPreviewData
        
        return transactionListVM
        
    }() // A trick to enforce a different value to the view model for the preview.
    
    
    static var previews: some View {
        Group {
            // Embbed in NavigationView to see the title "Transactions"
            NavigationView {
                TransactionList()
            }
            NavigationView {
                TransactionList()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(transactionListVM)
    }
}
