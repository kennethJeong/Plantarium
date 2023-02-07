//
//  bookPartsFunctions.swift
//  newNotitle1
//
//  Created by 정은후 on 2021/02/10.
//  Copyright © 2021 정은후. All rights reserved.
//

import UIKit

class bookPartsFunctions {
    // labelMain의 text 변경 함수
    //
    func setLabelMain(_ labelMain: UILabel, _ newLabelMainText: String) {
        labelMain.text = newLabelMainText
        UIView.animate(withDuration: 0.2, animations: {
            labelMain.alpha = 0
        })
        UIView.animate(withDuration: 0.2, animations: {
            labelMain.alpha = 1
        })
    }
    

}
