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
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
