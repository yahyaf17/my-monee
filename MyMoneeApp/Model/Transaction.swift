//
//  ResponseTransaction.swift
//  My Monee - Money Saver
//
//  Created by MacBook on 20/05/21.
//

import Foundation

struct Transaction: Codable {
    
    var id: String
    var title: String
    var price: Float
    var date: String
    var image: Bool
    var type: Bool
    
    init(id: String, title: String, price: Float, date: String, image: Bool, type: Bool) {
        self.id = id
        self.title = title
        self.price = price
        self.date = date
        self.image = image
        self.type = type
    }
}

var transactionList: [Transaction] = []

func transactionBalanceUpdate() {
    var income: Float = 0
    var outcome: Float = 0
    for n in transactionList {
        if n.type == true {
            income += n.price
//            recentIncomeTrx = n.price
        } else {
            outcome += n.price
        }
    }
    profile.balance = income - outcome
}
