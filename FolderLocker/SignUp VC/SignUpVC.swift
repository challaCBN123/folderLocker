//
//  SignUpVC.swift
//  FolderLocker
//
//  Created by Bhargava on 07/07/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
class SignUpVC: UIViewController {
    // to store the current active textfield
     var activeTextField : UITextField? = nil
    
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPswdField: UITextField!
    @IBOutlet weak var  mobileNumberNameField: UITextField!
    @IBOutlet weak var CustomBtn : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyBoardOnTap()
 FieldDelegates()
        if UIScreen.main.bounds.height < 600{
                   self.viewHeight.constant = 250
               }
        notificationCenter()
        btnANimation(btn:CustomBtn )
    }
    func btnANimation(btn:UIButton){
              UIView.animate(withDuration: 0.6,
                     animations: {
                         btn.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
                     },
                     completion: { _ in
                         UIView.animate(withDuration: 0.6) {
                             btn.transform = CGAffineTransform.identity
                         }
                     })
          }
    func notificationCenter(){
        // call the 'keyboardWillShow' function when the view controller receive notification that keyboard is going to be shown
        NotificationCenter.default.addObserver(self, selector: #selector(SignUpVC.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        // call the 'keyboardWillHide' function when the view controlelr receive notification that keyboard is going to be hidden
           NotificationCenter.default.addObserver(self, selector: #selector(SignUpVC.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardWillShow(notification: NSNotification) {
       guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
          // if keyboard size is not available for some reason, dont do anything
          return
        }
        var shouldMoveViewUp = false
        // if active text field is not nil
        if let activeTextField = activeTextField {
          let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY
          let topOfKeyboard = self.view.frame.height - keyboardSize.height
          // if the bottom of Textfield is below the top of keyboard, move up
          if bottomOfTextField > topOfKeyboard {
            shouldMoveViewUp = true
          }
        }
        if(shouldMoveViewUp) {
          self.view.frame.origin.y = 130 - keyboardSize.height
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
      // move back the root view origin to zero
      self.view.frame.origin.y = 0
    }
    func FieldDelegates(){
        firstNameField.delegate = self
        lastNameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
         confirmPswdField.delegate = self
         mobileNumberNameField.delegate = self
     }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
       textField.resignFirstResponder()
       return true
    }
    @IBAction func didTapSignUpBtn(_ sender : UIButton){
        if firstNameField.text == "" && lastNameField.text == "" && emailField.text == "" && passwordField.text == "" && confirmPswdField.text == "" && mobileNumberNameField.text == ""{
            showAlert(title: "All Fields are Empty", message: "Enter All Details")
        }else if firstNameField.text == "" {
                   showAlert(title: "First Name is Empty", message: "Enter First Name")
        }else if lastNameField.text == "" {
                   showAlert(title: "Last Name is Empty", message: "Enter Last Name")
        }else if !isValidEmail(emailField.text!) || emailField.text == ""{
                   showAlert(title: "Email is Empty or Not Valid", message: "Enter valid Email")
        }else if !isValidpassword(passwordField.text!) || passwordField.text == ""{
                   showAlert(title: "Password is Empty or Not Valid", message: "Enter valid Password with 1 Capital letter,1 symbol ")
        }else if confirmPswdField.text != passwordField.text || confirmPswdField.text == ""{
            showAlert(title: "Password Not Matched", message: "Enter Correct Password")
        }else if mobileNumberNameField.text == "" {
            showAlert(title: "Mobile Number is  Empty", message: "Enter Mobile Number")
        }else if !isValidPhone(phone: mobileNumberNameField.text!) || mobileNumberNameField.text!.count != 10{
            showAlert(title: "Mobile Number is Not Valid", message: "Enter Valid Mobile Number")
        }else {
            // crete cleaned data
            let firstName = firstNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             let lastName = lastNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             let mobileNumber = mobileNumberNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // crete user
            Auth.auth().createUser(withEmail: email, password: password) { (results, err) in
                // check for errors
                if err != nil{
                    // There was an error
                    self.showAlert(title: "\(err?.localizedDescription as Any)", message: "Enter Valid Details")
                    print(err?.localizedDescription as Any)
                }else{
                    
                    // user was created successfully.
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstname" : firstName,"lastname": lastName,"mobilenumber" : mobileNumber,"uid":results!.user.uid]) { (error) in
                        if error != nil{
                            // show error message
                        }
                    }
                    self.transitionToHome()
                }
            }
        }
    }
    @IBAction func dismissView(_ sender : UIButton){
        self.dismiss(animated: true, completion: nil)
    }

    // MARK:- Email,Password and Mobile Number Validations.
       func isValidEmail(_ email: String) -> Bool {
             let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
             let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
             return emailPred.evaluate(with: email)
         }
         func isValidpassword(_ mypassword : String) -> Bool
         {
             let passwordreg =  ("(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[@#$%^&*]).{8,}")
             let passwordtesting = NSPredicate(format: "SELF MATCHES %@", passwordreg)
             return passwordtesting.evaluate(with: mypassword)
         }
       func isValidateMobileNo(value: String) -> Bool {
                 let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
                 let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
                 let result = phoneTest.evaluate(with: value)
                 return result
             }
    func isValidPhone(phone: String) -> Bool {
           let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
           let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
           return phoneTest.evaluate(with: phone)
       }
    func transitionToHome() {
        let homeViewController = storyboard?.instantiateViewController(identifier: GotoHomeVC.Storyboard.homeViewController) as? FilesVC
           view.window?.rootViewController = homeViewController
           view.window?.makeKeyAndVisible()
           
       }
}
extension SignUpVC : UITextFieldDelegate {
  // when user select a textfield, this method will be called
  func textFieldDidBeginEditing(_ textField: UITextField) {
    // set the activeTextField to the selected textfield
    self.activeTextField = textField
  }
    
  // when user click 'done' or dismiss the keyboard
  func textFieldDidEndEditing(_ textField: UITextField) {
    self.activeTextField = nil
  }
}
