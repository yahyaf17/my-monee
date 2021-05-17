//
//  PopUpViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 16/05/21.
//

import UIKit

class PopUpViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doSave(_ sender: Any) {
        let editProfile = EditProfileViewController(nibName: "EditProfileViewController", bundle: nil)
        editProfile.tempName = nameTextField.text ?? nil
        self.navigationController?.pushViewController(editProfile, animated: true)
    }
    
    @IBAction func doCancel(_ sender: Any) {
        let editProfile = EditProfileViewController(nibName: "EditProfileViewController", bundle: nil)
        self.navigationController?.pushViewController(editProfile, animated: false)
    }
}
