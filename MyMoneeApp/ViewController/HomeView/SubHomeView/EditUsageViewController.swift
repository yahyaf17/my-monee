//
//  EditUsageViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 17/05/21.
//

import UIKit

class EditUsageViewController: UIViewController {

    var usageTitle: String = ""
    var amount: Float = 0.0
    var incomeSelected: Bool!
    var outcomeSelected: Bool!
    var selectedRow: Int = 0
    
    @IBOutlet weak var titleView: TitleView!
    @IBOutlet weak var amountView: TitleView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var incomeView: CategoryView!
    @IBOutlet weak var outcomeView: CategoryView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleView.textFieldDetails.text = usageTitle
        amountView.labelTitle.text = "Jumlah Rp"
        amountView.textFieldDetails.text = String(amount)
        
        incomeView.categoryLabel.text = "Pemasukan"
        incomeView.imageCategory.image = UIImage(named: "arrow_upward")
        outcomeView.categoryLabel.text = "Pengeluaran"
        outcomeView.imageCategory.image = UIImage(named: "arrow_downward")
        
        shadowEffect(view: incomeView)
        shadowEffect(view: outcomeView)
        
        if incomeSelected {
            didSelectView(view: incomeView)
        } else {
            didSelectView(view: outcomeView)
        }
        
        deleteBtnAppereance(button: deleteButton)
    }

    @IBAction func doBack(_ sender: Any) {
        backToHome()
    }
    
    
    @IBAction func doUpdate(_ sender: Any) {
        let floatAmount = Float(amountView.textFieldDetails.text ?? "0")
        var transactionType: HistoryType = .outcome
        let selectedHistory = histories[selectedRow]
        if incomeSelected {
            transactionType = .income
            profile.balance -= floatAmount!
            profile.balance += floatAmount!
            recentIncomeTrx = floatAmount!
        } else {
            transactionType = .outcome
            profile.balance += floatAmount!
            profile.balance -= floatAmount!
            recentOutcomeTrx = floatAmount!
        }
        histories[selectedRow] = History(id: selectedHistory.id, title: titleView.textFieldDetails.text!, price: floatAmount!, date: selectedHistory.date, image: selectedHistory.image, type: transactionType)
        backToHome()
    }
    
    
    @IBAction func doDelete(_ sender: Any) {
        if outcomeSelected {
            profile.balance += histories[selectedRow].price
            recentOutcomeTrx = Float(amountView.textFieldDetails.text ?? "0")!
        } else {
            profile.balance -= histories[selectedRow].price
            recentIncomeTrx = Float(amountView.textFieldDetails.text ?? "0")!
        }
        histories.remove(at: selectedRow)
        backToHome()
//        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectIncome(_ gesture: UITapGestureRecognizer) {
        unselectView(view: outcomeView)
        didSelectView(view: incomeView)
        outcomeSelected = false
        incomeSelected = true
    }
    
    @IBAction func selectOutcome(_ gesture: UITapGestureRecognizer) {
        unselectView(view: incomeView)
        didSelectView(view: outcomeView)
        incomeSelected = false
        outcomeSelected = true
    }
    
    private func deleteBtnAppereance(button: UIButton) {
        button.backgroundColor = .clear
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 1).cgColor
    }
    
    private func backToHome() {
//        let detailVC = DetailsViewController(nibName: "DetailsViewController", bundle: nil)
        self.navigationController?.popToRootViewController(animated: true)
//        let TabViewController = MainTabBarController(nibName: "MainTabBarController", bundle: nil)
//         TabViewController.selectedIndex = 0
//        UIApplication.shared.keyWindow?.rootViewController = TabViewController
    }
    
    private func didSelectView(view: UIView) {
        view.backgroundColor = .clear
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor(red: 80/255, green: 105/255, blue: 185/255, alpha: 1).cgColor
    }
    
    private func unselectView(view: UIView) {
        view.backgroundColor = .clear
        view.layer.borderWidth = .zero
    }
    
    private func shadowEffect(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 1, height: 3)
        view.layer.shadowRadius = 3
    }
}
