//
//  testVC2.swift
//  newNotitle1
//
//  Created by 정은후 on 2021/02/17.
//  Copyright © 2021 정은후. All rights reserved.
//

import UIKit

class testVC2: UIViewController {
    var btn = UIButton()
    var initBtnBackAction = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn.removeTarget(nil, action: nil, for: .allEvents)
        btn.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        print("-- Arrived To 2nd View --")
    }
    
    @objc func goBack() {
        print("-- Go Back To 1st View --")
        
        btn.removeTarget(nil, action: nil, for: .allEvents)
        btn.addTarget(self, action: #selector(clickBackAt1stView), for: .touchUpInside)

        self.view.removeFromSuperview()
    }
    
    @objc func clickBackAt1stView() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "clickBackAt1stView"), object: nil)
    }
}
