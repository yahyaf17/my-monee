//
//  HomeViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 13/05/21.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var recentIncome: RecentView!
    @IBOutlet weak var recentOutcome: RecentView!
    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelBalance: UILabel!
    @IBOutlet weak var greetingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greeting()
        labelName.text = profile.name
        
        labelBalance.text = "Rp  \(currencyFormat(value: profile.balance))"
    
        // Rounded View
        roundView.layer.cornerRadius = 30
        roundView.layer.masksToBounds = true
        roundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        // RecentIncome
        recentIncome.imageStatus.image = UIImage(named: "arrow_upward")
        recentIncome.labelStatus.text = "Uang Keluar"
        recentIncome.labelAmount.text = "Rp 1.250.000"
        
        // RecentOutcome
        recentOutcome.imageStatus.image = UIImage(named: "arrow_downward")
        recentOutcome.labelStatus.text = "Uang Keluar"
        recentOutcome.labelAmount.text = "Rp 256.000"
        
        // TableView
        tableView.delegate = self
        tableView.dataSource = self
        
        let uiNib = UINib(nibName: String(describing: HistoryTableViewCell.self), bundle: nil)
        tableView.register(uiNib, forCellReuseIdentifier: String(describing: HistoryTableViewCell.self))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return histories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HistoryTableViewCell.self), for: indexPath) as! HistoryTableViewCell
        cell.labelName.text = histories[indexPath.row].title
//        cell.labelAmount.text = histories[indexPath.row].price
        cell.labelDate.text = histories[indexPath.row].date
        imageViewColor(cell: cell, indexPath: indexPath)
        return cell
    }
    
    private func imageViewColor(cell: HistoryTableViewCell, indexPath: IndexPath) {
        if histories[indexPath.row].image {
            cell.iconImage.image = UIImage(named: "arrow_upward")
            cell.iconView.backgroundColor = UIColor(red: 33/255, green: 150/255, blue: 83/255, alpha: 0.2)
            cell.labelAmount.textColor = UIColor(red: 33/255, green: 150/255, blue: 83/255, alpha: 1)
            cell.labelAmount.text = "+Rp \(currencyFormat(value: histories[indexPath.row].price))"
        } else {
            cell.iconImage.image = UIImage(named: "arrow_downward")
            cell.iconView.backgroundColor = UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 0.2)
            cell.labelAmount.textColor = UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 1)
            cell.labelAmount.text = "-Rp \(currencyFormat(value: histories[indexPath.row].price))"
        }
    }
    
    @IBAction func toAddView(_ sender: Any) {
        let addView = UsageViewController(nibName: "UsageViewController", bundle: nil)
        self.navigationController?.pushViewController(addView, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc = DetailsViewController(nibName: "DetailsViewController", bundle: nil)
        dvc.idHistory = histories[indexPath.row].id
        dvc.historyTitle = histories[indexPath.row].title
        dvc.amount = histories[indexPath.row].price
        dvc.date = histories[indexPath.row].date
        dvc.type = histories[indexPath.row].type
        let dvcNavigation = UINavigationController(rootViewController: dvc)
        dvcNavigation.setNavigationBarHidden(true, animated: true)
        dvcNavigation.modalPresentationStyle = .fullScreen
        self.present(dvcNavigation, animated: true, completion: nil)
    }
    
    func greeting() {
        var currentTimeOfDay = ""
        let hour = NSCalendar.current.component(.hour, from: NSDate() as Date)
        if hour >= 0 && hour < 12 {
            currentTimeOfDay = "Pagi"
        } else if hour >= 12 && hour < 17 {
            currentTimeOfDay = "Siang"
        } else if hour >= 18 {
            currentTimeOfDay = "Malam"
        }
        greetingLabel.text = "Selamat \(currentTimeOfDay),"
        }
}