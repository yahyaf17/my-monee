//
//  EditProfileViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 16/05/21.
//

import UIKit

class EditProfileViewController: UIViewController, EditViewProtocol {

    var tempName:String?
    
    @IBOutlet weak var profileView: ProfileView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var notUsedName: UILabel!
    @IBOutlet weak var editNameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileView.bringSubviewToFront(saveButton)
        profileView.bringSubviewToFront(editNameButton)
        
        notUsedName.text = profile.name

        implementTempName()
    }

    func implementTempName(){
        if let name = tempName {
            profileView.labelName.text = name
            notUsedName.text = name
        } else {
            profileView.labelName.text = profile.name
            notUsedName.text = profile.name
        }
    }
    
    func updateNameToModel() {
        if let name = tempName {
            profile.name = name
        } 
    }
    
    @IBAction func saveEditButton(_ sender: Any) {
        let TabViewController = MainTabBarController(nibName: "MainTabBarController", bundle: nil)
        updateNameToModel()
         TabViewController.selectedIndex = 2
         UIApplication.shared.keyWindow?.rootViewController = TabViewController
    }
    
    @IBAction func doEditName(_ sender: Any) {
        let popUpEditName = PopUpViewController(nibName: "PopUpViewController", bundle: nil)
        popUpEditName.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.addChild(popUpEditName)
        popUpEditName.view.frame = self.view.frame
        self.view.addSubview(popUpEditName.view)
    }
    
}
