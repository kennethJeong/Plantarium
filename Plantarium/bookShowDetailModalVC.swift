//
//  bookShowDetailModalVC.swift
//  newNotitle1
//
//  Created by 정은후 on 28/10/2020.
//  Copyright © 2020 정은후. All rights reserved.
//

import UIKit

class bookShowDetailModalVC: UIViewController {
    @IBOutlet var viewBackground: UIView!
    @IBOutlet var viewMain: UIView!
    
    @IBOutlet var labelTop: UILabel!
    @IBOutlet var labelBottom: UILabel!
    @IBOutlet var labelDiscription: UILabel!
    @IBOutlet var imageViewMain: UIImageView!
    
    var imageFileName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewBackground.layer.cornerRadius = 23
        viewBackground.layer.borderWidth = 0
        
        viewBackground.layer.shadowColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0).cgColor
        viewBackground.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        viewBackground.layer.shadowRadius = 8
        viewBackground.layer.shadowOpacity = 0.3
        
        viewMain.layer.cornerRadius = 23
        viewMain.layer.borderWidth = 3
        viewMain.layer.borderColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1.0).cgColor
        
        labelDiscription.sizeToFit()
        
        display()
    }
    
    func display() {
        let sortImageFileName = imageFileName.components(separatedBy: "/")  // == " 이미지 디렉토리 + superTitle 폴더 + mainTitle 폴더 + subTitle 폴더 + (iconTitle_aData_(C or plantGenus)) + .png "
        let countSortImageFileName = sortImageFileName.count
        let imageName = sortImageFileName[countSortImageFileName-1]     // == " iconTitle_aData_(C or plantGenus) + .png "
        let sortImageName = imageName.components(separatedBy: "_")
        let iconTitle = sortImageName[0]
        let aData = sortImageName[1]
        
        labelTop.text = iconTitle.camelCaseToWords()
        labelBottom.text = aData.camelCaseToWords()
        
        imageViewMain.image = UIImage(named: imageFileName)
        
//        // 색상 반전 (= 흑백 반전)
//        let imageOrigin = CIImage(image: UIImage(named: imageFileName)!)
//        if let filter = CIFilter(name: "CIColorInvert") {
//            filter.setValue(imageOrigin, forKey: kCIInputImageKey)
//            let invertedImage = UIImage(ciImage: filter.outputImage!)
//            imageViewMain.image = invertedImage
//        }
        
        displayDiscription()
    }
    
    // 각 label discription 내용
    func displayDiscription() {
        
        
        labelDiscription.text = "This type has tube, cover, wing and almost funnel shape leaf. "
    }
    
    @IBAction func dismissView(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
