//
//  AddDreamViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 16/05/21.
//

import UIKit

class AddDreamViewController: UIViewController {
    
    
    @IBOutlet weak var titleView: TitleView!
    @IBOutlet weak var amountView: TitleView!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleView.textFieldDetails.placeholder = "Tulis Impianmu"
        amountView.labelTitle.text = "Target Capaian (Rp)"
        amountView.textFieldDetails.placeholder = "Berapa Nominalnya?"
        
        saveButton.isEnabled = true
        
//        emptyDataHandler()
    }
    
    @IBAction func doBack(_ sender: UIButton) {
        backToDream()
    }
    
    @IBAction func doSave(_ sender: UIButton) {
        let floatAmount = Float(ignoreDotNumber(string: amountView.textFieldDetails.text ?? "0")) ?? 0.0
        var progress = Float(profile.balance / floatAmount)
        if progress > 1 {
            progress = 1
        } 
        let addDream = Dream(id: "MM-19223", title: titleView.textFieldDetails.text!, progress: progress, totalAmount: floatAmount)
        dreams.append(addDream)
        backToDream()
    }
    
    
    private func backToDream() {
        let TabViewController = MainTabBarController(nibName: "MainTabBarController", bundle: nil)
         TabViewController.selectedIndex = 1
         UIApplication.shared.keyWindow?.rootViewController = TabViewController
    }
    
    private func emptyDataHandler() {
        if titleView.textFieldDetails.text?.isEmpty ?? true && amountView.textFieldDetails.text?.isEmpty ?? true {
            saveButton.isEnabled = false
            saveButton.isUserInteractionEnabled = false
            saveButton.backgroundColor = UIColor.lightGray
        } else {
            saveButton.isEnabled = false
            saveButton.isUserInteractionEnabled = true
            saveButton.backgroundColor = UIColor.blue
        }
    }
}
