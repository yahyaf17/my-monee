//
//  HomeProperties.swift
//  MyMoneeApp
//
//  Created by MacBook on 16/05/21.
//

import Foundation

struct Profile {
    var name: String
    var balance: Float
    var image: String
    
    init(name: String, balance: Float, image: String) {
        self.name = name
        self.balance = balance
        self.image = image
    }
}

var profile = Profile(name: "Yahya Faikar Hanif", balance: 999000, image: "profile-picture-example")
