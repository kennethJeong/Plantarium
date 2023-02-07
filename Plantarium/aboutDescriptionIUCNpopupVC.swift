//
//  aboutDescriptionIUCNpopupVC.swift
//  newNotitle1
//
//  Created by 정은후 on 2021/01/06.
//  Copyright © 2021 정은후. All rights reserved.
//

import UIKit

class aboutDescriptionIUCNpopupVC: UIViewController {
    @IBOutlet var viewMain: UIView!
    @IBOutlet var labelIUCN: UILabel!
    @IBOutlet var labelFullnameIUCN: UILabel!
    @IBOutlet var viewLabelDetail: UIView!
    @IBOutlet var labelDetail: UILabel!
    @IBOutlet var labelDetailEmphasis: UILabel!
    
    @IBOutlet var heightViewMain: NSLayoutConstraint!
    
    var _IUCN: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewMain.layer.cornerRadius = 30
        viewMain.layer.borderWidth = 0
        
        labelIUCN.text = _IUCN
        
        var color = UIColor()
        if _IUCN == "NE" {
            color = UIColor(red: 188/255, green: 188/255, blue: 188/255, alpha: 1.0)
            labelFullnameIUCN.text = "Not Evaluated"
            labelDetail.text = "Direct or indirect evaluation of the species has not yet been conducted"
        }
        else if _IUCN == "DD" {
            color = UIColor(red: 134/255, green: 134/255, blue: 134/255, alpha: 1.0)
            labelFullnameIUCN.text = "Data Deficient"
            labelDetail.text = "Lack of information for conducting direct and indirect assessments of the species"
        }
        else if _IUCN == "LC" {
            color = UIColor(red: 6/255, green: 124/255, blue: 55/255, alpha: 1.0)
            labelFullnameIUCN.text = "Least Concern"
            labelDetail.text = "The state in which the species is not threatened, vulnerable, threatened, or threatened, but maintains a wide habitat and sufficient population"
        }
        else if _IUCN == "NT" {
            color = UIColor(red: 124/255, green: 157/255, blue: 41/255, alpha: 1.0)
            labelFullnameIUCN.text = "Near Treatened"
            labelDetail.text = "The species is not vulnerable, urgent, or critical, but is likely to be endangered in the near future"
        }
        else if _IUCN == "VU" {
            color = UIColor(red: 224/255, green: 188/255, blue: 0, alpha: 1.0)
            labelFullnameIUCN.text = "Vunererable"
            labelDetail.text = "Specifies if any of the A to E criteria for determining the first category vulnerability that is at risk of extinction are met"
            labelDetailEmphasis.isHidden = false
            labelDetailEmphasis.text = "A highly endangered species in the wild"
        }
        else if _IUCN == "EN" {
            color = UIColor(red: 244/255, green: 118/255, blue: 30/255, alpha: 1.0)
            labelFullnameIUCN.text = "Endangered"
            labelDetail.text = "Specifies if any of the A to E criteria for determining the second category crisis status of an endangered species are met"
            labelDetailEmphasis.isHidden = false
            labelDetailEmphasis.text = "A highly endangered species in the wild"
        }
        else if _IUCN == "CR" {
            color = UIColor(red: 198/255, green: 16/255, blue: 16/255, alpha: 1.0)
            labelFullnameIUCN.text = "Critically Endangered"
            labelDetail.text = "Specifies if any of the A to E criteria for determining the last category of risk of extinction are met"
            labelDetailEmphasis.isHidden = false
            labelDetailEmphasis.text = "A highly endangered species in the wild"
        }
        else if _IUCN == "EW" {
            color = UIColor(red: 91/255, green: 20/255, blue: 105/255, alpha: 1.0)
            labelFullnameIUCN.text = "Extinct in the Wild"
            labelDetail.text = "No individuals have been found in the native habitat of the species historically, and they can survive only in naturalized form in an artificial environment (such as cultivation, breeding, etc.) or away from their original habitat"
            labelDetailEmphasis.isHidden = false
            labelDetailEmphasis.text = "A species considered extinct in the wild"
        }
        else if _IUCN == "EX" {
            color = .black
            labelFullnameIUCN.text = "Extinct"
            labelDetail.text = "There is no reasonable doubt that the last survivor has died throughout the species' historical habitat or artificial environment (cultivation, breeding, etc.)"
            labelDetailEmphasis.isHidden = false
            labelDetailEmphasis.text = "a species considered completely extinct"
        }
        viewMain.backgroundColor = color
        labelDetail.autoresize()
        labelDetailEmphasis.autoresize()
        
        let desiredSurplusHeight: CGFloat = 25.0
        if labelDetailEmphasis.isHidden {
            let surplusHeight: CGFloat = viewLabelDetail.frame.height - labelDetail.frame.height
            if surplusHeight > desiredSurplusHeight {
                heightViewMain.constant -= surplusHeight - desiredSurplusHeight
            }
            print(surplusHeight)
        } else {
            let intervalBetweenLabels: CGFloat = 8
            let surplusHeight = viewLabelDetail.frame.height - (labelDetail.frame.height + intervalBetweenLabels + labelDetailEmphasis.frame.height)
            if surplusHeight > desiredSurplusHeight {
                heightViewMain.constant -= surplusHeight - desiredSurplusHeight
            }
        }
        viewMain.layoutIfNeeded()
    }
    
    @IBAction func dismissView(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension UILabel {
    func autoresize() {
        if let textNSString: NSString = self.text as NSString? {
            let rect = textNSString.boundingRect(with: CGSize(width: self.frame.size.width, height: CGFloat.greatestFiniteMagnitude),
                                                 options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                 attributes: [NSAttributedString.Key.font: self.font!],
                                                         context: nil)
            self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: rect.height)
        }
    }
}
