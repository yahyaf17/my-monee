//
//  EditUsageViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 17/05/21.
//

import UIKit

class EditUsageViewController: UIViewController {

    var idTransaction: String = ""
    var indexTransaction: Int = 0
    var usageTitle: String = ""
    var amount: Float = 0.0
    var incomeSelected: Bool!
    var outcomeSelected: Bool!
    var selectedRow: Int = 0
    var transactionType: Bool!
    var service: NetworkService = NetworkService()
    var dataSource: HistoryDataSource = HistoryDataSource()
    
    @IBOutlet weak var titleView: TitleView!
    @IBOutlet weak var amountView: TitleView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var incomeView: CategoryView!
    @IBOutlet weak var outcomeView: CategoryView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleView.textFieldDetails.text = usageTitle
        amountView.labelTitle.text = "Jumlah Rp"
        amountView.textFieldDetails.text = String(Int(amount))
        
        incomeView.categoryLabel.text = "Pemasukan"
        incomeView.imageCategory.image = UIImage(named: "arrow_upward")
        outcomeView.categoryLabel.text = "Pengeluaran"
        outcomeView.imageCategory.image = UIImage(named: "arrow_downward")
        
        shadowEffect(view: incomeView)
        shadowEffect(view: outcomeView)
        
        if incomeSelected {
            didSelectView(view: incomeView)
            incomeSelected = true
            outcomeSelected = false
        } else {
            didSelectView(view: outcomeView)
            incomeSelected = false
            outcomeSelected = true
        }
        
        deleteBtnAppereance(button: deleteButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if incomeSelected {
            didSelectView(view: incomeView)
            incomeSelected = true
            outcomeSelected = false
        } else {
            didSelectView(view: outcomeView)
            incomeSelected = false
            outcomeSelected = true
        }
    }

    @IBAction func doBack(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func doUpdate(_ sender: Any) {
        let floatAmount = Float(amountView.textFieldDetails.text!)
        
        if incomeSelected {
            let newTransaction = Transaction(id: idTransaction, title: titleView.textFieldDetails.text!, price: floatAmount!, date: currentDate, image: true, type: true)
            self.service.updateTransaction(id: idTransaction, newTransaction) {
                print("Success Update Post Income Transaction")
            }
            transactionBalanceUpdate()
            alertUpdate()
        } else {
            let newTransaction = Transaction(id: idTransaction, title: titleView.textFieldDetails.text!, price: floatAmount!, date: currentDate, image: false, type: false)
            self.service.updateTransaction(id: idTransaction, newTransaction) {
                print("Success Update Post Outcome Transaction")
            }
            transactionBalanceUpdate()
            alertUpdate()
        }
    }
    
    func alertUpdate() {
        let alert = UIAlertController(title: "Berhasil Melakukan Perubahan Transaksi", message: "Anda Berhasil Perubahan Pada Transaksi: \(transactionList[selectedRow].title)", preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .destructive, handler: { action in
            self.backToHome()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func doDelete(_ sender: Any) {
        if outcomeSelected {
            profile.balance += amount
            recentOutcomeTrx = Float(amountView.textFieldDetails.text ?? "0")!
            self.service.deleteTransaction(id: idTransaction) { (err) in
                print("delete success")
            }
            
        } else {
            profile.balance -= amount
            recentIncomeTrx = Float(amountView.textFieldDetails.text ?? "0")!
            self.service.deleteTransaction(id: idTransaction) { (err) in
                print("delete success")
            }
        }
        let alert = UIAlertController(title: "Berhasil Menghapus", message: "Transaksi anda Berhasil terhapus", preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .destructive, handler: { action in
            self.backToHome()
        }))
        present(alert, animated: true, completion: nil)
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
        let TabViewController = MainTabBarController(nibName: "MainTabBarController", bundle: nil)
         TabViewController.selectedIndex = 0
        UIApplication.shared.keyWindow?.rootViewController = TabViewController
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
