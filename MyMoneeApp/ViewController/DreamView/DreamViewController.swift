//
//  DreamViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 13/05/21.
//

import UIKit

class DreamViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var notFoundView: NotFoundView!
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.sendSubviewToBack(notFoundView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let color = UIColor(red: 240/255,
                            green: 242/255,
                            blue: 248/255,
                            alpha: 1)
        tableView.separatorColor = color
        
        let uiNib = UINib(nibName: String(describing: DreamTableViewCell.self), bundle: nil)
        tableView.register(uiNib, forCellReuseIdentifier: String(describing: DreamTableViewCell.self))
        
        // Empty data handling
        if dreams.isEmpty {
            notFoundView.isHidden = false
            notFoundView.addButton.setTitle("Buat Impian", for: .normal)
            notFoundView.notFoundLabel.text = "Data kamu kosong, Yuk mulai buat Impian kamu!"
            tableView.isHidden = true
            notFoundView.contentView.backgroundColor = UIColor(red: 240/255,
                                                               green: 242/255,
                                                               blue: 248/255,
                                                               alpha: 1)
            notFoundView.mainContent.backgroundColor = UIColor(red: 240/255,
                                                               green: 242/255,
                                                               blue: 248/255,
                                                               alpha: 1)
        } else {
            notFoundView.isHidden = true
        }
        
        notFoundView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dreams.count
    }
    
    fileprivate func showConfirmButton(_ progressBar: Float, _ cell: DreamTableViewCell) {
        if progressBar >= 1 {
            cell.confirmDreamButton.imageView?.image = UIImage(named: "ic_check_enable")
            cell.confirmDreamButton.isEnabled = true
        } else {
            cell.confirmDreamButton.imageView?.image = UIImage(named: "ic_check_disable")
            cell.confirmDreamButton.isEnabled = false
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DreamTableViewCell.self), for: indexPath) as! DreamTableViewCell
        cell.labelDreamTitle.text = dreams[indexPath.row].title
        let stringAmount = profile.balance.currencyFormatISO()
        let stringTotalAmount = dreams[indexPath.row].totalAmount.currencyFormatISO()
        cell.labelDreamAmount.text = "\(stringAmount) / \(stringTotalAmount)"
        let progressBar = profile.balance / dreams[indexPath.row].totalAmount
        cell.progressDream.setProgress(progressBar, animated: false)
        cell.layer.cornerRadius = 10
        cell.delegate = self
        cell.confirmDreamButton.tag = indexPath.row
        cell.deleteDreamButton.tag = indexPath.row
        showConfirmButton(progressBar, cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dreamVc = DreamDetailsViewController(nibName: "DreamDetailsViewController", bundle: nil)
        dreamVc.selectedRow = indexPath.row
        dreamVc.selectedDream = dreams[indexPath.row]
        self.navigationController?.pushViewController(dreamVc, animated: true)
    }
    
    @IBAction func toAddView(_ sender: Any) {
        let addView = AddDreamViewController(nibName: "AddDreamViewController", bundle: nil)
        self.navigationController?.pushViewController(addView, animated: true)
    }
    
    func refreshTab() {
        let TabViewController = MainTabBarController(nibName: "MainTabBarController", bundle: nil)
         TabViewController.selectedIndex = 1
        UIApplication.shared.keyWindow?.rootViewController = TabViewController
    }
}

extension DreamViewController: NotFoundDelegate {
    func addData() {
        toAddView((Any).self)
    }
}

extension DreamViewController: DreamButtonDelegate {
    func deleteDream(button: UIButton) {
        dreams.remove(at: button.tag)
        tableView.reloadData()
        refreshTab()
    }
    
    func achieveDream(button: UIButton) {
        let currentDream = dreams[button.tag]
        let newRecord = Transaction(id: String(currentDream.id),
                                title: currentDream.title,
                                price: currentDream.totalAmount,
                                date: currentDate,
                                image: false,
                                type: false)
        transactionList.insert(newRecord, at: 0)
//        profile.balance -= currentDream.totalAmount
        dreams.remove(at: button.tag)
        tableView.reloadData()
        refreshTab()
    }
}
