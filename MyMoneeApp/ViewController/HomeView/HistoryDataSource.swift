//
//  HistoryDataSource.swift
//  My Monee - Money Saver
//
//  Created by MacBook on 20/05/21.
//

import Foundation
import UIKit

class HistoryDataSource: NSObject, UITableViewDataSource {
    
    
    var transactionTag: Int = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as! HistoryTableViewCell
        cell.showData(history: transactionList[indexPath.row])
        return cell
    }
    
    private func imageViewColor(cell: HistoryTableViewCell, indexPath: IndexPath) {
        if transactionList[indexPath.row].image {
            cell.iconImage.image = UIImage(named: "arrow_upward")
            cell.iconView.backgroundColor = UIColor(red: 33/255, green: 150/255, blue: 83/255, alpha: 0.2)
            cell.labelAmount.textColor = UIColor(red: 33/255, green: 150/255, blue: 83/255, alpha: 1)
            cell.labelAmount.text = "+Rp \(transactionList[indexPath.row].price.currencyFormat())"
        } else {
            cell.iconImage.image = UIImage(named: "arrow_downward")
            cell.iconView.backgroundColor = UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 0.2)
            cell.labelAmount.textColor = UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 1)
            cell.labelAmount.text = "-Rp \(transactionList[indexPath.row].price.currencyFormat())"
        }
    }
    
    func searchRecentIncome() -> Float {
        if let checkHistory = transactionList.first(where: {$0.type == true}) {
            recentIncomeTrx = checkHistory.price
        }
        return recentIncomeTrx
    }

    func searchRecentOutcome() -> Float {
        if let checkHistory = transactionList.first(where: {$0.type == false}) {
            recentOutcomeTrx = checkHistory.price
        }
        return recentOutcomeTrx
    }
}
