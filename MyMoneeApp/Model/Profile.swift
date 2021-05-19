//
//  HomeProperties.swift
//  MyMoneeApp
//
//  Created by MacBook on 16/05/21.
//

import Foundation
import UIKit

struct Profile {
    var name: String
    var balance: Float
    var image: UIImage?
    
    init(name: String, balance: Float, image: UIImage?) {
        self.name = name
        self.balance = balance
        self.image = image
    }
}

var profile = Profile(name: "Yahya Faikar Hanif", balance: 0, image: UIImage(named: "not_found.png"))
