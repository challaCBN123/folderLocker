//
//  SignUpVC.swift
//  FolderLocker
//
//  Created by Bhargava on 07/07/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPswdField: UITextField!
    @IBOutlet weak var  mobileNumberNameField: UITextField!
    @IBOutlet weak var CustomBtn : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
         //self.tabBarController?.navigationItem.hidesBackButton = false
 
    }
    @IBAction func didTapSignUpBtn(_ sender : UIButton){
        
    }
    private func hideLargeTitle(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
