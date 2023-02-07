//
//  searchVC.swift
//  newNotitle1
//
//  Created by 정은후 on 2020. 5. 21..
//  Copyright © 2020년 정은후. All rights reserved.
//

import UIKit

class searchVC: UIViewController {
    @IBOutlet var viewTop: UIView!
    @IBOutlet var viewTopCenter: UIView!
    @IBOutlet var stackViewInViewTopCenter: UIStackView!
    
    @IBOutlet var buttonTopName: UIButton!
    @IBOutlet var buttonTopMontage: UIButton!
    @IBOutlet var buttonTopEdu: UIButton!
    @IBOutlet var buttonTopCultiv: UIButton!
    
    @IBOutlet var stackTopName: UIView!
    @IBOutlet var stackTopMontage: UIView!
    @IBOutlet var stackTopEdu: UIView!
    @IBOutlet var stackTopCultiv: UIView!
    
    @IBOutlet var viewSearchName: UIView!
    @IBOutlet var viewSearchMontage: UIView!
    @IBOutlet var viewSearchEdu: UIView!
    @IBOutlet var viewSearchCultiv: UIView!
    
    var imageTopCircle = UIImageView()
    var exButtonTop = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.frame = stackViewInViewTopCenter.frame
            imageView.backgroundColor = UIColor(red: 96/255, green: 190/255, blue: 141/255, alpha: 1.0)
            imageView.layer.cornerRadius = imageView.frame.height / 2.0
            return imageView
        }()
        viewTopCenter.insertSubview(imageView, at: 0)
        
        mkCircleAtTopStackView()
        
        buttonTopName.isEnabled = false
        exButtonTop = "name"
    }
    
    func mkCircleAtTopStackView() {
        let imageCircle: UIImageView = {
            let imageView = UIImageView()
            let imageViewPadding: CGFloat = 2.0
            let imageViewFrameWidth = stackTopName.frame.width - imageViewPadding * 2.0
            let imageViewFrameHeight = stackTopName.frame.height - imageViewPadding * 2.0
            imageView.frame = CGRect(x: imageViewPadding, y: imageViewPadding, width: imageViewFrameWidth, height: imageViewFrameHeight)
            imageView.backgroundColor = UIColor(red: 47/255, green: 137/255, blue: 89/255, alpha: 1.0)
            imageView.layer.cornerRadius = imageView.frame.height / 2.0
            imageView.layer.borderWidth = 0
            
            return imageView
        }()
        self.imageTopCircle = imageCircle
        stackTopName.insertSubview(self.imageTopCircle, at: 0)
    }
    
    @IBAction func clickMenu(_ sender: UIButton) {
        
    }
    
    // stackView 안에서 버튼 클릭 시, 이미지 변경 및 isEnabled 값 변경
    //
    func rollbackButtonTop(_ exButtonTop: String) {
        if exButtonTop == "name" {
            buttonTopName.isEnabled = true
        }
        else if exButtonTop == "montage" {
            buttonTopMontage.isEnabled = true
        }
        else if exButtonTop == "edu" {
            buttonTopEdu.isEnabled = true
        }
        else if exButtonTop == "cultiv" {
            buttonTopCultiv.isEnabled = true
        }
    }
    
    // stackView 안에서 버튼 클릭 시, view isHidden 값 변경
    //
    func changeView(_ exButtonTop: String) {
        if exButtonTop == "name" {
            viewSearchName.isHidden = true
        }
        else if exButtonTop == "montage" {
            viewSearchMontage.isHidden = true
        }
        else if exButtonTop == "edu" {
            viewSearchEdu.isHidden = true
        }
        else if exButtonTop == "cultiv" {
            viewSearchCultiv.isHidden = true
        }
    }
    
    // stackView 안에서 버튼 클릭 시, white circle(view:imageTopCircle) 이동 애니메이션
    //
    func animationCircle(_ presentStack: UIView) {
        UIView.animate(withDuration: 0.2, animations: {
            self.imageTopCircle.center = presentStack.center
        })
    }
    
    // stackView 안에 있는 버튼 클릭 함수
    //
    @IBAction func clickTopName(_ sender: UIButton) {
        animationCircle(stackTopName)
        rollbackButtonTop(exButtonTop)
        changeView(exButtonTop)
        
        viewSearchName.isHidden = false
        
        buttonTopName.isEnabled = false
        exButtonTop = "name"
    }
    @IBAction func clickTopMontage(_ sender: UIButton) {
        animationCircle(stackTopMontage)
        rollbackButtonTop(exButtonTop)
        changeView(exButtonTop)
        
        viewSearchMontage.isHidden = false
        
        buttonTopMontage.isEnabled = false
        exButtonTop = "montage"
    }
    @IBAction func clickTopEdu(_ sender: UIButton) {
        animationCircle(stackTopEdu)
        rollbackButtonTop(exButtonTop)
        changeView(exButtonTop)
        
        viewSearchEdu.isHidden = false
        
        buttonTopEdu.isEnabled = false
        exButtonTop = "edu"
    }
    @IBAction func clickTopCultiv(_ sender: UIButton) {
        animationCircle(stackTopCultiv)
        rollbackButtonTop(exButtonTop)
        changeView(exButtonTop)
        
        viewSearchCultiv.isHidden = false
        
        buttonTopCultiv.isEnabled = false
        exButtonTop = "cultiv"
    }
}
