//
//  EditDreamViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 16/05/21.
//

import UIKit

class EditDreamViewController: UIViewController {

    var dreamTitle: String = ""
    var dreamTarget: Float!
    var selectedRow: Int!
    var selectedDream: Dream!
    
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var titleView: TitleView!
    @IBOutlet weak var targetView: TitleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleView.textFieldDetails.text = dreamTitle
        targetView.labelTitle.text = "Target Capaian (Rp)"
        targetView.textFieldDetails.text = String(Int(dreamTarget))
        
        deleteBtnAppereance(button: deleteButton)
    }
    
    @IBAction func doBack(_ sender: Any) {
        backToDream()
    }
    
    
    @IBAction func doDelete(_ sender: Any) {
        dreams.remove(at: selectedRow)
        backToDream()
    }
    
    
    @IBAction func doUpdate(_ sender: Any) {
        let floatAmount = Float(targetView.textFieldDetails.text?.ignoreDotNumber() ?? "0") ?? 0.0
        let progress = Float(profile.balance / floatAmount)
        dreams[selectedRow] = Dream(id: selectedDream.id, title: titleView.textFieldDetails.text!, progress: progress, totalAmount: floatAmount)
        backToDream()
    }
    
    private func deleteBtnAppereance(button: UIButton) {
        button.backgroundColor = .clear
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 1).cgColor
    }
    
    private func backToDream() {
        let TabViewController = MainTabBarController(nibName: "MainTabBarController", bundle: nil)
         TabViewController.selectedIndex = 1
        UIApplication.shared.keyWindow?.rootViewController = TabViewController
    }
    
}
