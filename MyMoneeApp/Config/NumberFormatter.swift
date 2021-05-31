//
//  NumberFormatter.swift
//  MyMoneeApp
//
//  Created by MacBook on 16/05/21.
//

import Foundation

extension Float {
    func currencyFormat() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        var returnString = ""
        if let stringAmount = formatter.string(from: NSNumber(value: self)){
            returnString = stringAmount
        }
        return returnString
    }

    func currencyFormatISO() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.groupingSeparator = "."
        formatter.numberStyle = .currencyISOCode
        var returnString = ""
        if let stringAmount = formatter.string(from: NSNumber(value: self)){
            returnString = stringAmount
        }
        return returnString
    }
}

extension String {
    func ignoreDotNumber() -> String {
        self.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
    }
}


