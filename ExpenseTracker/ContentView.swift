//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Patricia Ong on 6/8/22.
//

import SwiftUI
import SwiftUICharts // For the charts.

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    // Demo data for the line chart
    // var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    // Chart
                    let data = transactionListVM.accumulateTransactions()
                    
                    //
                    if !data.isEmpty {
                        let totalExpenses = data.last?.1 ?? 0
                        CardView {
                            VStack(alignment: .leading) { // Added because the def is in a ZStack.
                            // Passing the data of the linechart
                                ChartLabel(totalExpenses.formatted(.currency(code: "USD")), type: .title, format: "$%.02f")
                            LineChart()
                            }
                            .background(Color.SystemBackground) // Added due to CardView on darkmode.
                        }
                        .data(data)
                        .chartStyle(ChartStyle(backgroundColor: Color.SystemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                        .frame(height: 300)
                    }
                    
                   
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
            
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary) // Changing the back button color
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
