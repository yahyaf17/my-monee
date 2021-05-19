//
//  NumberFormatter.swift
//  MyMoneeApp
//
//  Created by MacBook on 16/05/21.
//

import Foundation

func currencyFormat(value: Float) -> String {
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "id_ID")
    formatter.groupingSeparator = "."
    formatter.numberStyle = .decimal
    var returnString = ""
    if let stringAmount = formatter.string(from: NSNumber(value: value)){
        returnString = stringAmount
    }
    return returnString
}

func currencyFormatISO(value: Float) -> String {
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "id_ID")
    formatter.groupingSeparator = "."
    formatter.numberStyle = .currencyISOCode
    var returnString = ""
    if let stringAmount = formatter.string(from: NSNumber(value: value)){
        returnString = stringAmount
    }
    return returnString
}

func ignoreDotNumber(string: String) -> String {
    string.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
}
