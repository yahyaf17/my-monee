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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleView.textFieldDetails.text = "Membeli Airpods Baru"
        amountView.labelTitle.text = "Target Capaian (Rp)"
        amountView.textFieldDetails.text = "1250000"
    }
    
    @IBAction func doBack(_ sender: UIButton) {
        backToDream()
    }
    
    @IBAction func doSave(_ sender: UIButton) {
        let floatAmount = Float(amountView.textFieldDetails.text ?? "0") ?? 0.0
        let progress = Float(999000 / floatAmount)
        let addDream = Dream(id: "MM-19223", title: titleView.textFieldDetails.text!, progress: progress, totalAmount: floatAmount)
        dreams.append(addDream)
        backToDream()
    }
    
    
    private func backToDream() {
        let TabViewController = MainTabBarController(nibName: "MainTabBarController", bundle: nil)
         TabViewController.selectedIndex = 1
         UIApplication.shared.keyWindow?.rootViewController = TabViewController
    }
}
