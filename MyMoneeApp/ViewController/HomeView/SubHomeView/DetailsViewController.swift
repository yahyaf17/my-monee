//
//  DetailsViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 15/05/21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var idHistory: String = ""
    var historyTitle:String = ""
    var iconImage: UIImage!
    var iconView: UIColor = .black
    var amount: Float = 0.0
    var date:String = ""
    var type: HistoryType = .income
    var selectedRow: Int = 0
    
    @IBOutlet weak var detailsView: DetailsView!
    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var buttonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // RoundView
        roundView.layer.cornerRadius = 30
        roundView.layer.masksToBounds = true
        roundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        // Passing Value From Table
        imageColorData(type: type)
        detailsView.labelAmount.text = currencyFormat(value: amount)
        detailsView.labelTabSection.text = type.rawValue
        detailsView.labelTitle.text = historyTitle
        idLabel.text = idHistory
        dateLabel.text = date
    
        parentView.bringSubviewToFront(detailsView)
        parentView.bringSubviewToFront(buttonView)
        
        backButtonAppearance(button: backButton)
    }
    
    @IBAction func doBackButton(_ sender: Any) {
        self.dismiss(animated:true) {
            let TabViewController = MainTabBarController(nibName: "MainTabBarController", bundle: nil)
             TabViewController.selectedIndex = 0
             UIApplication.shared.keyWindow?.rootViewController = TabViewController
        }
    }
    
    @IBAction func editAction(_ sender: Any) {
        let editUsage = EditUsageViewController(nibName: "EditUsageViewController", bundle: nil)
        editUsage.usageTitle = historyTitle
        editUsage.amount = amount
        editUsage.selectedRow = selectedRow
        if type == .income {
            editUsage.incomeSelected = true
            editUsage.outcomeSelected = false
        } else {
            editUsage.incomeSelected = false
            editUsage.outcomeSelected = true
        }
        self.navigationController?.pushViewController(editUsage, animated: true)
    }
    
    private func imageColorData(type: HistoryType!) {
        switch type {
        case .income:
            detailsView.iconImage.image = UIImage(named: "arrow_upward")
            detailsView.iconView.backgroundColor = UIColor(red: 33/255, green: 105/255, blue: 83/255, alpha: 0.2)
            detailsView.labelAmount.textColor = UIColor(red: 33/255, green: 105/255, blue: 83/255, alpha: 1)
        case .outcome:
            detailsView.iconImage.image = UIImage(named: "arrow_downward")
            detailsView.iconView.backgroundColor = UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 0.2)
            detailsView.labelAmount.textColor = UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 1)
        case .none:
            detailsView.iconImage.image = UIImage(named: "not_found")
        }
    }
    
    private func backButtonAppearance(button: UIButton) {
        button.backgroundColor = .clear
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(red: 80/255, green: 105/255, blue: 185/255, alpha: 1).cgColor
    }
}
