//
//  bookAboutVC.swift
//  newNotitle1
//
//  Created by 정은후 on 2020. 4. 21..
//  Copyright © 2020년 정은후. All rights reserved.
//

import UIKit

class bookAboutVC: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet var buttonDescription: UIButton!
    @IBOutlet var buttonClassification: UIButton!
    @IBOutlet var buttonDistribution: UIButton!
    @IBOutlet var buttonCultivation: UIButton!
    @IBOutlet var buttonPhoto: UIButton!

    @IBOutlet var viewContainer: UIView!
    @IBOutlet var buttonClose: UIButton!
    
    var _plant: String = ""
    
    var viewDescription = UIView()
    var viewClassification = UIView()
    var viewDistribution = UIView()
    var viewCultivation = UIView()
    var viewPhoto = UIView()

    var buttonExTag = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideButtonCloseAnimation()
        
        let swipeGestureDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeForButtonClose))
        swipeGestureDown.direction = .down
        swipeGestureDown.delegate = self
        self.view.addGestureRecognizer(swipeGestureDown)
        
        buttonExTag = "description"
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "aboutDescriptionVC") as! aboutDescriptionVC
        vc._plant = _plant
        vc.view.frame = viewContainer.bounds
        viewContainer.insertSubview(vc.view, at: 0)
        self.addChild(vc)
        vc.didMove(toParent: self)
        viewDescription = vc.view
    }
    
    func hideButtonCloseAnimation() {
        UIView.animate(withDuration: 0.5, delay: 2.0, options: [.curveLinear, .allowUserInteraction], animations: { [weak self] in
            self?.buttonClose.alpha = 0.1
        })
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.5, execute: { [weak self] in
            self?.buttonClose.alpha = 0.0
        })
    }
    
    @objc func swipeForButtonClose() {
        if buttonClose.alpha < 1 {
            UIView.animate(withDuration: 0.5, animations: {
                self.buttonClose.alpha = 1
            }, completion: { (finished: Bool) in
                self.hideButtonCloseAnimation()
            })
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    
    @IBAction func clickClose(_ sender: UIButton) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "searchVC") as? searchVC else {
            return
        }
        rvc.modalPresentationStyle = .overCurrentContext
        rvc.modalTransitionStyle = .crossDissolve
        
        if var topController = UIApplication.shared.windows.filter({$0.isKeyWindow}).first!.rootViewController  {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.present(rvc, animated: true, completion: nil)
        }
    }
    
    
    func buttonClickAnimation(_ tag: String) {
        if tag == "description" {
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonDescription.alpha = 0.3
                self.viewDescription.alpha = 0.0
            }, completion: { (finished: Bool) in
                self.viewDescription.isHidden = true
            })
        }
        else if tag == "classification" {
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonClassification.alpha = 0.3
                self.viewClassification.alpha = 0.0
            }, completion: { (finished: Bool) in
                self.viewClassification.isHidden = true
            })
        }
        else if tag == "distribution" {
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonDistribution.alpha = 0.3
                self.viewDistribution.alpha = 0.0
            }, completion: { (finished: Bool) in
                self.viewDistribution.isHidden = true
            })
        }
        else if tag == "cultivation" {
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonCultivation.alpha = 0.3
                self.viewCultivation.alpha = 0.0
            }, completion: { (finished: Bool) in
                self.viewCultivation.isHidden = true
            })
        }
        else if tag == "photo" {
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonPhoto.alpha = 0.3
                self.viewPhoto.alpha = 0.0
            }, completion: { (finished: Bool) in
                self.viewPhoto.isHidden = true
            })
        }
    }
    
    @IBAction func clickDescription(_ sender: UIButton) {
        // view 존재 X -> 초기 생성
        if viewDescription.subviews.count == 0 {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "aboutDescriptionVC") as! aboutDescriptionVC
            vc._plant = _plant
            vc.view.frame = viewContainer.bounds
            viewContainer.insertSubview(vc.view, at: 0)
            self.addChild(vc)
            vc.didMove(toParent: self)
            viewDescription = vc.view
        }
        
        viewDescription.isHidden = false
        viewDescription.alpha = 0.0
        UIView.animate(withDuration: 0.4, animations: {
            self.buttonDescription.alpha = 1.0
            self.viewDescription.alpha = 1.0
        })
        
        buttonClickAnimation(buttonExTag)
        buttonExTag = "description"
    }
    @IBAction func clickClassification(_ sender: UIButton) {
        // view 존재 X -> 초기 생성
        if viewClassification.subviews.count == 0 {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "aboutClassificationVC") as! aboutClassificationVC
            vc._plant = _plant
            vc.view.frame = viewContainer.bounds
            viewContainer.insertSubview(vc.view, at: 0)
            self.addChild(vc)
            vc.didMove(toParent: self)
            viewClassification = vc.view
        }
        
        viewClassification.isHidden = false
        viewClassification.alpha = 0.0
        UIView.animate(withDuration: 0.4, animations: {
            self.buttonClassification.alpha = 1.0
            self.viewClassification.alpha = 1.0
        })
        
        buttonClickAnimation(buttonExTag)
        buttonExTag = "classification"
    }
    @IBAction func clickDistribution(_ sender: UIButton) {
        // view 존재 X -> 초기 생성
        if viewDistribution.subviews.count == 0 {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "aboutDistributionVC") as! aboutDistributionVC
            vc._plant = _plant
            vc.view.frame = viewContainer.bounds
            viewContainer.insertSubview(vc.view, at: 0)
            self.addChild(vc)
            vc.didMove(toParent: self)
            viewDistribution = vc.view
        }
        
        viewDistribution.isHidden = false
        viewDistribution.alpha = 0.0
        UIView.animate(withDuration: 0.4, animations: {
            self.buttonDistribution.alpha = 1.0
            self.viewDistribution.alpha = 1.0
        })
        
        buttonClickAnimation(buttonExTag)
        buttonExTag = "distribution"
    }
    @IBAction func clickCultivation(_ sender: UIButton) {
        // view 존재 X -> 초기 생성
        if viewCultivation.subviews.count == 0 {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "aboutCultivationVC") as! aboutCultivationVC
            vc._plant = _plant
            vc.view.frame = viewContainer.bounds
            viewContainer.insertSubview(vc.view, at: 0)
            self.addChild(vc)
            vc.didMove(toParent: self)
            viewCultivation = vc.view
        }
        
        viewCultivation.isHidden = false
        viewCultivation.alpha = 0.0
        UIView.animate(withDuration: 0.4, animations: {
            self.buttonCultivation.alpha = 1.0
            self.viewCultivation.alpha = 1.0
        })
        
        buttonClickAnimation(buttonExTag)
        buttonExTag = "cultivation"
    }
    @IBAction func clickPhoto(_ sender: UIButton) {
        // view 존재 X -> 초기 생성
        if viewPhoto.subviews.count == 0 {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "aboutPhotoVC") as! aboutPhotoVC
            vc._plant = _plant
            vc.view.frame = viewContainer.bounds
            viewContainer.insertSubview(vc.view, at: 0)
            self.addChild(vc)
            vc.didMove(toParent: self)
            viewPhoto = vc.view
        }
        
        viewPhoto.isHidden = false
        viewPhoto.alpha = 0.0
        UIView.animate(withDuration: 0.4, animations: {
            self.buttonPhoto.alpha = 1.0
            self.viewPhoto.alpha = 1.0
        })
        
        buttonClickAnimation(buttonExTag)
        buttonExTag = "photo"
    }
}
