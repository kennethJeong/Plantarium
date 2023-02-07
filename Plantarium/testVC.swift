//
//  testVC.swift
//  newNotitle1
//
//  Created by 정은후 on 2020. 3. 20..
//  Copyright © 2020년 정은후. All rights reserved.
//

import UIKit
import RealmSwift

class testVC: UIViewController {
    @IBOutlet var viewMain: UIView!
    
    @IBOutlet var btnGo: UIButton!
    @IBOutlet var btn: UIButton!
    
    override func viewDidLoad() {
        btnGo.addTarget(self, action: #selector(clickButtonGo), for: .touchUpInside)
        btn.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(clickButton), name: NSNotification.Name(rawValue: "clickBackAt1stView"), object: nil)
        
        
        let file = Bundle.main.resourcePath! + "/morphology/flower/flower type/basic/sex_Diecious_C.png"
        let imageName = file
        let image = UIImage(named: imageName)
        
        let button = UIButton()

//        let imageOrigin = CIImage(image: UIImage(named: imageName)!)
//        if let filter = CIFilter(name: "CIColorInvert") {
//            filter.setValue(imageOrigin, forKey: kCIInputImageKey)
//            let invertedImage = UIImage(ciImage: filter.outputImage!)
//
//            button.setImage(invertedImage, for: .normal)
//        }
//
        let invertedImage = image?.inverseImage(cgResult: false)
        button.setImage(invertedImage, for: .normal)
        
        button.backgroundColor = .black
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        button.addTarget(self, action: #selector(abc), for: .touchUpInside)
        button.contentMode = .scaleAspectFit
        viewMain.addSubview(button)
    }
    
    @objc func abc() {
        print("11")
    }
    
    @objc func clickButtonGo() {
        print("-- Go To 2nd View --")
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "testVC2") as! testVC2
        vc.btn = btn
        vc.initBtnBackAction = NSStringFromSelector(#selector(clickButton))
        vc.view.frame = viewMain.bounds
        self.view.addSubview(vc.view)
        self.addChild(vc)
        vc.didMove(toParent: self)
    }
    
    @objc func clickButton() {
        print("-- This is 1st View --")
    }
}

extension UIImage {
    func inverseImage(cgResult: Bool) -> UIImage? {
        let coreImage = self.ciImage
        guard let filter = CIFilter(name: "CIColorInvert") else { return nil }
        filter.setValue(coreImage, forKey: kCIInputImageKey)
        guard let result = filter.value(forKey: kCIOutputImageKey) as? UIKit.CIImage else { return nil }
        if cgResult { // I've found that UIImage's that are based on CIImages don't work with a lot of calls properly
            return UIImage(cgImage: CIContext(options: nil).createCGImage(result, from: result.extent)!)
        }
        return UIImage(ciImage: result)
    }
}
