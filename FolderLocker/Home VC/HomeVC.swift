//
//  HomeVC.swift
//  FolderLocker
//
//  Created by Bhargava on 10/07/20.
//  Copyright © 2020 Bhargava. All rights reserved.
// URL to image upload - gs://folderlocker-a16a3.appspot.com

import UIKit
import FirebaseAuth
import FirebaseStorage
class HomeVC: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    let data : [String] = ["Owen","Dylan","Luke","Gabriel","Anthony","Isaac","Grayson","Jack","Julian",
    "Levi","Aaran", "Aaren", "Aarez", "Aarman", "Aaron", "Aaron-James", "Aarron", "Aaryan", "Aaryn", "Aayan", "Aazaan", "Abaan"]
    let date = Date()
    let format = DateFormatter()
    var image : UIImage? = nil
    
    var imagePicker = UIImagePickerController()
    @IBOutlet weak var audioTable_View: UITableView!
    @IBOutlet weak var tbl_View: UITableView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var touchViewLeading: NSLayoutConstraint!
    @IBOutlet weak var subSideTouchView: UIView!
    @IBOutlet weak var subMenuView: UIView!
    @IBOutlet weak var submenuTrail: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        tbl_View.delegate = self
        tbl_View.dataSource = self
        audioTable_View.delegate = self
        audioTable_View.dataSource = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction))
        subSideTouchView.addGestureRecognizer(tapGesture)
      
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
 
   func openCamera()
   {
    if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
       {
        imagePicker.sourceType = UIImagePickerController.SourceType.camera
           //imagePicker.allowsEditing = true
           self.present(imagePicker, animated: true, completion: nil)
       }
       else
       {
           let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           self.present(alert, animated: true, completion: nil)
       }
   }

    func openGallery()
   {
       if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
           let imagePicker = UIImagePickerController()
           imagePicker.delegate = self
           //imagePicker.allowsEditing = true
           imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
           self.present(imagePicker, animated: true, completion: nil)
       }
       else
       {
           let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           self.present(alert, animated: true, completion: nil)
       }
   }
  
    
    @IBAction func addFiles(_ sender: UIBarButtonItem) {
        
        print("Today date and Time : \(format.string(from: date))")
     let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
     alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
         self.openCamera()
        
     }))

     alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
        self.openGallery()
        
     }))

     alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))

     self.present(alert, animated: true, completion: nil)
        
    }
    //MARK:-- ImagePicker delegate
          func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            format.dateFormat = "EEEE, MMMM dd,yyyy - HH:mm:ss"
//            if let imagesUrl = info[UIImagePickerController.InfoKey.imageURL] as? String{
//            }
          if let pickedImage = info[.originalImage] as? UIImage {
              // imageViewPic.contentMode = .scaleToFill
            

          }
            
          picker.dismiss(animated: true, completion: nil)
      }
    
      func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
      picker.dismiss(animated:  true, completion: nil)
      }
    func uploadImages(){
    
    }
    @IBAction func settingAction(_ sender: UIButton) {
    }
    @IBAction func signOutAction(_ sender: UIButton) {
          let firebaseAuth = Auth.auth()
            do {
              try firebaseAuth.signOut()
                LoginScreen()
            } catch let signOutError as NSError {
              print ("Error signing out: %@", signOutError)
            }
       
    }
    func LoginScreen(){

               // MARK :- signOut method to goto loginView
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let todayViewController: UIViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let navigationController = self.navigationController!
        navigationController.setViewControllers([todayViewController], animated: true)
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
    
}

extension HomeVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        switch tableView {
             
         case tbl_View:
             return 2
        case audioTable_View :
            return data.count
         default:
             print("section not created")
         }
        return 0
      }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        format.dateFormat = "EEEE, MMMM dd,yyyy - HH:mm:ss"
        //print("Today date and Time : \(format.string(from: date))")
        switch tableView{
        case tbl_View:
            if indexPath.row == 0 {
                       let Imagecell = tbl_View.dequeueReusableCell(withIdentifier: "HomeTableCell", for: indexPath) as! HomeTableCell
                                     return Imagecell
                   } else if indexPath.row == 1{
                       let Videocell = tbl_View.dequeueReusableCell(withIdentifier: "VideoTableViewCell", for: indexPath) as! VideoTableViewCell
                       return Videocell
                   }
          
        case audioTable_View :
            let Audiocell = audioTable_View.dequeueReusableCell(withIdentifier: "AudioTableViewCell", for: indexPath) as! AudioTableViewCell
            DispatchQueue.main.async {
                Audiocell.audioCellLbl.text = self.data[indexPath.row] + "   \(self.format.string(from: self.date))"
            }
            
            return Audiocell
            
            
        default:
            print("data not created")
        }
            return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        switch tableView {

        case tbl_View:
            return 150
        case audioTable_View :
            return 38
        default:
            print("height not created")
        }
         return 38
    }
}
