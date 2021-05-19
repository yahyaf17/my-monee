//
//  Recent.swift
//  MyMoneeApp
//
//  Created by MacBook on 17/05/21.
//

import Foundation

var recentIncomeTrx: Float = 0
var recentOutcomeTrx: Float = 0

func searchRecentIncome() -> Float {
    if let checkHistory = histories.first(where: {$0.type == .income}) {
        recentIncomeTrx = checkHistory.price
    }
    return recentIncomeTrx
}

func searchRecentOutcome() -> Float {
    if let checkHistory = histories.first(where: {$0.type == .outcome}) {
        recentOutcomeTrx = checkHistory.price
    }
    return recentOutcomeTrx
}
