//
//  DreamTableViewCell.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

protocol DreamButtonDelegate {
//    func deleteDream(cell: DreamTableViewCell)
    func deleteDream(button: UIButton)
    func achieveDream(button: UIButton)
}

class DreamTableViewCell: UITableViewCell {

    var delegate: DreamButtonDelegate?
    
    @IBOutlet weak var mainDreamView: UIView!
    @IBOutlet weak var labelDreamTitle: UILabel!
    @IBOutlet weak var progressDream: UIProgressView!
    @IBOutlet weak var labelDreamAmount: UILabel!
    @IBOutlet weak var confirmDreamButton: UIButton!
    @IBOutlet weak var deleteDreamButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func confirmDreamButton(_ sender: Any) {
        self.delegate?.achieveDream(button: self.confirmDreamButton)
    }
    
    @IBAction func deleteDreamButton(_ sender: UIButton) {
        self.delegate?.deleteDream(button: self.deleteDreamButton)
    }
    
}
