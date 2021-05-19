//
//  CurrentDate.swift
//  MyMoneeApp
//
//  Created by MacBook on 17/05/21.
//

import Foundation

extension Date {
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "id_ID") as Locale
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    func today(format : String = "dd MMMM yyyy - HH:mm") -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}

let currentDate: String = Date().string(format: "dd MMMM yyyy - HH:mm")
//let currentDate: String = Date().today()
