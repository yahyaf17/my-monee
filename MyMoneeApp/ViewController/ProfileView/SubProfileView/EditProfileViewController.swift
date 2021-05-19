//
//  EditProfileViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 16/05/21.
//

import UIKit

class EditProfileViewController: UIViewController {

    var imagePicker: ImagePicker!
    var updateImage: UIImage?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var profileView: ProfileView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var notUsedName: UILabel!
    @IBOutlet weak var editNameButton: UIButton!
    @IBOutlet weak var imagePickerButton: UIButton!
    @IBOutlet weak var imagePickerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileView.bringSubviewToFront(saveButton)
        profileView.bringSubviewToFront(editNameButton)
        profileView.bringSubviewToFront(imagePickerView)

        notUsedName.text = profile.name
        profileView.labelName.text = profile.name
        
        NotificationCenter.default.addObserver(self, selector: #selector(EditProfileViewController.ChangeText), name: NSNotification.Name(rawValue: "refresh"), object: nil)
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        profileView.imageProfile.image = profile.image
    }
    

//    func implementTempName(){
//        if let name = tempName {
//            profileView.labelName.text = name
//            notUsedName.text = name
//        } else {
//            profileView.labelName.text = profile.name
//            notUsedName.text = profile.name
//        }
//    }
//
//    func updateNameToModel() {
//        if let name = tempName {
//            profile.name = name
//            profile.image = updateImage
//        }
//    }

    @IBAction func saveEditButton(_ sender: Any) {
        let TabViewController = MainTabBarController(nibName: "MainTabBarController", bundle: nil)
        TabViewController.selectedIndex = 2
        UIApplication.shared.keyWindow?.rootViewController = TabViewController
    }

    @IBAction func doEditName(_ sender: Any) {
        let popUpEditName = PopUpViewController(nibName: "PopUpViewController", bundle: nil)
        popUpEditName.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        popUpEditName.view.frame = self.view.frame
        self.present(popUpEditName, animated: true, completion: nil)
    }


    @IBAction func showImagePicker(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
    
    @objc func ChangeText() {
        DispatchQueue.main.async {
        self.profileView.labelName.text = profile.name
        }
    }
}

extension EditProfileViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        self.imageView.image = image
        self.profileView.imageProfile.image = image
    }
}
