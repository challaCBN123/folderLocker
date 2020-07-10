//
//  FilesVC.swift
//  FolderLocker
//
//  Created by Bhargava on 07/07/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit

class FilesVC: UIViewController {
     let menuArray = ["Images","Pdfs","Excels","Others"]
    @IBOutlet weak var menuTableList: UITableView!
    @IBOutlet weak var grid_View: UIView!
    @IBOutlet weak var gridViewHeight: NSLayoutConstraint!
    @IBOutlet weak var list_View : UIView!
    @IBOutlet weak var cameraBtn : UIButton!
    @IBOutlet weak var menuStyle : UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableList.separatorStyle = .none
        grid_View.isHidden = true
        self.navigationItem.hidesBackButton = true
        if UIScreen.main.bounds.height < 600{
                          self.gridViewHeight.constant = 280
                      }
        self.registerCell()
    }
    func registerCell(){
        let nibName = UINib(nibName: "listCell", bundle: nil)
        menuTableList.register(nibName, forCellReuseIdentifier: "listCell")
    }
    @IBAction func didTapStyle(_ sender: UIBarButtonItem) {
        if grid_View.isHidden == true {
            UIView.animate(withDuration: 0.5, animations: {
                self.list_View.isHidden = true
            }) { (done) in
                if done{
                    self.grid_View.isHidden = false
                }
            }
        } else if list_View.isHidden == true {
            UIView.animate(withDuration: 0.5, animations: {
                self.grid_View.isHidden = true
            }) { (done) in
                if done{
                    self.list_View.isHidden = false
                }
            }
        }
    }
    @IBAction func didTapImages(_ sender: UIButton) {
    }
    @IBAction func didTapPdf(_ sender: UIButton) {
    }
    
    @IBAction func didTapExcel(_ sender: UIButton) {
    }
    @IBAction func didTapOthers(_ sender: UIButton) {
    }
    @IBAction func didTapCameraAction(_ sender: UIButton) {
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension FilesVC : UITableViewDelegate,UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableList.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! listCell
        cell.menuListLbl.text = menuArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
