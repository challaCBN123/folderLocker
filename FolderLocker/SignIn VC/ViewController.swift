//
//  ViewController.swift
//  FolderLocker
//
//  Created by Bhargava on 07/07/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
import FirebaseAuth
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
        let email = emialField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if emialField.text == "" && passwordField.text == ""{
            showAlert(title: "Empty Fields", message: "Enter Email And Password")
        }else if emialField.text == "" && passwordField.text != ""{
                   showAlert(title: "Empty Email Field", message: "Enter Email")
        }else if emialField.text != "" && passwordField.text == ""{
            showAlert(title: "Empty Password Field", message: "Enter Password")
        }else {
            // signing user
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error != nil{
                    self.showAlert(title: "Error", message: "Enter Valid Details")
                }else {
                    
                }
            }
            self.transitinToHome()
        }
        
    }
    func transitinToHome(){
      let homeViewController = storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeVC
               self.navigationController?.pushViewController(homeViewController!, animated: true)
    }
}

