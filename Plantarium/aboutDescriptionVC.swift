//
//  aboutDescriptionVC.swift
//  newNotitle1
//
//  Created by 정은후 on 2020. 6. 18..
//  Copyright © 2020년 정은후. All rights reserved.
//

import UIKit
import RealmSwift

class aboutDescriptionVC: UIViewController {
    @IBOutlet var viewLoading: UIView!
    
    @IBOutlet var viewIUCN: UIView!
    @IBOutlet var buttonIUCN_Detail: UIButton!
    @IBOutlet var buttonIUCN_NE: UIButton!
    @IBOutlet var buttonIUCN_DD: UIButton!
    @IBOutlet var buttonIUCN_LC: UIButton!
    @IBOutlet var buttonIUCN_NT: UIButton!
    @IBOutlet var buttonIUCN_VU: UIButton!
    @IBOutlet var buttonIUCN_EN: UIButton!
    @IBOutlet var buttonIUCN_CR: UIButton!
    @IBOutlet var buttonIUCN_EW: UIButton!
    @IBOutlet var buttonIUCN_EX: UIButton!
    
    @IBOutlet var viewMorpSystem: UIView!
    @IBOutlet var viewMorpLeaf: UIView!
    @IBOutlet var viewMorpStem: UIView!
    @IBOutlet var viewMorpFlower: UIView!
    @IBOutlet var viewMorpFruit: UIView!
    @IBOutlet var viewMorpRoot: UIView!
    
    @IBOutlet var lblMorpSystem: UILabel!
    @IBOutlet var lblMorpLeaf: UILabel!
    @IBOutlet var lblMorpStem: UILabel!
    @IBOutlet var lblMorpFlower: UILabel!
    @IBOutlet var lblMorpFruit: UILabel!
    @IBOutlet var lblMorpRoot: UILabel!
    
    @IBOutlet var imageTriMorpSystem: UIImageView!
    @IBOutlet var imageTriMorpLeaf: UIImageView!
    @IBOutlet var imageTriMorpStem: UIImageView!
    @IBOutlet var imageTriMorpFlower: UIImageView!
    @IBOutlet var imageTriMorpFruit: UIImageView!
    @IBOutlet var imageTriMorpRoot: UIImageView!
    
    @IBOutlet var btnMorpSystem: UIButton!
    @IBOutlet var btnMorpLeaf: UIButton!
    @IBOutlet var btnMorpStem: UIButton!
    @IBOutlet var btnMorpFlower: UIButton!
    @IBOutlet var btnMorpFruit: UIButton!
    @IBOutlet var btnMorpRoot: UIButton!
    
    @IBOutlet var viewWrapper: UIView!
    @IBOutlet var viewIconSystem: UIView!
    @IBOutlet var viewIconLeaf: UIView!
    @IBOutlet var viewIconStem: UIView!
    @IBOutlet var viewIconFlower: UIView!
    @IBOutlet var viewIconFruit: UIView!
    @IBOutlet var viewIconRoot: UIView!
    @IBOutlet var viewIconSystemHeight: NSLayoutConstraint!
    @IBOutlet var viewIconLeafHeight: NSLayoutConstraint!
    @IBOutlet var viewIconStemHeight: NSLayoutConstraint!
    @IBOutlet var viewIconFlowerHeight: NSLayoutConstraint!
    @IBOutlet var viewIconFruitHeight: NSLayoutConstraint!
    @IBOutlet var viewIconRootHeight: NSLayoutConstraint!
    
    var _plant = String()
    
    var viewWrapperHeightConst: NSLayoutConstraint?
    var dicViewIconHeight = [String : CGFloat]()
    
    var defaultMorpSystem = false
    var defaultMorpLeaf = false
    var defaultMorpStem = false
    var defaultMorpFlower = false
    var defaultMorpFruit = false
    var defaultMorpRoot = false
    
    // loading indicator
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        activityIndicator.center = CGPoint(x: self.view.center.x, y: self.view.center.y-200)
        activityIndicator.hidesWhenStopped = false
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        activityIndicator.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    //
    
    var arrSelectButtons = [Int:String]()
    var tagSelectButtons = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLoading.addSubview(activityIndicator)
        
        setCornerRadius()
        
        initTableIUCN(_plant)
        
