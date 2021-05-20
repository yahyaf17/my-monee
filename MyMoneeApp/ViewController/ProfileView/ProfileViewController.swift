//
//  ProfileViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 14/05/21.
//

import UIKit

class ProfileViewController: UIViewController {

    var updateImage: UIImage?
    
    @IBOutlet weak var profileView: ProfileView!
    @IBOutlet weak var editButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileView.bringSubviewToFront(editButton)
        
//        profileView.editPhotoButton.isHidden = true
        profileView.imageProfile.image = profile.image
        profileView.labelName.text = profile.name
        usageMessage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        profileView.imageProfile.image = profile.image
    }
    
    @IBAction func doEdit(_ sender: Any) {
        let editProfileView = EditProfileViewController(nibName: "EditProfileViewController", bundle: nil)
        self.navigationController?.pushViewController(editProfileView, animated: false)
    }
    
    func usageMessage() {
        if profile.balance > 0 {
            profileView.labelMessage.text = "Bagus! Pengeluaranmu lebih sedikit dari Pemasukan"
        } else if profile.balance == 0 {
            profileView.labelMessage.text = "Oops! Saldo kamu 0 nih! Tingkat lagi pemasukanmu"
        } else {
            profileView.labelMessage.text = "Oh tidak! Saldo kamu negatif! Yuk tingkatkan lagi manajemen uangmu!"
        }
    }
}
