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
    var type: String
}
