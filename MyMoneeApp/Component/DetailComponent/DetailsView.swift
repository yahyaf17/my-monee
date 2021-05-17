//
//  DetailsView.swift
//  MyMoneeApp
//
//  Created by MacBook on 15/05/21.
//

import UIKit

class DetailsView: UIView {

    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelTabSection: UILabel!
    @IBOutlet weak var labelAmount: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    // Constructor yang terpanggil jika dari Interface Builber (storyboard)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    //
    private func commonInit() {
        Bundle.main.loadNibNamed("DetailsView", owner: self, options: nil)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }

}
