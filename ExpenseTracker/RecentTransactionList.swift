//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Patricia Ong on 6/9/22.
//

import SwiftUI

struct RecentTransactionList: View {
    // Prepare to feed the data in. Remember: Array of transactions stored in TransactionListViewModel.
    // That view model was also saved in the environmentobject in ExpenseTrackerApp
    // Retrieve the Environment Object
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            HStack {
                // Header
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                // Header Link
                NavigationLink {
                    //Add transactionlist() as a destination view.
                    TransactionList()
                    
                } label: {
                    HStack(spacing: 4) {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
                
            } // HStack End
            .padding(.top)
            
            // Recent Transaction List
            // Loop Transaction.
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id: \.element) { index, transaction in
                TransactionRow(transaction: transaction)
                
                Divider() // Makes a divider on the last entry shown.
                            // Added .enumerated() in the ForEach, and put placed everything in an array.
                            // Had to have an id which made it the \.element
                            // Make TransactionModel Hashable.
                    // Adding opacity to divider, and render it invisible when index is 4.
                    // If index is == to 4. If so, make it zero. Else 1. 
                    .opacity(index == 4 ? 0 : 1)
            }
            
        } // VStack End
        .padding()
        .background(Color.SystemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        // Initialize an instance of TransactionListViewModel
        let transactionListVM = TransactionListViewModel()
        // Push transactionListPreviewData to its transactions property
        transactionListVM.transactions = transactionListPreviewData
        
        return transactionListVM
        
    }() // A trick to enforce a different value to the view model for the preview.
    
    static var previews: some View {
        Group {
            // Can add navigation view here to show "see all", but can just go to ContentView.
                // Just like in TransactionList
            NavigationView{
                RecentTransactionList()
            }
            NavigationView {
            RecentTransactionList()
                .preferredColorScheme(.dark)
            }
        }
        .environmentObject(transactionListVM) // Passing this b/c its a separate entity from app
    }
}
