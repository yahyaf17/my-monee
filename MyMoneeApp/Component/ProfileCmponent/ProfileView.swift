//
//  ProfileView.swift
//  MyMoneeApp
//
//  Created by MacBook on 14/05/21.
//

import UIKit

class ProfileView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    
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
        Bundle.main.loadNibNamed("ProfileView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    
//    @IBAction func doEditName(_ sender: Any) {
//        let popUp = PopUpViewController(nibName: "PopUpViewController", bundle: nil)
//        popUp.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//        self
//    }
}
