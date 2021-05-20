//
//  History.swift
//  MyMoneeApp
//
//  Created by MacBook on 13/05/21.
//

import Foundation

enum HistoryType: String, Codable {
    case income = "income"
    case outcome = "outcome"
}

struct History: Codable {
    
    var id: String
    var title: String
    var price: Float
    var date: String
    var image: Bool
    var type: HistoryType
    
    init(id: String, title: String, price: Float, date: String, image: Bool, type: HistoryType) {
        self.id = id
        self.title = title
        self.price = price
        self.date = date
        self.image = image
        self.type = type
    }
    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case title
//        case price
//        case date
//        case image
//        case type
//    }
    
//    func showHistory() {
//        NetworkService().getTransactionHistroy { (history) in
//            histories = history
//        }
//    }
}
var histories: [History] = [
//    History(id: "MM-128371", title: "Bayar Listrik", price: 256000, date: "1 Mei 2021 - 19.30", image: false, type: .outcome),
//    History(id: "MM-128372", title: "Gaji Februari", price: 1250000, date: "1 Mei 2021 - 19.30", image: true, type: .income),
//    History(id: "MM-128373", title: "Gaji Januari", price: 1550000, date: "1 Februari 2021 - 19.30", image: true, type: .income)
]

