//
//  NotFoundView.swift
//  MyMoneeApp
//
//  Created by MacBook on 18/05/21.
//

import UIKit

protocol NotFoundDelegate {
    func addData()
}

class NotFoundView: UIView {
        
    var delegate: NotFoundDelegate?
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var notFoundLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var mainContent: UIView!
    
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
        Bundle.main.loadNibNamed("NotFoundView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    
    @IBAction func buttonAdd() {
        self.delegate?.addData()
    }

}