        let viewHeightInit = viewIconRoot.frame.maxY
        viewWrapperHeightConst = viewWrapper.heightAnchor.constraint(equalToConstant: viewHeightInit)
        viewWrapperHeightConst?.isActive = true
    }
    
    // init function for IUCN table
    //
    func initTableIUCN(_ plant: String) {
        viewIUCN.alpha = 0
        Realm.AT_remoteRealm(callback: { result in
            switch result {
            case .failure(let error):
                print("Failed to open realm: \(error.localizedDescription)")
            case .success(let realm):
                self.viewLoading.isHidden = true
                self.viewIUCN.alpha = 1.0
                
                let data = realm.objects(IUCN.self).filter("_plant == '"+self._plant+"'").first!
                let _IUCN = data["IUCN"] as! String
                
                var color = UIColor()
                if _IUCN == "NE" {
                    color = UIColor(red: 188/255, green: 188/255, blue: 188/255, alpha: 1.0)
                    self.buttonIUCN_NE.setTitleColor(.white, for: .normal)
                    self.buttonIUCN_NE.backgroundColor = color
                }
                else if _IUCN == "DD" {
                    color = UIColor(red: 134/255, green: 134/255, blue: 134/255, alpha: 1.0)
                    self.buttonIUCN_DD.setTitleColor(.white, for: .normal)
                    self.buttonIUCN_DD.backgroundColor = color
                }
                else if _IUCN == "LC" {
                    color = UIColor(red: 6/255, green: 124/255, blue: 55/255, alpha: 1.0)
                    self.buttonIUCN_LC.setTitleColor(.white, for: .normal)
                    self.buttonIUCN_LC.backgroundColor = color
                }
                else if _IUCN == "NT" {
                    color = UIColor(red: 124/255, green: 157/255, blue: 41/255, alpha: 1.0)
                    self.buttonIUCN_NT.setTitleColor(.white, for: .normal)
                    self.buttonIUCN_NT.backgroundColor = color
                }
                else if _IUCN == "VU" {
                    color = UIColor(red: 224/255, green: 188/255, blue: 0, alpha: 1.0)
                    self.buttonIUCN_VU.setTitleColor(.white, for: .normal)
                    self.buttonIUCN_VU.backgroundColor = color
                }
                else if _IUCN == "EN" {
                    color = UIColor(red: 244/255, green: 118/255, blue: 30/255, alpha: 1.0)
                    self.buttonIUCN_EN.setTitleColor(.white, for: .normal)
                    self.buttonIUCN_EN.backgroundColor = color
                }
                else if _IUCN == "CR" {
                    color = UIColor(red: 198/255, green: 16/255, blue: 16/255, alpha: 1.0)
                    self.buttonIUCN_CR.setTitleColor(.white, for: .normal)
                    self.buttonIUCN_CR.backgroundColor = color
                }
                else if _IUCN == "EW" {
                    color = UIColor(red: 91/255, green: 20/255, blue: 105/255, alpha: 1.0)
                    self.buttonIUCN_EW.setTitleColor(.white, for: .normal)
                    self.buttonIUCN_EW.backgroundColor = color
                }
                else if _IUCN == "EX" {
                    color = .black
                    self.buttonIUCN_EX.setTitleColor(.white, for: .normal)
                    self.buttonIUCN_EX.backgroundColor = color
                }
                self.viewIUCN.backgroundColor = color
            }
        })
    }
    
    // Button for detailIUCN
    //
    @IBAction func clickIUCN(_ sender: UIButton) {
        var _IUCN = String()
        if sender == buttonIUCN_NE {
            _IUCN = "NE"
        }
        else if sender == buttonIUCN_DD {
            _IUCN = "DD"
        }
        else if sender == buttonIUCN_LC {
            _IUCN = "LC"
        }
        else if sender == buttonIUCN_NT {
            _IUCN = "NT"
        }
        else if sender == buttonIUCN_VU {
            _IUCN = "VU"
        }
        else if sender == buttonIUCN_EN {
            _IUCN = "EN"
        }
        else if sender == buttonIUCN_CR {
            _IUCN = "CR"
        }
        else if sender == buttonIUCN_EW {
            _IUCN = "EW"
        }
        else if sender == buttonIUCN_EX {
            _IUCN = "EX"
        }
        
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "aboutDescriptionIUCNpopupVC") as? aboutDescriptionIUCNpopupVC else {
            return
        }
        
        rvc._IUCN = _IUCN
        
        rvc.modalPresentationStyle = .overCurrentContext
        rvc.modalTransitionStyle = .crossDissolve
        
        if var topController = UIApplication.shared.windows.filter({$0.isKeyWindow}).first!.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.present(rvc, animated: true, completion: nil)
        }
    }
    
    // Button for buttonIUCN_Detail
    //
    @IBAction func clickIUCN_Detail(_ sender: UIButton) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "aboutDescriptionIUCNDetailpopupVC") as? aboutDescriptionIUCNDetailpopupVC else {
            return
        }
        rvc.modalPresentationStyle = .overCurrentContext
        rvc.modalTransitionStyle = .crossDissolve
        
        if var topController = UIApplication.shared.windows.filter({$0.isKeyWindow}).first!.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.present(rvc, animated: true, completion: nil)
        }
    }
    
    // Button for System in morphology category
    //
    @IBAction func clickMorpSystem(_ sender: UIButton) {
        let superTitle = "system"
        if viewIconSystem.subviews.count == 0 {
            resetMorpButton(sender)
            addViewIcon(superTitle: superTitle, senderButton: sender)
        } else {
            if viewIconSystem.isHidden {
                resetMorpButton(sender)
                unHiddenViewIcon(view: viewIconSystem, superTitle: superTitle)
            } else {
                clearMorpButton(sender)
                hiddenViewIcon(view: viewIconSystem, superTitle: superTitle)
            }
        }
    }
    // Button for Leaf in morphology category
    //
    @IBAction func clickMorpLeaf(_ sender: UIButton) {
        let superTitle = "leaf"
        if viewIconLeaf.subviews.count == 0 {
            resetMorpButton(sender)
            addViewIcon(superTitle: superTitle, senderButton: sender)
        } else {
            if viewIconLeaf.isHidden {
                resetMorpButton(sender)
                unHiddenViewIcon(view: viewIconLeaf, superTitle: superTitle)
            } else {
                clearMorpButton(sender)
                hiddenViewIcon(view: viewIconLeaf, superTitle: superTitle)
            }
        }
    }
    // Button for Stem in morphology category
    //
    @IBAction func clickMorpStem(_ sender: UIButton) {
        let superTitle = "stem"
        if viewIconStem.subviews.count == 0 {
            resetMorpButton(sender)
            addViewIcon(superTitle: superTitle, senderButton: sender)
        } else {
            if viewIconStem.isHidden {
                resetMorpButton(sender)
                unHiddenViewIcon(view: viewIconStem, superTitle: superTitle)
            } else {
                clearMorpButton(sender)
                hiddenViewIcon(view: viewIconStem, superTitle: superTitle)
            }
        }
    }
    // Button for Flower in morphology category
    //
    @IBAction func clickMorpFlower(_ sender: UIButton) {
        let superTitle = "flower"
        if viewIconFlower.subviews.count == 0 {
            resetMorpButton(sender)
            addViewIcon(superTitle: superTitle, senderButton: sender)
        } else {
            if viewIconFlower.isHidden {
                resetMorpButton(sender)
                unHiddenViewIcon(view: viewIconFlower, superTitle: superTitle)
            } else {
                clearMorpButton(sender)
                hiddenViewIcon(view: viewIconFlower, superTitle: superTitle)
            }
        }
    }
    // Button for Fruit in morphology category
    //
    @IBAction func clickMorpFruit(_ sender: UIButton) {
        let superTitle = "fruit"
        if viewIconFruit.subviews.count == 0 {
            resetMorpButton(sender)
            addViewIcon(superTitle: superTitle, senderButton: sender)
        } else {
            if viewIconFruit.isHidden {
                resetMorpButton(sender)
                unHiddenViewIcon(view: viewIconFruit, superTitle: superTitle)
            } else {
                clearMorpButton(sender)
                hiddenViewIcon(view: viewIconFruit, superTitle: superTitle)
            }
        }
    }
    // Button for Root in morphology category
    //
    @IBAction func clickMorpRoot(_ sender: UIButton) {
        let superTitle = "root"
        if viewIconRoot.subviews.count == 0 {
            resetMorpButton(sender)
            addViewIcon(superTitle: superTitle, senderButton: sender)
        } else {
            if viewIconRoot.isHidden {
                resetMorpButton(sender)
                unHiddenViewIcon(view: viewIconRoot, superTitle: superTitle)
            } else {
                clearMorpButton(sender)
                hiddenViewIcon(view: viewIconRoot, superTitle: superTitle)
            }
        }
    }
    
    // 기존의 버튼 -> 색상 변경, 삼각형 이미지 Transform 초기화
    //
    func clearMorpButton(_ sender: UIButton) {
        if sender == btnMorpSystem {
            viewMorpSystem.backgroundColor = UIColor(red: 209/255, green: 209/255, blue: 209/255, alpha: 1.0)
            imageTriMorpSystem.transform = .identity
            
        }
        else if sender == btnMorpLeaf {
            viewMorpLeaf.backgroundColor = UIColor(red: 209/255, green: 209/255, blue: 209/255, alpha: 1.0)
            imageTriMorpLeaf.transform = .identity
            
        }
        else if sender == btnMorpStem {
            viewMorpStem.backgroundColor = UIColor(red: 209/255, green: 209/255, blue: 209/255, alpha: 1.0)
            imageTriMorpStem.transform = .identity
            
        }
        else if sender == btnMorpFlower {
            viewMorpFlower.backgroundColor = UIColor(red: 209/255, green: 209/255, blue: 209/255, alpha: 1.0)
            imageTriMorpFlower.transform = .identity
            
        }
        else if sender == btnMorpFruit {
            viewMorpFruit.backgroundColor = UIColor(red: 209/255, green: 209/255, blue: 209/255, alpha: 1.0)
            imageTriMorpFruit.transform = .identity
            
        }
        else if sender == btnMorpRoot {
            viewMorpRoot.backgroundColor = UIColor(red: 209/255, green: 209/255, blue: 209/255, alpha: 1.0)
            imageTriMorpRoot.transform = .identity
            
        }
    }
    
    // 클릭한 버튼 -> 색상 변경, 삼각형 이미지 Transform 적용
    //
    func resetMorpButton(_ sender: UIButton) {
        if sender == btnMorpSystem {
            viewMorpSystem.backgroundColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
            imageTriMorpSystem.transform = CGAffineTransform(rotationAngle: .pi)
            
        }
        else if sender == btnMorpLeaf {
            viewMorpLeaf.backgroundColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
            imageTriMorpLeaf.transform = CGAffineTransform(rotationAngle: .pi)
            
        }
        else if sender == btnMorpStem {
            viewMorpStem.backgroundColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
            imageTriMorpStem.transform = CGAffineTransform(rotationAngle: .pi)
            
        }
        else if sender == btnMorpFlower {
            viewMorpFlower.backgroundColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
            imageTriMorpFlower.transform = CGAffineTransform(rotationAngle: .pi)
            
        }
        else if sender == btnMorpFruit {
            viewMorpFruit.backgroundColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
            imageTriMorpFruit.transform = CGAffineTransform(rotationAngle: .pi)
            
        }
        else if sender == btnMorpRoot {
            viewMorpRoot.backgroundColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
            imageTriMorpRoot.transform = CGAffineTransform(rotationAngle: .pi)
            
        }
    }
    
    @objc func addViewIcon(superTitle: String, senderButton: UIButton) {
        viewLoading.isHidden = false
        
        let viewIconResult = UIView()
        var viewIconResultHeight: CGFloat = 0
        let viewIconResultPaddingTop: CGFloat = 10.0
        viewIconResult.frame = CGRect(x: 0, y: 0, width: senderButton.frame.width, height: 0)
        
        Realm.AT_remoteRealm(callback: { result in
            switch result {
            case .failure(let error):
                print("Failed to open realm: \(error.localizedDescription)")
            case .success(let realm):
                self.viewLoading.isHidden = true
                
                let data = realm.objects(Title.self).filter("_plant == '"+self._plant+"' && superTitle =='"+superTitle+"'")
                let alignmentMainTitle = Array(realm.objects(TitleAlignment.self)).map{$0.mainTitle!}.filter({$0 != ""})
                let alignmentSubTitle = Array(realm.objects(TitleAlignment.self)).map{$0.subTitle!}.filter({$0 != ""})
                
                // make Array from Realm Data
                //
                var arrTitles = [String: [String : [[String : String]]]]()
                var arrTitlesSub = [String : [[String : String]]]()
                for i in 0..<data.count {
                    let mainTitle = data[i]["mainTitle"] as! String
                    let subTitle = data[i]["subTitle"] as! String
                    let iconTitle = data[i]["iconTitle"] as! String
                    let aData = data[i]["aData"] as! String
                    
                    if !(arrTitles.keys.contains(mainTitle)) {
                        arrTitles[mainTitle] = [String : [[String : String]]]()
                        arrTitlesSub = [String : [[String : String]]]()
                    }
                    
                    let arrIconTitle: [String : String] = [iconTitle : aData]
                    
                    var tempArr = arrTitlesSub[subTitle] ?? []
                    tempArr.append(arrIconTitle)
                    arrTitlesSub[subTitle] = tempArr
                    
                    arrTitles[mainTitle] = arrTitlesSub
                }
                //
                //
                
                var viewIconHeight: CGFloat = 0
                let viewIconPaddingTop: CGFloat = 10.0
                var vi: Int = 0
                let arrTitlesMainTitleKeys = Array(arrTitles.keys)
                let arrSortedMainTitle = alignmentMainTitle.filter(arrTitlesMainTitleKeys.contains)
                for _ in arrTitles {
                    let sortedMainTitle = arrSortedMainTitle[vi]
                    let sortedArrSubTitle = arrTitles[sortedMainTitle]!
                    // 전체 View (= viewIcon)
                    //
                    var viewIconFrameHeight: CGFloat = 0
                    let viewIconFrameY = viewIconHeight + viewIconPaddingTop * CGFloat(vi+1)
                    var viewIconFrame = CGRect(x: 0, y: viewIconFrameY, width: senderButton.frame.width, height: 0)
                    let viewIcon = UIView()
                    let viewIconCornerRadius: CGFloat = 20.0
                    viewIcon.layer.cornerRadius = viewIconCornerRadius
                    viewIcon.layer.borderColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0).cgColor
                    viewIcon.layer.borderWidth = 1.0
                    
                    // viewIcon Header (= mainTitle)
                    //
                    let viewIconHeaderHeight: CGFloat = 35.0
                    let viewIconHeaderFrame = CGRect(x: 0, y: 0, width: viewIconFrame.width, height: viewIconHeaderHeight)
                    let viewIconHeader = UIView(frame : viewIconHeaderFrame)
                    viewIconHeader.roundCorners(corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner], radius: viewIconCornerRadius)
                    viewIconHeader.backgroundColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
                    viewIcon.addSubview(viewIconHeader)
                    
                    let labelHeader: UILabel = {
                        let label = UILabel()
                        label.textColor = .white
                        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
                        label.textAlignment = .left
                        label.text = sortedMainTitle.capitalized
                        
                        let labelPaddingX: CGFloat = 20.0
                        label.frame = CGRect(x: labelPaddingX, y: 0, width: viewIconFrame.width-labelPaddingX, height: viewIconHeaderHeight)
                        
                        return label
                    }()
                    viewIconHeader.addSubview(labelHeader)
                    
                    // viewIconInner (with subTitle and icons)
                    //
                    var viewInnerHeight: CGFloat = 0
                    var vii: Int = 0
                    let arrTitlesSubTitleKeys = Array(sortedArrSubTitle.keys)
                    let arrSortedSubTitle = alignmentSubTitle.filter(arrTitlesSubTitleKeys.contains)
                    for _ in sortedArrSubTitle {
                        let sortedSubTitle = arrSortedSubTitle[vii]
                        var sortedArrIconTitle = sortedArrSubTitle[sortedSubTitle]!
                        
                        let viewIconInnerPadding: CGFloat = 10.0
                        let viewIconInnerY = viewIconHeaderFrame.height + viewInnerHeight + viewIconInnerPadding * CGFloat(vii+1)
                        var viewIconInnerHeight: CGFloat = 0
                        var viewIconInnerFrame = CGRect(x: viewIconInnerPadding, y: viewIconInnerY, width: viewIconFrame.width-viewIconInnerPadding*2.0, height: 0)
                        let viewIconInner = UIView()
                        
                        let labelSubTitle: UILabel = {
                            let labelHeight: CGFloat = 25.0
                            let label = UILabel()
                            label.text = sortedSubTitle.capitalized
                            label.frame = CGRect(x: 0, y: 0, width: viewIconInnerFrame.width, height: labelHeight)
                            label.textAlignment = .left
                            label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 23)
                            label.textColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
                            
                            return label
                        }()
                        viewIconInner.addSubview(labelSubTitle)
                        
                        // outerStackViewIcon (with iconTitle and actualData)
                        //
                        let countArrIconTitle = sortedArrIconTitle.count
                        let limitInOneRow = 3
                        let remainderArrIconTitle = countArrIconTitle % limitInOneRow
                        if remainderArrIconTitle != 0 {
                            for _ in 0..<limitInOneRow - remainderArrIconTitle {
                                sortedArrIconTitle.append(["nonValue" : "nonValue"])
                            }
                        }
                        let arrIconTitleChunk = sortedArrIconTitle.chunks(limitInOneRow)
                        
                        let outerStackViewHeight: CGFloat = 135.0
                        let outerStackViewPaddingTop: CGFloat = 10.0
                        let outerStackViewPaddingTopFirst: CGFloat = outerStackViewPaddingTop / 2.0
                        for i in 0..<arrIconTitleChunk.count {
                            let outerStackViewFrameY = labelSubTitle.frame.height + outerStackViewPaddingTopFirst + (outerStackViewPaddingTop + outerStackViewHeight) * CGFloat(i)
                            
                            let outerStackView: UIStackView = {
                                let outerStackViewFrame = CGRect(x: 0, y: outerStackViewFrameY, width: viewIconInnerFrame.width, height: outerStackViewHeight)
                                let outerStackView = UIStackView(frame: outerStackViewFrame)
                                outerStackView.axis = .horizontal
                                outerStackView.alignment = .fill
                                outerStackView.distribution = .fillEqually
                                outerStackView.spacing = 30.0
                                
                                for j in 0..<arrIconTitleChunk[i].count {
                                    let iconTitle: String = Array(arrIconTitleChunk[i][j].keys)[0]
                                    let aDataRaw: String = arrIconTitleChunk[i][j][iconTitle]!
                                    var aDataHasCharacter = Bool()
                                    var aData = String()
                                    
                                    if aDataRaw.contains("(") && aDataRaw.contains(")") {
                                        aDataHasCharacter = true
                                        let aDataRawSplit = aDataRaw.components(separatedBy: "(")
                                        aData = aDataRawSplit[0]
                                    } else {
                                        aDataHasCharacter = false
                                        aData = aDataRaw
                                    }
                                    
                                    var innerStackView = UIStackView()
                                    if iconTitle == "nonValue" && aData == "nonValue" {
                                        innerStackView = {
                                            let emptySV = UIStackView()
                                            emptySV.axis = .vertical
                                            emptySV.alignment = .fill
                                            emptySV.distribution = .fill
                                            
                                            let emptyLabelTop: UILabel = {
                                                let newLabel = UILabel()
                                                newLabel.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 14)
                                                newLabel.text = ""
                                                
                                                return newLabel
                                            }()
                                            
                                            let emptyButton: UIButton = {
                                                let newButton = UIButton()
                                                
                                                return newButton
                                            }()
                                            
                                            let emptyLabelBottom: UILabel = {
                                                let newLabel = UILabel()
                                                newLabel.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 18)
                                                newLabel.text = ""
                                                
                                                return newLabel
                                            }()
                                            
                                            emptySV.addArrangedSubview(emptyLabelTop)
                                            emptySV.addArrangedSubview(emptyButton)
                                            emptySV.addArrangedSubview(emptyLabelBottom)
                                            
                                            return innerStackView
                                        }()
                                    } else {
                                        innerStackView = {
                                            let newSVSub = UIStackView()
                                            newSVSub.axis = .vertical
                                            newSVSub.alignment = .fill
                                            newSVSub.distribution = .fill
                                            
                                            let labelTop: UILabel = {
                                                let newLabel = UILabel()
                                                newLabel.textColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
                                                newLabel.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 14)
                                                newLabel.textAlignment = .center
                                                newLabel.numberOfLines = 1
                                                newLabel.minimumScaleFactor = 0.5
                                                newLabel.adjustsFontSizeToFitWidth = true
                                                newLabel.text = iconTitle.camelCaseToWords()
                                                
                                                return newLabel
                                            }()
                                            
                                            let button: UIButton = {
                                                let imageDir: String = Bundle.main.resourcePath! + "/morphology/"
                                                let imageDirToSubTitle: String = imageDir+superTitle+"/"+sortedMainTitle+"/"+sortedSubTitle
                                                var imageName = String()
                                                if aDataHasCharacter {
                                                    let aDataRawSplit = aDataRaw.components(separatedBy: "(")
                                                    let plantGenusInADataRaw = aDataRawSplit[1].replacingOccurrences(of: ")", with: "")
                                                    
                                                    imageName = imageDirToSubTitle+"/"+iconTitle+"_"+aData+"_"+plantGenusInADataRaw+".png"
                                                } else {
                                                    imageName = imageDirToSubTitle+"/"+iconTitle+"_"+aData+"_C.png"
                                                }
                                                
                                                let newButton = UIButton()
                                                if UIImage(named: imageName) != nil {
                                                    newButton.setImage(UIImage(named: imageName), for: .normal)
                                                } else {
                                                    newButton.setImage(UIImage(named: imageDir+"emptyIcon"), for: .normal)
                                                }
                                                newButton.imageView?.contentMode = .scaleAspectFit
                                                
                                                newButton.tag = self.tagSelectButtons
                                                self.arrSelectButtons[self.tagSelectButtons] = imageName
                                                self.tagSelectButtons += 1
                                                
                                                newButton.addTarget(self, action: #selector(self.showDetailModal), for: .touchUpInside)
                                                
                                                return newButton
                                            }()
                                            
                                            let labelBottom: UILabel = {
                                                let newLabel = UILabel()
                                                newLabel.textColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
                                                newLabel.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 18)
                                                newLabel.textAlignment = .center
                                                newLabel.numberOfLines = 1
                                                newLabel.minimumScaleFactor = 0.5
                                                newLabel.adjustsFontSizeToFitWidth = true
                                                newLabel.text = aData.camelCaseToWords()
                                                
                                                return newLabel
                                            }()
                                            
                                            button.heightAnchor.constraint(equalToConstant: 90.0).isActive = true
                                            
                                            newSVSub.addArrangedSubview(labelTop)
                                            newSVSub.addArrangedSubview(button)
                                            newSVSub.addArrangedSubview(labelBottom)
                                            
                                            return newSVSub
                                        }()
                                    }
                                    
                                    outerStackView.addArrangedSubview(innerStackView)
                                }
                                return outerStackView
                            }()
                            
                            if i == arrIconTitleChunk.count-1 {
                                let viewIconInnerFramePaddingBottom: CGFloat = 15.0
                                viewIconInnerHeight = outerStackView.frame.maxY + viewIconInnerFramePaddingBottom
                            }
                            
                            viewIconInnerFrame.size.height = viewIconInnerHeight
                            viewIconInner.frame = viewIconInnerFrame
                            viewIconInner.addSubview(outerStackView)
                            
                            viewInnerHeight += viewIconInnerFrame.height
                        }
                        viewIcon.addSubview(viewIconInner)
                        
                        vii += 1
                        if Int(vii) == sortedArrSubTitle.keys.count {
                            let viewIconFramePaddingBottom: CGFloat = 10.0
                            viewIconFrameHeight = viewIconInnerFrame.maxY + viewIconFramePaddingBottom
                        }
                    }
                    viewIconFrame.size.height = viewIconFrameHeight
                    viewIcon.frame = viewIconFrame
                    viewIconResult.addSubview(viewIcon)
                    
                    vi += 1
                    viewIconHeight += viewIconFrameHeight
                }
                viewIconResultHeight = viewIconHeight + viewIconResultPaddingTop * CGFloat(vi)
                viewIconResult.frame.size.height = viewIconResultHeight
                
                self.dicViewIconHeight[superTitle] = viewIconResultHeight
                
                if superTitle == "system" {
                    self.viewIconSystem.addSubview(viewIconResult)
                    self.viewIconSystem.frame.size.height = viewIconResultHeight
                    self.viewIconSystemHeight.constant = viewIconResultHeight
                    self.viewIconSystem.layoutIfNeeded()
                }
                else if superTitle == "leaf" {
                    self.viewIconLeaf.addSubview(viewIconResult)
                    self.viewIconLeaf.frame.size.height = viewIconResultHeight
                    self.viewIconLeafHeight.constant = viewIconResultHeight
                    self.viewIconLeaf.layoutIfNeeded()
                }
                else if superTitle == "stem" {
                    self.viewIconStem.addSubview(viewIconResult)
                    self.viewIconStem.frame.size.height = viewIconResultHeight
                    self.viewIconStemHeight.constant = viewIconResultHeight
                    self.viewIconStem.layoutIfNeeded()
                }
                else if superTitle == "flower" {
                    self.viewIconFlower.addSubview(viewIconResult)
                    self.viewIconFlower.frame.size.height = viewIconResultHeight
                    self.viewIconFlowerHeight.constant = viewIconResultHeight
                    self.viewIconFlower.layoutIfNeeded()
                }
                else if superTitle == "fruit" {
                    self.viewIconFruit.addSubview(viewIconResult)
                    self.viewIconFruit.frame.size.height = viewIconResultHeight
                    self.viewIconFruitHeight.constant = viewIconResultHeight
                    self.viewIconFruit.layoutIfNeeded()
                }
                else if superTitle == "root" {
                    self.viewIconRoot.addSubview(viewIconResult)
                    self.viewIconRoot.frame.size.height = viewIconResultHeight
                    self.viewIconRootHeight.constant = viewIconResultHeight
                    self.viewIconRoot.layoutIfNeeded()
                }
                
                if superTitle == "root" {
                    self.viewWrapperHeightConst?.constant = viewIconResultHeight + self.viewMorpRoot.frame.maxY + 1  // 1 == viewIconRoot's origin height
                } else {
                    self.viewWrapperHeightConst?.constant = viewIconResultHeight + self.viewIconRoot.frame.maxY
                }
                self.viewWrapper.layoutIfNeeded()
            }
        })
    }
    
    @objc func hiddenViewIcon(view: UIView, superTitle: String) {
        view.isHidden = true
        if view == viewIconSystem {
            viewIconSystemHeight.constant = 0
        }
        else if view == viewIconLeaf {
            viewIconLeafHeight.constant = 0
        }
        else if view == viewIconStem {
            viewIconStemHeight.constant = 0
        }
        else if view == viewIconFlower {
            viewIconFlowerHeight.constant = 0
        }
        else if view == viewIconFruit {
            viewIconFruitHeight.constant = 0
        }
        else if view == viewIconRoot {
            viewIconRootHeight.constant = 0
        }
        view.layoutIfNeeded()
        
        viewWrapperHeightConst?.constant = viewIconRoot.frame.maxY - dicViewIconHeight[superTitle]!
        viewWrapper.layoutIfNeeded()
    }
    
    @objc func unHiddenViewIcon(view: UIView, superTitle: String) {
        view.isHidden = false
        if view == viewIconSystem {
            viewIconSystemHeight.constant = dicViewIconHeight[superTitle]!
        }
        else if view == viewIconLeaf {
            viewIconLeafHeight.constant = dicViewIconHeight[superTitle]!
        }
        else if view == viewIconStem {
            viewIconStemHeight.constant = dicViewIconHeight[superTitle]!
        }
        else if view == viewIconFlower {
            viewIconFlowerHeight.constant = dicViewIconHeight[superTitle]!
        }
        else if view == viewIconFruit {
            viewIconFruitHeight.constant = dicViewIconHeight[superTitle]!
        }
        else if view == viewIconRoot {
            viewIconRootHeight.constant = dicViewIconHeight[superTitle]!
        }
        view.layoutIfNeeded()
        
        viewWrapperHeightConst?.constant = viewIconRoot.frame.maxY + dicViewIconHeight[superTitle]!
        viewWrapper.layoutIfNeeded()
    }
    
    @objc func showDetailModal(sender: UIButton) {
        let tagSelected: Int = sender.tag
        let imageFileName = arrSelectButtons[tagSelected] as Any
        
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "bookShowDetailModalVC") as? bookShowDetailModalVC else {
            return
        }
        
        rvc.imageFileName = imageFileName as! String
        
        rvc.modalPresentationStyle = .overCurrentContext
        rvc.modalTransitionStyle = .crossDissolve
        self.present(rvc, animated: true, completion: nil)
    }
    
    func setCornerRadius() {
        viewMorpSystem.layer.cornerRadius = 17
        viewMorpLeaf.layer.cornerRadius = 17
        viewMorpStem.layer.cornerRadius = 17
        viewMorpFlower.layer.cornerRadius = 17
        viewMorpFruit.layer.cornerRadius = 17
        viewMorpRoot.layer.cornerRadius = 17
    }
}

extension UIView {
    func roundCorners(corners:CACornerMask, radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = corners
    }
    
//    func updateConstraint(attribute: NSLayoutAttribute, constant: CGFloat) -> Void {
//        if let constraint = (self.constraints.filter{$0.firstAttribute == attribute}.first) {
//            constraint.constant = constant
//            self.layoutIfNeeded()
//        }
//    }
}
