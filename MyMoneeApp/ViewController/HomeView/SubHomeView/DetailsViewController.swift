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
    var type: Bool!
    var selectedRow: Int = 0
    var transactionText: String = ""
        
    @IBOutlet weak var detailsView: DetailsView!
    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // RoundView
        roundView.layer.cornerRadius = 30
        roundView.layer.masksToBounds = true
        roundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        // Passing Value From Table
        imageColorData(type: type)
        detailsView.labelAmount.text = "Rp \(amount.currencyFormat())"
//        detailsView.labelTabSection.text = 
        detailsView.labelTitle.text = historyTitle
        idLabel.text = idHistory
        dateLabel.text = date
        detailsView.labelTabSection.text = transactionText
    
        parentView.bringSubviewToFront(detailsView)
        parentView.bringSubviewToFront(buttonView)
        
        backButtonAppearance(button: backButton)
//        activityIndicator.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        imageColorData(type: type)
        detailsView.labelAmount.text = "Rp \(amount.currencyFormat())"
//        detailsView.labelTabSection.text =
        detailsView.labelTitle.text = historyTitle
        idLabel.text = idHistory
        dateLabel.text = date
        detailsView.labelTabSection.text = transactionText
        activityIndicator.isHidden = true
    }
    
    @IBAction func doBackButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func editAction(_ sender: Any) {
        let editUsage = EditUsageViewController(nibName: "EditUsageViewController", bundle: nil)
        editUsage.usageTitle = historyTitle
        editUsage.amount = amount
        editUsage.selectedRow = selectedRow
        editUsage.idTransaction = idHistory
        editUsage.indexTransaction = selectedRow
        if type == true {
            editUsage.incomeSelected = true
            editUsage.outcomeSelected = false
        } else {
            editUsage.incomeSelected = false
            editUsage.outcomeSelected = true
        }
        editUsage.transactionType = type
        self.navigationController?.pushViewController(editUsage, animated: true)
    }
    
    private func imageColorData(type: Bool!) {
        switch type {
        case true:
            detailsView.iconImage.image = UIImage(named: "arrow_upward")
            detailsView.iconView.backgroundColor = UIColor(red: 33/255, green: 105/255, blue: 83/255, alpha: 0.2)
            detailsView.labelAmount.textColor = UIColor(red: 33/255, green: 105/255, blue: 83/255, alpha: 1)
        case false:
            detailsView.iconImage.image = UIImage(named: "arrow_downward")
            detailsView.iconView.backgroundColor = UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 0.2)
            detailsView.labelAmount.textColor = UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 1)
        default:
            detailsView.iconImage.image = UIImage(named: "not_found")
        }
    }
    
    private func backButtonAppearance(button: UIButton) {
        button.backgroundColor = .clear
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(red: 80/255, green: 105/255, blue: 185/255, alpha: 1).cgColor
    }
}
