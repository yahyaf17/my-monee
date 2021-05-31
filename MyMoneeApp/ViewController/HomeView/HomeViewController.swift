//
//  HomeViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 13/05/21.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, NotFoundDelegate {
    
    var service: NetworkService = NetworkService()
    var dataSource: HistoryDataSource = HistoryDataSource()
    
    @IBOutlet weak var recentIncome: RecentView!
    @IBOutlet weak var recentOutcome: RecentView!
    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelBalance: UILabel!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var notFoundView: NotFoundView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greeting()
        labelName.text = profile.name
        
        labelBalance.text = "Rp \(profile.balance.currencyFormat())"
    
        // Rounded View
        roundView.layer.cornerRadius = 30
        roundView.layer.masksToBounds = true
        roundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        // RecentIncome
        recentIncome.imageStatus.image = UIImage(named: "arrow_upward")
        recentIncome.labelStatus.text = "Uang Masuk"
        
        
        // RecentOutcome
        recentOutcome.imageStatus.image = UIImage(named: "arrow_downward")
        recentOutcome.labelStatus.text = "Uang Keluar"
        
        notFoundView.isHidden = true
        
        // TableView
        tableView.delegate = self
//        tableView.dataSource = self
        
        let uiNib = UINib(nibName: String(describing: HistoryTableViewCell.self), bundle: nil)
        tableView.register(uiNib, forCellReuseIdentifier: String(describing: HistoryTableViewCell.self))
        
        loadingIndicator.isHidden = false
        notFoundView.delegate = self
        self.tableView.dataSource = self.dataSource
        self.loadData()
    }
    
    func loadData() {
        self.service.getTransactionHistroy { (transaction) in
            DispatchQueue.main.async {
                self.loadingIndicator.isHidden = true
                transactionList = transaction
                self.tableView.reloadData()
                self.empyDataHandling()
                transactionBalanceUpdate()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.loadData()
    }
    
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return histories.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HistoryTableViewCell.self), for: indexPath) as! HistoryTableViewCell
//        cell.labelName.text = histories[indexPath.row].title
//        cell.labelDate.text = histories[indexPath.row].date
////        imageViewColor(cell: cell, indexPath: indexPath)
////        cell.showData(history: histories[indexPath.row])
////        History.showHistory(History.self)
//        return cell
//    }
//
    
    
    @IBAction func toAddView(_ sender: Any) {
        let addView = UsageViewController(nibName: "UsageViewController", bundle: nil)
        self.navigationController?.pushViewController(addView, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc = DetailsViewController(nibName: "DetailsViewController", bundle: nil)
        // From API
        self.service.getTransactionById(id: transactionList[indexPath.row].id) { (transaction) in
            DispatchQueue.main.async {
//                dvc.activityIndicator.isHidden = true
                dvc.idHistory = transaction.id
                dvc.historyTitle = transaction.title
                dvc.amount = transaction.price
                dvc.date = transaction.date
                dvc.selectedRow = indexPath.row
                dvc.type = transaction.type
                if transaction.type {
                    dvc.transactionText = "Pemasukan"
                } else {
                    dvc.transactionText = "Pengeluaran"
                }
            }
            print("Success get transaction by ID")
        }
//        dvc.idHistory = transactionList[indexPath.row].id
//        dvc.historyTitle = transactionList[indexPath.row].title
//        dvc.amount = transactionList[indexPath.row].price
//        dvc.date = transactionList[indexPath.row].date
//        dvc.selectedRow = indexPath.row
//        dvc.type = transactionList[indexPath.row].type
//        if transactionList[indexPath.row].type {
//            dvc.transactionText = "Pemasukan"
//        } else {
//            dvc.transactionText = "Pengeluaran"
//        }
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    func greeting() {
        var currentTimeOfDay = ""
        let hour = NSCalendar.current.component(.hour, from: NSDate() as Date)
        if hour >= 3 && hour < 12 {
            currentTimeOfDay = "Pagi"
        } else if hour >= 12 && hour < 15 {
            currentTimeOfDay = "Siang"
        } else if hour >= 15 && hour < 18 {
            currentTimeOfDay = "Sore"
        }else {
            currentTimeOfDay = "Malam"
        }
        greetingLabel.text = "Selamat \(currentTimeOfDay),"
        }
    
    func addData() {
        toAddView((Any).self)
    }
    
    func empyDataHandling() {
        if transactionList.isEmpty {
            notFoundView.isHidden = false
            recentOutcome.labelAmount.text = "Rp 0"
            recentIncome.labelAmount.text = "Rp 0"
            notFoundView.addButton.setTitle("Tambah Penggunaan", for: .normal)
            labelBalance.text = "Rp 0"
        } else {
            notFoundView.isHidden = true
//            profile.balance += dataSource.transaction[in
            recentOutcome.labelAmount.text = "Rp  \(self.dataSource.searchRecentOutcome().currencyFormat())"
            recentIncome.labelAmount.text = "Rp  \(self.dataSource.searchRecentIncome().currencyFormat())"
            labelBalance.text = "Rp \(profile.balance.currencyFormat())"
        }
    }
    
}
