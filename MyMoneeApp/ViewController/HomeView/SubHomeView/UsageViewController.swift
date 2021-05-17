//
//  UsageViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 14/05/21.
//

import UIKit

class UsageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var titleView: TitleView!
    @IBOutlet weak var amountView: TitleView!
    @IBOutlet weak var usageCollection: UICollectionView!
    
    var categories: [Category] = [
        Category(title: .income, image: "arrow_upward"),
        Category(title: .outcome, image: "arrow_downward")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleView.labelTitle.text = "Judul"
        titleView.textFieldDetails.text = "Gaji"
        amountView.labelTitle.text = "Jumlah (Rp)"
        amountView.textFieldDetails.text = "1.250.000"
        
        // CategoryCollectionView
        usageCollection.delegate = self
        usageCollection.dataSource = self
        
        let uiNib = UINib(nibName: String(describing: CategoryCollectionViewCell.self), bundle: nil)
        usageCollection.register(uiNib, forCellWithReuseIdentifier: String(describing: CategoryCollectionViewCell.self))
    }

    @IBAction func backToHome(_ sender: Any) {
        let TabViewController = MainTabBarController(nibName: "MainTabBarController", bundle: nil)
         TabViewController.selectedIndex = 0
         UIApplication.shared.keyWindow?.rootViewController = TabViewController
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CategoryCollectionViewCell.self), for: indexPath) as! CategoryCollectionViewCell
        cell.labelCategory.text = categories[indexPath.row].title.rawValue
        cell.imageCategory.image = UIImage(named: categories[indexPath.row].image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: 75)
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        let disableSaveButton = sender as? UIButton
        disableSaveButton?.backgroundColor = .lightGray
        disableSaveButton?.isUserInteractionEnabled = false
        disableSaveButton?.isEnabled = false
    }
    
}
