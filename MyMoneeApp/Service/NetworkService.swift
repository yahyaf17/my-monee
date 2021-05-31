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
        let getUrl = URLComponents(string: transactionUrl)!
        
        var request = URLRequest(url: getUrl.url!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                
                // Data jadi Struct
                let decoder = JSONDecoder()
                
                if let historyTransaction = try? decoder.decode([Transaction].self, from: data) as [Transaction] {
                    print("success get all transaction")
                    completion(historyTransaction.reversed())
                } else {
                    print("ERROR, can't load transaction")
                }
            }
        }
        task.resume()
    }
    
    func getTransactionById(id: String, completion: @escaping (_ transaction: Transaction) -> ()) {
        guard let getByIdUrl = URL(string: "\(transactionUrl)/\(id)") else { return }
        
        var request = URLRequest(url: getByIdUrl)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                
                // Data jadi Struct
                let decoder = JSONDecoder()
                
                if let historyTransaction = try? decoder.decode(Transaction.self, from: data) as Transaction {
                    print("success")
                    completion(historyTransaction)
                } else {
                    print("ERROR")
                }
            }
        }
        task.resume()
    }
    
    func postTransaction(_ transaction: Transaction, completion: @escaping() -> ()) {
        let postUrl = URLComponents(string: transactionUrl)!

        var request = URLRequest(url: postUrl.url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let jsonData = try? JSONEncoder().encode(transaction)
        request.httpBody = jsonData

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
                guard let data = data else {return}
                do{
                    let transactionModel = try JSONDecoder().decode(Transaction.self, from: data)
                    print("Response data:\n \(transactionModel)")
                    print("transactionModel Title: \(transactionModel.title)")
                    print("transactionModel id: \(transactionModel.id)")
                    completion()
                }catch let jsonErr{
                    print(jsonErr)
               }
        }
        task.resume()
    }
        
    
    func deleteTransaction(id: String, completion: @escaping (Error?) -> () ) {
        guard let deleteUrl = URL(string: "https://60a5f2bec0c1fd00175f4cb8.mockapi.io/api/v1/transaction/\(id)") else { return }
        var urlRequest = URLRequest(url: deleteUrl)
        urlRequest.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response , error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error Delete Data")
                    completion(error)
                    return
                }
                print("Successfully Delete Data")
                completion(nil)
            }
        }.resume()
    }
    
    func updateTransaction(id: String, _ transaction: Transaction, completion: @escaping () -> ()) {
        guard let updateUrl = URL(string: "https://60a5f2bec0c1fd00175f4cb8.mockapi.io/api/v1/transaction/\(id)") else { return }
//        let postUrl = URLComponents(string: !

        var request = URLRequest(url: updateUrl)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let jsonData = try? JSONEncoder().encode(transaction)
        request.httpBody = jsonData

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
                guard let data = data else {return}
                do{
                    let transactionModel = try JSONDecoder().decode(Transaction.self, from: data)
                    print("Response data:\n \(transactionModel)")
                    print("transactionModel Title: \(transactionModel.title)")
                    print("transactionModel id: \(transactionModel.id)")
                    completion()
                }catch let jsonErr{
                    print(jsonErr)
               }
        }
        task.resume()
    }
    
    
    
}
