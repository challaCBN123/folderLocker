//
//  ViewController.swift
//  FolderLocker
//
//  Created by Bhargava on 07/07/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var signBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var emialField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyBoardOnTap()
        FieldDelegates()
        if UIScreen.main.bounds.height < 600{
            self.viewHeight.constant = 120
        }
    }
    func FieldDelegates(){
        emialField.delegate = self
        passwordField.delegate = self
    }
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
      textField.resignFirstResponder()
      return true
   }
    @IBAction func didTapSignUpAction(_ sender: UIButton) {
        let signUpVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "SignUpVC") as! SignUpVC
        self.present(signUpVC, animated: true, completion: nil)
    }
    @IBAction func didTapSignInAction(_ sender: UIButton) {
        if emialField.text == "" && passwordField.text == ""{
            showAlert(title: "Empty Fields", message: "Enter Email And Password")
        }else if emialField.text == "" && passwordField.text != ""{
                   showAlert(title: "Empty Email Field", message: "Enter Email")
        }else if emialField.text != "" && passwordField.text == ""{
            showAlert(title: "Empty Password Field", message: "Enter Password")
        }else {
            let HomeVc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "FilesVC") as! FilesVC
            self.navigationController?.pushViewController(HomeVc, animated: true)
        }
        
    }
    
}

