//
//  BackButtonView.swift
//  MyMoneeApp
//
//  Created by MacBook on 16/05/21.
//

import UIKit

class BackButtonView: UIView {

    @IBOutlet var contentVIew: UIView!
    @IBOutlet weak var labelBack: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
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
        Bundle.main.loadNibNamed("BackButtonView", owner: self, options: nil)
        addSubview(contentVIew)
        contentVIew.frame = self.bounds
        contentVIew.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    @IBAction func doBack(button: UIButton) {
    }
    
}
