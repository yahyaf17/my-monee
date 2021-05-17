//
//  DreamTableViewCell.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class DreamTableViewCell: UITableViewCell {

    @IBOutlet weak var mainDreamView: UIView!
    @IBOutlet weak var labelDreamTitle: UILabel!
    @IBOutlet weak var progressDream: UIProgressView!
    @IBOutlet weak var labelDreamAmount: UILabel!
    @IBOutlet weak var buttonDreamDetails: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
//    }
    
}
