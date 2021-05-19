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
        profile.name = nameTextField.text ?? ""
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refresh"), object:nil, userInfo: nil)
    }
    
    @IBAction func doCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
