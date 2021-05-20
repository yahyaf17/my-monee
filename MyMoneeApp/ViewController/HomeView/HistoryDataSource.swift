//
//  HistoryDataSource.swift
//  My Monee - Money Saver
//
//  Created by MacBook on 20/05/21.
//

import Foundation
import UIKit

class HistoryDataSource: NSObject, UITableViewDataSource {
    
    var transaction: [Transaction] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transaction.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as! HistoryTableViewCell
        cell.showData(history: transaction[indexPath.row])
        return cell
    }
}
