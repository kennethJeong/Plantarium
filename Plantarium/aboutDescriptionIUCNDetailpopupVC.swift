//
//  aboutDescriptionIUCNDetailpopupVC.swift
//  newNotitle1
//
//  Created by 정은후 on 2021/01/06.
//  Copyright © 2021 정은후. All rights reserved.
//

import UIKit

class aboutDescriptionIUCNDetailpopupVC: UIViewController {
    @IBOutlet var viewMain: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewMain.layer.cornerRadius = 10.0
        viewMain.layer.borderWidth = 0
        
        viewMain.layer.shadowColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0).cgColor
        viewMain.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        viewMain.layer.shadowRadius = 8
        viewMain.layer.shadowOpacity = 0.3
        
        for subview in viewMain.subviews {
            for button in subview.subviews {
                if button is UIButton {
                    button.layer.cornerRadius = 8.0
                    button.isUserInteractionEnabled = false
                }
            }
        }
    }
    
    @IBAction func dismissView(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
