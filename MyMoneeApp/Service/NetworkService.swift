//
//  NetworkService.swift
//  My Monee - Money Saver
//
//  Created by MacBook on 20/05/21.
//

import Foundation

class NetworkService {
//    let apiKey: String = "99bc66d74f8686fc34d985741a078dc0"
    let transactionUrl: String = "https://60a5f2bec0c1fd00175f4cb8.mockapi.io/api/v1/transaction"
    
    func getTransactionHistroy(completion: @escaping (_ transaction: [Transaction]) -> ()) {
        
        // Objek component untuk URLnya
        let transactionUrl = URLComponents(string: self.transactionUrl)!
        
        // Menambahkan API key sebagai parameternya
//        components.queryItems = [
//            URLQueryItem(name: "api_key", value: self.apiKey)
//        ]
        
        var request = URLRequest(url: transactionUrl.url!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                
                // Data jadi Struct
                let decoder = JSONDecoder()
                
                if let historyTransaction = try? decoder.decode([Transaction].self, from: data) as [Transaction] {
                    // Memanggil Closure dengan mengirimkan daftar list movie
                    print("success")
                    completion(historyTransaction)
//                    print(historyTransaction)
                } else {
                    print("ERROR")
                }
            }
        }
        task.resume()
    }
}
