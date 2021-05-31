//
//  CurrentDate.swift
//  MyMoneeApp
//
//  Created by MacBook on 17/05/21.
//

import Foundation

extension Date {
    func id_format() -> String {
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "id_ID") as Locale
        formatter.dateFormat = "dd MMMM yyyy - HH:mm"
        return formatter.string(from: Date())
    }
    func today(format : String = "dd MMMM yyyy - HH:mm") -> String {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.dateFormat = format
        return formatter.string(from: Date())
    }
}

let currentDate: String = Date().id_format()
//let currentDate: String = Date().today()
