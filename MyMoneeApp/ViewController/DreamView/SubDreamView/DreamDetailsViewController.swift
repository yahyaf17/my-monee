//
//  DreamDetailsViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 15/05/21.
//

import UIKit

class DreamDetailsViewController: UIViewController {

    var selectedRow: Int!
    var selectedDream: Dream!
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var detailsView: DetailsView!
    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var labelProgress: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var progressTrack: UIProgressView!
    @IBOutlet weak var progressAmount: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Round View
        roundView.layer.cornerRadius = 30
        roundView.layer.masksToBounds = true
        roundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        // Show to Display
        detailsView.iconImage.image = UIImage(named: "dream_details")
        
        // Appeareance
        parentView.bringSubviewToFront(detailsView)
        detailsView.bringSubviewToFront(editButton)
        backButtonAppearance(button: backButton)
        
        // Shadow Effect for UIView
        shadowEffect(view: progressView)
        shadowEffect(view: detailsView.iconView)
        
        // Show or hidden Confirm Button
        showButton(button: confirmButton)
        
        // Data
        detailsView.labelTitle.text = selectedDream.title
        let stringTotalAmount = currencyFormatISO(value: selectedDream.totalAmount)
        detailsView.labelAmount.text =  stringTotalAmount
        detailsView.labelTabSection.text = "Impian"
        checkProgress()
        progressAmount.text = "IDR \(profile.balance) / \(stringTotalAmount)"
        progressTrack.setProgress((profile.balance / selectedDream.totalAmount), animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func doBackButton(_ sender: Any) {
        let TabViewController = MainTabBarController(nibName: "MainTabBarController", bundle: nil)
         TabViewController.selectedIndex = 1
         UIApplication.shared.keyWindow?.rootViewController = TabViewController
    }
    
    
    @IBAction func doEdit(_ sender: UIButton) {
        let editView = EditDreamViewController(nibName: "EditDreamViewController", bundle: nil)
        editView.dreamTitle = selectedDream.title
        editView.dreamTarget = selectedDream.totalAmount
        editView.selectedRow = selectedRow
        editView.selectedDream = selectedDream
        self.navigationController?.pushViewController(editView, animated: true)
    }
    
    
    @IBAction func doConfirm(_ sender: Any) {
        let newRecord = History(id: String(selectedDream.id), title: selectedDream.title, price: selectedDream.totalAmount, date: currentDate, image: false, type: .outcome)
        histories.insert(newRecord, at: 0)
        let amountInt = selectedDream.totalAmount
        let balanceInt = profile.balance
        let updateBalance = balanceInt - amountInt
        profile.balance = updateBalance
        recentOutcomeTrx = selectedDream.totalAmount
        dreams.remove(at: selectedRow)
    }
    
    private func backButtonAppearance(button: UIButton) {
        button.backgroundColor = .clear
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(red: 80/255, green: 105/255, blue: 185/255, alpha: 1).cgColor
    }
    
    private func shadowEffect(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 3
    }
    
    private func showButton(button: UIButton) {
        if selectedDream.progress != 1 {
            button.isHidden = true
        }
    }
    
    private func checkProgress() {
        let progress = (profile.balance / selectedDream.totalAmount)
        if progress > 1 {
            labelProgress.text = String(Float(100.00))+"%"
        } else {
            return labelProgress.text = String(Float(round(progress * 100)))+"%"
        }
    }
    
}
