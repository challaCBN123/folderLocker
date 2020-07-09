//
//  FilesVC.swift
//  FolderLocker
//
//  Created by Bhargava on 07/07/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit

class FilesVC: UIViewController {
@IBOutlet weak var cameraBtn : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
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
