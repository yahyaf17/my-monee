//
//  UsageViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 14/05/21.
//

import UIKit

class UsageViewController: UIViewController {

    var incomeSelected: Bool = false
    var outcomeSelected: Bool = false
//    var performTransaction: Transaction = Transaction(from: Decoder)
    var service: NetworkService = NetworkService()
    
    @IBOutlet weak var titleView: TitleView!
    @IBOutlet weak var amountView: TitleView!
    @IBOutlet weak var usageCollection: UICollectionView!
    @IBOutlet weak var incomeView: CategoryView!
    @IBOutlet weak var outcomeView: CategoryView!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleView.labelTitle.text = "Judul"
        titleView.textFieldDetails.placeholder = "Judul Transaksi"
        amountView.labelTitle.text = "Jumlah (Rp)"
        amountView.textFieldDetails.placeholder = "Jumlah Transaksi"
        
        incomeView.categoryLabel.text = "Pemasukan"
        incomeView.imageCategory.image = UIImage(named: "arrow_upward")
        outcomeView.categoryLabel.text = "Pengeluaran"
        outcomeView.imageCategory.image = UIImage(named: "arrow_downward")
        
        shadowEffect(view: incomeView)
        shadowEffect(view: outcomeView)
        
        // Empty data handler
        emptyDataHandler()
    }
    
    @IBAction func backToHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func selectIncome(_ gesture: UITapGestureRecognizer) {
        enabaleSaveButton()
        emptyDataHandler()
        unselectView(view: outcomeView)
        didSelectView(view: incomeView)
        outcomeSelected = false
        incomeSelected = true
    }
    
    @IBAction func selectOutcome(_ gesture: UITapGestureRecognizer) {
        enabaleSaveButton()
        emptyDataHandler()
        unselectView(view: incomeView)
        didSelectView(view: outcomeView)
        incomeSelected = false
        outcomeSelected = true
    }
    
    fileprivate func validateOutcomeTransaction(_ floatPrice: Float?) {
        let alertValidate = UIAlertController(title: "Saldo Tidak Cukup", message: "Oops! Saldo Anda tidak cukup, apakah anda yakin untuk melanjutkan transaksi?", preferredStyle: .alert)
        alertValidate.addAction(.init(title: "Yakin, Ngutang Dulu", style: .default, handler: { action in
            let newTransaction = Transaction(id: randonId(), title: self.titleView.textFieldDetails.text!, price: floatPrice!, date: currentDate, image: false, type: false)
            self.service.postTransaction(newTransaction) {
                print("Success Post Outcome Transaction")
            }
            profile.balance -= floatPrice ?? 0
            recentOutcomeTrx = floatPrice ?? 0
            let alert = UIAlertController(title: "Berhasil Menambah Transaksi", message: "Anda Berhasil Menambahkan Transaksi Pengeluaran", preferredStyle: .alert)
            alert.addAction(.init(title: "OK", style: .cancel, handler: { action in
                print("Yay! You brought your towel!")
                self.goBackHome()
            }))
            self.present(alert, animated: true, completion: nil)
            //                    self.goBackHome()
        }))
        alertValidate.addAction(.init(title: "Tidak", style: .cancel, handler: { action in
            self.goBackHome()
        }))
        //                self.present(alert, animated: true, completion: nil)
        present(alertValidate, animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        let floatPrice = Float((amountView.textFieldDetails.text?.ignoreDotNumber())!)
        if incomeSelected {
            let newTransaction = Transaction(id: randonId(), title: titleView.textFieldDetails.text!, price: floatPrice!, date: currentDate, image: true, type: true)
            self.service.postTransaction(newTransaction) {
                print("Success Post Income Transaction")
            }
            profile.balance += floatPrice ?? 0
            recentIncomeTrx = floatPrice ?? 0
//            goBackHome()
            let alert = UIAlertController(title: "Berhasil Menambah Transaksi", message: "Anda Berhasil Menambahkan Transaksi Pemasukan", preferredStyle: .alert)
            alert.addAction(.init(title: "OK", style: .destructive, handler: { action in
                self.goBackHome()
            }))
            present(alert, animated: true, completion: nil)
        }
        else if outcomeSelected {
            if profile.balance - floatPrice! < 0 {
                validateOutcomeTransaction(floatPrice)
            } else {
                let newTransaction = Transaction(id: randonId(), title: self.titleView.textFieldDetails.text!, price: floatPrice!, date: currentDate, image: false, type: false)
                self.service.postTransaction(newTransaction) {
                    print("Success Post Outcome Transaction")
                }
                profile.balance -= floatPrice ?? 0
                recentOutcomeTrx = floatPrice ?? 0
                let alert = UIAlertController(title: "Berhasil Menambah Transaksi", message: "Anda Berhasil Menambahkan Transaksi Pengeluaran", preferredStyle: .alert)
                alert.addAction(.init(title: "OK", style: .cancel, handler: { action in
                    self.goBackHome()
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
        else {
            disableSaveButton()
        }
        
        
        
    }
    
    func disableSaveButton() {
        saveButton.backgroundColor = .lightGray
        saveButton.isUserInteractionEnabled = false
        saveButton.isEnabled = false
    }
    
    func enabaleSaveButton() {
        saveButton.backgroundColor = UIColor(red: 80/255,
                                             green: 105/255,
                                             blue: 184/255,
                                             alpha: 1)
        saveButton.isUserInteractionEnabled = true
        saveButton.isEnabled = true
    }
    
    private func shadowEffect(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 1, height: 3)
        view.layer.shadowRadius = 3
    }
    
    private func didSelectView(view: UIView) {
        view.backgroundColor = .clear
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor(red: 80/255,
                                         green: 105/255,
                                         blue: 185/255,
                                         alpha: 1).cgColor
    }
    
    private func unselectView(view: UIView) {
        view.backgroundColor = .clear
        view.layer.borderWidth = .zero
    }
    
    private func goBackHome() {
        let TabViewController = MainTabBarController(nibName: "MainTabBarController", bundle: nil)
         TabViewController.selectedIndex = 0
         UIApplication.shared.keyWindow?.rootViewController = TabViewController
    }
    
    private func emptyDataHandler() {
        if titleView.textFieldDetails.text?.isEmpty ?? false && amountView.textFieldDetails.text?.isEmpty ?? false {
                saveButton.isEnabled = false
                saveButton.backgroundColor = UIColor.lightGray
        }
    }
}
