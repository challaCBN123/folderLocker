//
//  HomeVC.swift
//  FolderLocker
//
//  Created by Bhargava on 10/07/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var touchViewLeading: NSLayoutConstraint!
    @IBOutlet weak var subSideTouchView: UIView!
    @IBOutlet weak var subMenuView: UIView!
    @IBOutlet weak var submenuTrail: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction))
        subSideTouchView.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    @objc func tapGestureAction(){
       submenuTrail.constant = -220
              UIView.animate(withDuration: 0.3){
                  self.view.layoutIfNeeded()
              }
        DispatchQueue.main.async {
            self.touchViewLeading.constant = -414
        }
    }
    @IBAction func addFiles(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func settingAction(_ sender: UIButton) {
    }
    @IBAction func signOutAction(_ sender: UIButton) {
    }
    @IBAction func SideMenuAction(_ sender: UIBarButtonItem) {
        if submenuTrail.constant == -220 {
            submenuTrail.constant = 20
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            }) { (_) in
                self.touchViewLeading.constant = 0
            }
        }else if submenuTrail.constant == 20{
            submenuTrail.constant = -220
                         UIView.animate(withDuration: 0.3){
                             self.view.layoutIfNeeded()
                         }
                   DispatchQueue.main.async {
                       self.touchViewLeading.constant = -414
                   }
        }
        
    }
    
    func dummy(){
        if subMenuView.isHidden == true {
                   UIView.animate(withDuration: 1, animations: {
                       self.view.layoutIfNeeded()
                   }) { (_) in
                       self.subMenuView.isHidden = false
                   }
               }else if subMenuView.isHidden == false {
                   UIView.animate(withDuration: 1, animations: {
                    self.view.layoutIfNeeded()
                   }) { (_) in
                        self.subMenuView.isHidden = true
                   }
               }
    }
    

}
