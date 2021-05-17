//
//  ProfileViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 14/05/21.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var profileView: ProfileView!
    @IBOutlet weak var editButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileView.bringSubviewToFront(editButton)
        
        profileView.editPhotoButton.isHidden = true
        
        profileView.labelName.text = profile.name
    }
    
    
    @IBAction func doEdit(_ sender: Any) {
        let editProfileView = EditProfileViewController(nibName: "EditProfileViewController", bundle: nil)
        self.navigationController?.pushViewController(editProfileView, animated: false)
    }
}
