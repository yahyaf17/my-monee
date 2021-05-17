//
//  RecentView.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class RecentView: UIView {

    @IBOutlet weak var recentContentView: UIView!
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var imageStatus: UIImageView!
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
        Bundle.main.loadNibNamed("RecentView", owner: self, options: nil)
        addSubview(recentContentView)
        recentContentView.frame = self.bounds
        recentContentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }

}
