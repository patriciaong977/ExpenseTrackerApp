//
//  TransactionListViewModel.swift
//  ExpenseTracker
//
//  Created by Patricia Ong on 6/9/22.
//

import Foundation

// Final class - prevents the class from being inherited. Can't be overwritten.
// Observable object - turns the obj into a publisher and notify its state changes to refresh views.
final class TransactionListViewModel : ObservableObject {
    // @Published - allows to create observable object that automatically announce when changes occurs.
    @Published var transactions: [Transaction] = []
    
    func getTransactions() {
        // Declare a constant url. Add the url json.
        // Then check if the URL is valid or not with a guard statement.
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("Invalid URL")
            
            return
        }
        // Fetch data from an API, demands a URL Session data task.
        // Using the dataTaskPublisher from combine, allows to combine events via operators and can handle response and data.
        URLSession.shared.dataTaskPublisher(for: url)
            // TryMap the response. Tuple - pair of values group into one (data, response). Return a Data type.
            .tryMap { (data, response) -> Data in   // TryMap enables us to throw an error. If that happens, it would end the stream with a failure completion.
                // Guard if there's a response. Type-cast response as? HTTPURLResponse. If there's a response, verify.
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { // Status code 200 = Success. Using it because URL is json.
                                                                                                                // API's return 200 to 300.
                    // If condition fails, dump response.
                    dump(response) // Dump - like print but in a more readable format, good for logging objects. Outputs the whole class hiearchy, good for UI debugging.
                    throw URLError(.badServerResponse) // URLError - error codes returned by URL loading APIs. badServerResponse - The URL Loading system received bad data from the server.
                }
                // If there is no error, return data
                return data
            }
       // After getting the data, decode it into a data model.
            .decode(type: [Transaction].self, decoder: JSONDecoder())   // Requires the data model is decodable in TransactionModel.
    }
    
}
