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
    
}
