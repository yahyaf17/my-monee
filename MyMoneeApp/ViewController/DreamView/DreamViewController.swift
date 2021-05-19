//
//  DreamViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 13/05/21.
//

import UIKit

class DreamViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NotFoundDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var notFoundView: NotFoundView!
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.sendSubviewToBack(notFoundView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let color = UIColor(red: 240/255, green: 242/255, blue: 248/255, alpha: 1)
        tableView.separatorColor = color
        
        let uiNib = UINib(nibName: String(describing: DreamTableViewCell.self), bundle: nil)
        tableView.register(uiNib, forCellReuseIdentifier: String(describing: DreamTableViewCell.self))
        
        // Empty data handling
        if dreams.isEmpty {
            notFoundView.isHidden = false
            notFoundView.addButton.setTitle("Buat Impian", for: .normal)
            notFoundView.notFoundLabel.text = "Data kamu kosong, Yuk mulai buat Impian kamu!"
            tableView.isHidden = true
            notFoundView.contentView.backgroundColor = UIColor(red: 240/255, green: 242/255, blue: 248/255, alpha: 1)
            notFoundView.mainContent.backgroundColor = UIColor(red: 240/255, green: 242/255, blue: 248/255, alpha: 1)
        } else {
            notFoundView.isHidden = true
        }
        
        notFoundView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dreams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DreamTableViewCell.self), for: indexPath) as! DreamTableViewCell
        cell.labelDreamTitle.text = dreams[indexPath.row].title
        let stringAmount = currencyFormatISO(value: profile.balance)
        let stringTotalAmount = currencyFormatISO(value: dreams[indexPath.row].totalAmount)
        cell.labelDreamAmount.text = "\(stringAmount) / \(stringTotalAmount)"
        let progressBar = profile.balance / dreams[indexPath.row].totalAmount
        cell.progressDream.setProgress(progressBar, animated: false)
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dreamVc = DreamDetailsViewController(nibName: "DreamDetailsViewController", bundle: nil)
        dreamVc.selectedRow = indexPath.row
        dreamVc.selectedDream = dreams[indexPath.row]
        let dvcNavigation = UINavigationController(rootViewController: dreamVc)
        dvcNavigation.setNavigationBarHidden(true, animated: true)
        dvcNavigation.modalPresentationStyle = .fullScreen
        self.present(dvcNavigation, animated: true, completion: nil)
    }
    
    @IBAction func toAddView(_ sender: Any) {
        let addView = AddDreamViewController(nibName: "AddDreamViewController", bundle: nil)
        self.navigationController?.pushViewController(addView, animated: true)
    }
    
    func addData() {
        toAddView((Any).self)
    }
}
