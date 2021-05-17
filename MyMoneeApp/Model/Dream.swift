//
//  Dream.swift
//  MyMoneeApp
//
//  Created by MacBook on 13/05/21.
//

import Foundation

struct Dream {
    
    var id: String
    var title: String
    var progress: Float
    var amount: Float
    var totalAmount: Float
    
    init(id: String, title:String, progress: Float, totalAmount: Float) {
        self.id = id
        self.title = title
        self.progress = progress
        self.amount = profile.balance
        self.totalAmount = totalAmount
    }
}

var dreams: [Dream] = [
    Dream(id: "MM-19293", title: "Membeli Mobil", progress: 0.05, totalAmount: 200000000),
    Dream(id: "MM-19242", title: "Membeli Airpods Baru", progress: 0.6, totalAmount:  1500000),
    Dream(id: "MM-38184", title: "Membeli Sepatu Adidas", progress: 1, totalAmount: 500000)
]
