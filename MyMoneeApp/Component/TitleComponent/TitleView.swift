//
//  TitleView.swift
//  MyMoneeApp
//
//  Created by MacBook on 13/05/21.
//

import UIKit

class TitleView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textFieldDetails: UITextField!
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    // Constructor yang terpanggil jika dari Interface Builder (storyboard)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    //
    private func commonInit() {
        Bundle.main.loadNibNamed("TitleView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }

}
