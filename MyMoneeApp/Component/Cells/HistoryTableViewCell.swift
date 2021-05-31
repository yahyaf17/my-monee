//
//  HistoryTableViewCell.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var mainHistoryCellView: UIView!
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAmount: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showData(history: Transaction) {
        labelName.text = history.title
        labelDate.text = history.date
//        labelAmount.text = String(history.price)
//        labelAmount.text = history.price.currencyFormatISO()
        if history.type == true {
            iconImage.image = UIImage(named: "arrow_upward")
//            profile.balance = profile.balance + history.price
//            recentIncomeTrx = history.price
            iconView.backgroundColor = UIColor(red: 33/255, green: 150/255, blue: 83/255, alpha: 0.2)
            labelAmount.textColor = UIColor(red: 33/255, green: 150/255, blue: 83/255, alpha: 1)
            labelAmount.text = "+Rp \(history.price.currencyFormat())"
        } else {
            iconImage.image = UIImage(named: "arrow_downward")
//            profile.balance -= history.price
//            recentOutcomeTrx = history.price
            iconView.backgroundColor = UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 0.2)
            labelAmount.textColor = UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 1)
            labelAmount.text = "-Rp \(history.price.currencyFormat())"
        }
    }
    
//    func postTransaction(transaction: Transaction) {
//        let newTransaction = Transaction(id: transaction.id, title: transaction.title, price: transaction.price, date: transaction.date, image: transaction.image, type: transaction.type)
//    }
//
//    func updateBalance(history: Transaction) {
//        if history.type == true {
//            profile.balance = profile.balance + history.price
//            recentIncomeTrx = history.price
//        } else {
//            profile.balance -= history.price
//            recentOutcomeTrx = history.price
//        }
//    }
    
}
