//
//  RandomId.swift
//  My Monee - Money Saver
//
//  Created by MacBook on 19/05/21.
//

import Foundation

func randonId() -> String {
    let random_number = Int.random(in: 1..<10000)
    let randomString = "MM - \(String(random_number))"
    return randomString
}
