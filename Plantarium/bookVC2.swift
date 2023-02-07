//
//  bookVC2.swift
//  newNotitle1
//
//  Created by 정은후 on 2020. 3. 30..
//  Copyright © 2020년 정은후. All rights reserved.
//

import UIKit

class bookVC2: UIViewController {
    @IBOutlet var viewTop: UIView!
    @IBOutlet var viewHeader: UIView!
    
    @IBOutlet var viewMain: UIView!
    @IBOutlet var buttonDivide: UIButton!
    @IBOutlet var sliderBackground: UIImageView!
    @IBOutlet var viewSlider: UIView!
    @IBOutlet var buttonSlider: UIButton!
    @IBOutlet var imageVerticalBar: UIImageView!
    @IBOutlet var lblMain: UILabel!
    @IBOutlet var buttonRuler: UIButton!
    
    @IBOutlet var stackRuler: UIStackView!
    @IBOutlet var buttonRulerCard: UIButton!
    @IBOutlet var buttonRulerBasketBall: UIButton!
    @IBOutlet var buttonRulerMan: UIButton!
    
    @IBOutlet var viewRuler: UIView!
    
    @IBOutlet var buttonBack: UIButton!
    @IBOutlet var buttonBackFirst: UIButton!
    @IBOutlet var buttonClose: UIButton!
    @IBOutlet var buttonShowStem: UIButton!
    @IBOutlet var buttonShowRoot: UIButton!
    @IBOutlet var buttonShowStalk: UIButton!
    @IBOutlet var buttonShowSeed: UIButton!
    
    @IBOutlet var buttonShowDetail: UIButton!
    
    @IBOutlet var viewCrossSection: UIView!
    @IBOutlet var buttonCrossSection: UIButton!
    @IBOutlet var imageCrossSectionCircle: UIImageView!
    
    @IBOutlet var viewSwitchFlowerAndFruit: UIView!
    @IBOutlet var imageSwitchCircle: UIImageView!
    @IBOutlet var buttonSwitchFlower: UIButton!
    @IBOutlet var buttonSwitchFruit: UIButton!
    
    @IBOutlet var viewSeedZoom: UIView!
    @IBOutlet var buttonSeedZoom: UIButton!
    @IBOutlet var imageSeedZoomCircle: UIImageView!
    
    // flowerMap
    @IBOutlet var subviewFlowerMap: UIView!
    @IBOutlet var stackViewFlowerMap: UIStackView!
    @IBOutlet var viewFlowerMap: UIView!
    @IBOutlet var buttonFlowerMap: UIButton!
    @IBOutlet var buttonFlowerMapPetal: UIButton!
    @IBOutlet var buttonFlowerMapSepal: UIButton!
    @IBOutlet var buttonFlowerMapStamen: UIButton!
    @IBOutlet var buttonFlowerMapPistil: UIButton!
    //
    
    @IBOutlet var viewMainAbout: UIView!
    
    @IBOutlet var viewBottom: UIView!
    
    // data From SearchNameVC or SearchMontageVC
    //
    var _plant: String = ""
    var _plantSName: String = ""
    var _plantCName: String = ""
    var _plantFamily: String = ""
    var _plantOrder: String = ""
    var _plantGenus: String = ""
    var _plantHeight: Int = 0
    //
    
    let imageFilesDir: String = "/Users/eh/Desktop/notitle/notitle5/notitle5/image/plants/"
    var imageFileOrigin = String()
    var imageDirActive = String()
    
    var imageViewFull = UIImageView()
    var imageViewNonActive = UIImageView()
    var imageViewActivePitcher = UIImageView()
    var imageViewActivePitcherSide = UIImageView()
    var imageViewActivePhyllodia = UIImageView()
    var imageViewActivePhyllodiaSide = UIImageView()
    var imageViewActiveStalk = UIImageView()
    var imageViewActiveFlower = UIImageView()
    var imageViewActiveFlowerSide = UIImageView()
    var imageViewActiveFruit = UIImageView()
    var imageViewActiveFruitSide = UIImageView()
    var imageViewActiveSeed = UIImageView()
    var imageViewActiveFlowerMap = UIImageView()
    var imageViewActiveFlowerMapPetal = UIImageView()
    var imageViewActiveFlowerMapSepal = UIImageView()
    var imageViewActiveFlowerMapStamen = UIImageView()
    var imageViewActiveFlowerMapPistil = UIImageView()
    
    var buttonActivePitcher = UIButton()
    var buttonActiveFlower = UIButton()
    var buttonActivePhyllodia = UIButton()
    
    var buttonAfterZoomActiveStalkAndFlower = UIButton()
    var buttonAfterZoomActiveFlower = UIButton()
    var buttonShowFlowerMap = UIButton()
    var buttonAfterZoomActiveFruit = UIButton()
    var buttonAfterZoomActiveSeed = UIButton()
    
    var labelActivePitcher = UILabel()
    var labelActiveFlower = UILabel()
    var labelActivePhyllodia = UILabel()
    
    var vMovePitcher = CGFloat()
    var vMoveFlower = CGFloat()
    var vMovePhyllodia = CGFloat()
    
    var defaultSlider = false
    
    var defaultDivide = false
    var defaultRuler = false
    
    var imageRulerGround = UIImageView()
    var viewRulerFigure = UIView()
    
    let sizeOfCard_width: CGFloat = 8.560
    let sizeOfCard_height: CGFloat = 5.398
    let sizeOfBasketBall: CGFloat = 24.300
    var sizeOfMan_width: CGFloat = 62
    var sizeOfMan_height: CGFloat = 200
    
    var imageViewRulerCard = UIImageView()
    var imageViewRulerBasketBall = UIImageView()
    var imageViewRulerMan = UIImageView()
    var imageViewRulerCardPlantFrame = CGRect()
    var imageViewRulerBasketBallPlantFrame = CGRect()
    var imageViewRulerManPlantFrame = CGRect()
    let buttonRotation = UIButton()
    let imageViewRulerDial = UIImageView()
    let dialLabelFigure = UILabel()
    var defaultCardRotation = false
    var exImageViewRuler = String()
    
    var isShownButtonBack = true
    var isShownButtonBackFirst = true
    var isShownButtonShowStem = true
    var isShownButtonShowRoot = true
    
    let labelFigureCM = UILabel()
    let imageViewFigureDash = UIImageView()
    
    var vPadding = CGFloat()
    var vWidthFigure = CGFloat()
    var imageHeightBaseLine = CGFloat()
    
    var defaultCrossSection = false
    var tagCrossSection = String()
    
    var defaultShowPitcher = false
    var defaultShowPhyllodia = false
    var defaultShowFlowerAndFruit = false
    var defaultShowStalk = true
    var defaultShowFlower = false
    var defaultShowFruit = false
    var defaultShowSeed = false
    
    var tempFrameForStalk = CGRect()
    
    var defaultFAFSwitch = false
    var defaultFAFSwitchFlower = false
    var defaultFAFSwitchFruit = false
    
    var defaultSeedZoom = false
    let imageViewActiveSeed_copyLT = UIImageView()
    let imageViewActiveSeed_copyRT = UIImageView()
    
    var defaultShowFlowerMap = false
    var imageViewFlowerMap = UIImageView()
    var imageViewFlowerMapPetal = UIImageView()
    var imageViewFlowerMapSepal = UIImageView()
    var imageViewFlowerMapStamen = UIImageView()
    var imageViewFlowerMapPistil = UIImageView()
    var tagFlowerMap = String()
    
    var tagShowDetailPart = String()
    var tagShowDetailPartSub = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 임시로 설정된 값
        _plantHeight = 70
        //
        
        DispatchQueue.main.async {
            self.addImageToMainImageView(self._plantGenus)     // 이미지 파일 로드
            
            //
            let date = DateFormatter()
            date.locale = Locale(identifier: "ko_kr")
            date.timeZone = TimeZone(abbreviation: "KST") // "2018-03-21 18:07:27"
            date.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let kr = date.string(from: Date())
            print(kr)
            //
        }
        
        // set buttonSlider's title (two line title, font, fontColor, drop shadow, .etc)
        //
        //buttonSlider.setTitle(_plantSName, for: .normal)
        buttonSlider.titleLabel?.lineBreakMode = .byWordWrapping
        let buttonSliderTitle: NSString = _plantSName + "\n" + _plantCName as NSString
        let newlineRange: NSRange = buttonSliderTitle.range(of: "\n")
        var substring1 = ""
        var substring2 = ""
        if(newlineRange.location != NSNotFound) {
            substring1 = buttonSliderTitle.substring(to: newlineRange.location)
            substring2 = buttonSliderTitle.substring(from: newlineRange.location)
        }
        
        let font1: UIFont = UIFont(name: "AppleSDGothicNeo-Bold", size: CGFloat(25))!
        let fontColor1: UIColor = UIColor(red: 87/255, green: 87/255, blue: 87/255, alpha: 1.0)
        let attributes1 = [NSMutableAttributedString.Key.font: font1, NSMutableAttributedString.Key.foregroundColor: fontColor1]
        let attrString1 = NSMutableAttributedString(string: substring1, attributes: attributes1)
        
        let font2: UIFont = UIFont(name: "AppleSDGothicNeo-Light", size: CGFloat(15))!
        let fontColor2: UIColor = UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1.0)
        let attributes2 = [NSMutableAttributedString.Key.font: font2, NSMutableAttributedString.Key.foregroundColor: fontColor2]
        let attrString2 = NSMutableAttributedString(string: substring2, attributes: attributes2)
        
        attrString1.append(attrString2)
        buttonSlider.setAttributedTitle(attrString1, for: [])
        
        buttonSlider.titleLabel?.adjustsFontSizeToFitWidth = true   // buttonSlider - label autosizing
        buttonSlider.titleLabel?.minimumScaleFactor = 0.5   // buttonSlider - label autosizing
        buttonSlider.titleEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        
        buttonSlider.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.16).cgColor
        buttonSlider.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        buttonSlider.layer.shadowOpacity = 1.0
        buttonSlider.layer.shadowRadius = 4.0
        buttonSlider.layer.masksToBounds = false
        buttonSlider.layer.cornerRadius = 35.0
        //
        //
        
        imageVerticalBar.alpha = 0
        
        lblMain.adjustsFontSizeToFitWidth = true   // lblMain - label autosizing
        lblMain.minimumScaleFactor = 0.5   // lblMain - label autosizing
        
        stackRuler.alpha = 0
        
        imageRulerGround.image = UIImage(named: "image_ground.png")
        imageRulerGround.frame = CGRect(x: -viewRuler.frame.width*2.0, y: viewRuler.frame.height-75, width: viewRuler.frame.width*2.0, height: 75)
        imageRulerGround.isHidden = true
        viewRuler.addSubview(imageRulerGround)
        
        vPadding = viewRuler.frame.width / 10.0     // viewRuler의 imageView 간 padding
        vWidthFigure = viewRuler.frame.width / 10.0      // viewRulerFigure 너비
        imageHeightBaseLine = viewRuler.frame.height - imageRulerGround.frame.height/2.0    // 이미지가 위치할 base line
        
        // viewSwitchFlowerAndFruit 설정
        viewSwitchFlowerAndFruit.layer.cornerRadius = 25
        viewSwitchFlowerAndFruit.layer.borderWidth = 0
        
        // viewCrossSection 설정
        viewCrossSection.layer.cornerRadius = 17
        viewCrossSection.layer.borderWidth = 0
        
        // viewSeedZoom 설정
        viewSeedZoom.layer.cornerRadius = 17
        viewSeedZoom.layer.borderWidth = 0
        
        tagShowDetailPart = "system"
        tagShowDetailPartSub = "life"
        buttonShowDetail.addTarget(self, action: #selector(clickShowDetail), for: .touchUpInside)
    }
    
    @IBAction func clickClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func clickRuler(_ sender: UIButton) {
        if !defaultRuler {
            defaultRuler = true
            buttonRuler.setImage(UIImage(named: "button_ruler_on"), for: .normal)
            
            if buttonBack.alpha == 1 {
                buttonBack.alpha = 0
                isShownButtonBack = false
            }
            if buttonBackFirst.alpha == 1 {
                buttonBackFirst.alpha = 0
                isShownButtonBackFirst = false
            }
            if buttonShowStem.alpha == 1 {
                buttonShowStem.alpha = 0
                isShownButtonShowStem = false
            }
            if buttonShowRoot.alpha == 1 {
                buttonShowRoot.alpha = 0
                isShownButtonShowRoot = false
            }
            
            viewMain.isHidden = true
            viewRuler.isHidden = false
            viewRuler.alpha = 0
            
            lblMain.isHidden = true
            imageVerticalBar.isHidden = true
            
            imageRulerGround.isHidden = false
            UIView.animate(withDuration: 0.4, animations: {
                self.stackRuler.alpha = 1
                self.viewRuler.alpha = 1
                self.imageRulerGround.transform = CGAffineTransform(translationX: self.viewRuler.frame.width*1.1, y: 0)
            })
            
            if exImageViewRuler == "" {
                let tempImageRight = imageViewFull
                let tempImageLeft = UIImageView(image: UIImage(named: "image_card"))
                
                let tempImageRightHeight = viewRuler.frame.height - imageRulerGround.frame.height
                let tempImageRightWidth = imageViewFull.frame.width * tempImageRightHeight / imageViewFull.frame.height
                
                let realScale = tempImageRightHeight / CGFloat(_plantHeight)
                
                let tempImageLeftHeight = sizeOfCard_height * realScale
                let tempImageLeftWidth = sizeOfCard_width * realScale
                
                var tempImageRightFrame = CGRect(x: 0, y: 0, width: tempImageRightWidth, height: tempImageRightHeight)
                var tempImageLeftFrame = CGRect(x: 0, y: 0, width: tempImageLeftWidth, height: tempImageLeftHeight)
                
                let sumWidth: CGFloat = tempImageRightFrame.width + tempImageLeftFrame.width     // 두 이미지의 width 합
                let validWidth: CGFloat = viewRuler.frame.width - vPadding*2.0 - vWidthFigure     // 두 이미지가 배치되기 위한 유효 width
                
                // 두 이미지의 width의 합이 viewRuler의 width보다 클 때 -> 두 이미지의 scale 변경 후 배치
                if sumWidth > validWidth {
                    // 두 이미지의 scale 변경
                    let modScale = validWidth / sumWidth
                    tempImageRightFrame.size = CGSize(width: tempImageRightFrame.width * modScale, height: tempImageRightFrame.height * modScale)
                    tempImageLeftFrame.size = CGSize(width: tempImageLeftFrame.width * modScale, height: tempImageLeftFrame.height * modScale)
                }
                
                // 비교 이미지의 height가 viewRuler의 height보다 클 때 -> 비교 이미지의 scale 변경 후 배치
                if tempImageLeftFrame.height > viewRuler.frame.height {
                    let modScale = (viewRuler.frame.height - imageRulerGround.frame.height) / tempImageLeftFrame.height
                    tempImageLeftFrame.size = CGSize(width: tempImageLeftFrame.width * modScale, height: tempImageLeftFrame.height * modScale)
                    tempImageRightFrame.size = CGSize(width: tempImageRightFrame.width * modScale, height: tempImageRightFrame.height * modScale)
                }
                
                // left image의 position
                tempImageLeftFrame.origin.x = vPadding
                tempImageLeftFrame.origin.y = imageHeightBaseLine - tempImageLeftFrame.height
                
                // right image의 y position
                tempImageRightFrame.origin.y = imageHeightBaseLine - tempImageRightFrame.height
                
                // figure(label+dash) view의 frame
                let viewFigureFrame = CGRect(x: viewRuler.frame.width - vWidthFigure, y: tempImageRightFrame.minY, width: vWidthFigure, height: tempImageRightFrame.height)
                
                // right image의 x position
                tempImageRightFrame.origin.x = viewFigureFrame.minX - tempImageRightFrame.width
                
                tempImageRight.frame = tempImageRightFrame
                tempImageLeft.frame = tempImageLeftFrame
                
                imageViewRulerCard = tempImageLeft
                
                viewRuler.addSubview(imageViewRulerCard)
                viewRuler.addSubview(imageViewFull)
                imageViewRulerCardPlantFrame = tempImageRightFrame
                
                // Cm Label - in viewFigureFrame
                labelFigureCM.frame = CGRect(x: viewFigureFrame.minX, y: viewFigureFrame.minY, width: viewFigureFrame.width, height: 30)
                labelFigureCM.text = String(_plantHeight) + "cm"
                labelFigureCM.textAlignment = .center
                labelFigureCM.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: CGFloat(14))
                labelFigureCM.minimumScaleFactor = 0.5
                labelFigureCM.adjustsFontSizeToFitWidth = true
                labelFigureCM.lineBreakMode = .byTruncatingTail
                
                // Dash 이미지 - in viewFigureFrame
                imageViewFigureDash.image = UIImage(named: "image_dashVertical")
                imageViewFigureDash.frame = CGRect(x: labelFigureCM.frame.minX, y: labelFigureCM.frame.maxY, width: viewFigureFrame.width, height: viewFigureFrame.height - labelFigureCM.frame.height)
                imageViewFigureDash.contentMode = .scaleAspectFit
                
                viewRuler.addSubview(labelFigureCM)
                viewRuler.addSubview(imageViewFigureDash)
                //
                
                // 버튼 이미지 변경 및 버튼 활성 상태 변경
                buttonRulerCard.setImage(UIImage(named: "button_card_on"), for: .normal)
                buttonRulerCard.isEnabled = false
    
                // 각 버튼에 클릭 함수 적용
                buttonRulerCard.addTarget(self, action: #selector(clickRulerCard), for: .touchUpInside)
                buttonRulerBasketBall.addTarget(self, action: #selector(clickRulerBasketBall), for: .touchUpInside)
                buttonRulerMan.addTarget(self, action: #selector(clickRulerMan), for: .touchUpInside)
                    
                // make rotation button
                if imageViewRulerCard.frame.width > 20 {
                    buttonRotation.setImage(UIImage(named:"button_rotation"), for: .normal)
                    var buttonRotationFrame = CGRect()
                    let fixedValue: CGFloat = 20
                    let validPositionY: CGFloat = imageViewRulerCard.frame.width - imageViewRulerCard.frame.height
                    buttonRotationFrame = CGRect(x: imageViewRulerCard.center.x-fixedValue/2.0, y: imageViewRulerCard.frame.origin.y-validPositionY-fixedValue, width: fixedValue, height: fixedValue)
                    buttonRotation.frame = buttonRotationFrame
                    buttonRotation.addTarget(self, action: #selector(clickRulerCardRotation), for: .touchUpInside)
                    viewRuler.addSubview(buttonRotation)
                }
                //
                
                exImageViewRuler = "card"
            }
        } else {
            defaultRuler = false
            buttonRuler.setImage(UIImage(named: "button_ruler_off"), for: .normal)
            
            if !isShownButtonBack {
                buttonBack.alpha = 1
                isShownButtonBack = true
            }
            if !isShownButtonBackFirst {
                buttonBackFirst.alpha = 1
                isShownButtonBackFirst = true
            }
            if !isShownButtonShowStem {
                buttonShowStem.alpha = 1
                isShownButtonShowStem = true
            }
            if !isShownButtonShowRoot {
                buttonShowRoot.alpha = 1
                isShownButtonShowRoot = true
            }
            
            viewMain.isHidden = false
            buttonRuler.isEnabled = false
            lblMain.isHidden = false
            imageVerticalBar.isHidden = false
            
            if lblMain.alpha == 1.0 {
                lblMain.alpha = 0.0
                UIView.animate(withDuration: 0.4, animations: {
                    self.lblMain.alpha = 1.0
                })
            }
            if imageVerticalBar.alpha == 1.0 {
                imageVerticalBar.alpha = 0.0
                UIView.animate(withDuration: 0.4, animations: {
                    self.imageVerticalBar.alpha = 1.0
                })
            }
            UIView.animate(withDuration: 0.4, animations: {
                self.stackRuler.alpha = 0
                self.viewRuler.alpha = 0
                self.imageRulerGround.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: { (finished: Bool) in
                self.viewRuler.isHidden = true
                self.buttonRuler.isEnabled = true
                self.imageRulerGround.isHidden = true
            })
        }
    }
    
    func setRulerFrames(compItem: String) -> (left: CGRect, right: CGRect) {
        var compItem_height = CGFloat()
        var compItem_width = CGFloat()
        
        if compItem == "card" {
            compItem_height = sizeOfCard_height
            compItem_width = sizeOfCard_width
        }
        else if compItem == "basketball" {
            compItem_height = sizeOfBasketBall
            compItem_width = sizeOfBasketBall
        }
        else if compItem == "man" {
            compItem_height = sizeOfMan_height
            compItem_width = sizeOfMan_width
        }
        
        let tempImageRightHeight = viewRuler.frame.height - imageRulerGround.frame.height
        let tempImageRightWidth = imageViewFull.frame.width * tempImageRightHeight / imageViewFull.frame.height
        
        let realScale = tempImageRightHeight / CGFloat(_plantHeight)
        
        let tempImageLeftHeight = compItem_height * realScale
        let tempImageLeftWidth = compItem_width * realScale
        
        var tempImageRightFrame = CGRect(x: 0, y: 0, width: tempImageRightWidth, height: tempImageRightHeight)
        var tempImageLeftFrame = CGRect(x: 0, y: 0, width: tempImageLeftWidth, height: tempImageLeftHeight)
        
        let sumWidth: CGFloat = tempImageRightFrame.width + tempImageLeftFrame.width     // 두 이미지의 width 합
        let validWidth: CGFloat = viewRuler.frame.width - vPadding*2.0 - vWidthFigure     // 두 이미지가 배치되기 위한 유효 width
        
        // 두 이미지의 width의 합이 viewRuler의 width보다 클 때 -> 두 이미지의 scale 변경 후 배치
        if sumWidth > validWidth {
            // 두 이미지의 scale 변경
            let modScale = validWidth / sumWidth
            tempImageRightFrame.size = CGSize(width: tempImageRightFrame.width * modScale, height: tempImageRightFrame.height * modScale)
            tempImageLeftFrame.size = CGSize(width: tempImageLeftFrame.width * modScale, height: tempImageLeftFrame.height * modScale)
        }
        
        // 비교 이미지의 height가 viewRuler의 height보다 클 때 -> 비교 이미지의 scale 변경 후 배치
        if tempImageLeftFrame.height > viewRuler.frame.height {
            let modScale = (viewRuler.frame.height - imageRulerGround.frame.height) / tempImageLeftFrame.height
            tempImageLeftFrame.size = CGSize(width: tempImageLeftFrame.width * modScale, height: tempImageLeftFrame.height * modScale)
            tempImageRightFrame.size = CGSize(width: tempImageRightFrame.width * modScale, height: tempImageRightFrame.height * modScale)
        }
        
        // left image의 position
        tempImageLeftFrame.origin.x = vPadding
        tempImageLeftFrame.origin.y = imageHeightBaseLine - tempImageLeftFrame.height
        
        // right image의 y position
        tempImageRightFrame.origin.y = imageHeightBaseLine - tempImageRightFrame.height
        
        // figure(label+dash) view의 frame
        let viewFigureFrame = CGRect(x: viewRuler.frame.width - vWidthFigure, y: tempImageRightFrame.minY, width: vWidthFigure, height: tempImageRightFrame.height)
        
        // right image의 x position
        tempImageRightFrame.origin.x = viewFigureFrame.minX - tempImageRightFrame.width
        
        return (left: tempImageLeftFrame, right: tempImageRightFrame)
    }
    
    func setoffImageViewRuler(_ exImageViewRuler: String) {
        if exImageViewRuler == "card" {
            buttonRulerCard.setImage(UIImage(named: "button_card_off"), for: .normal)
            buttonRulerCard.isEnabled = true
            
            buttonRotation.isHidden = true
            defaultCardRotation = false
            imageViewRulerCard.transform = CGAffineTransform(rotationAngle: 0)
            buttonRotation.transform = CGAffineTransform(rotationAngle: 0)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.imageViewRulerCard.transform = CGAffineTransform(translationX: -self.imageViewRulerCard.frame.maxX, y: 0)
            })
        }
        else if exImageViewRuler == "basketball" {
            buttonRulerBasketBall.setImage(UIImage(named: "button_basketball_off"), for: .normal)
            buttonRulerBasketBall.isEnabled = true
            UIView.animate(withDuration: 0.5, animations: {
                self.imageViewRulerBasketBall.transform = CGAffineTransform(translationX: -self.imageViewRulerBasketBall.frame.maxX, y: 0).rotated(by: 180)
            })
        }
        else if exImageViewRuler == "man" {
            buttonRulerMan.setImage(UIImage(named: "button_man_off"), for: .normal)
            buttonRulerMan.isEnabled = true
            UIView.animate(withDuration: 0.5, animations: {
                self.imageViewRulerMan.transform = CGAffineTransform(translationX: -self.imageViewRulerMan.frame.maxX, y: 0)
            })
            imageViewRulerDial.isHidden = true
        }
    }
    
    @objc func clickRulerCardRotation() {
        if !defaultCardRotation {
            defaultCardRotation = true
            UIView.animate(withDuration: 0.5, animations: {
                self.imageViewRulerCard.transform = CGAffineTransform(rotationAngle: .pi/2.0)
                self.buttonRotation.transform = CGAffineTransform(rotationAngle: .pi/2.0)
            })
        } else {
            defaultCardRotation = false
            UIView.animate(withDuration: 0.5, animations: {
                self.imageViewRulerCard.transform = CGAffineTransform(rotationAngle: 0)
                self.buttonRotation.transform = CGAffineTransform(rotationAngle: 0)
            })
        }
    }
    
    @objc func clickRulerCard() {
        setoffImageViewRuler(exImageViewRuler)
        buttonRulerCard.setImage(UIImage(named: "button_card_on"), for: .disabled)
        buttonRulerCard.isEnabled = false
        
        if imageViewRulerCard.image == nil {
            let rulerFrames = setRulerFrames(compItem: "card")
            
            imageViewRulerCard.image = UIImage(named: "image_card")
            imageViewRulerCard.frame = rulerFrames.left
            imageViewRulerCard.transform = CGAffineTransform(translationX: -imageViewRulerCard.frame.maxX, y: 0)
            viewRuler.addSubview(imageViewRulerCard)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.imageViewFull.frame = rulerFrames.right
                self.imageViewRulerCard.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            imageViewRulerCardPlantFrame = rulerFrames.right
            
            // make rotation button
            buttonRotation.setImage(UIImage(named:"button_rotation"), for: .normal)
            buttonRotation.frame = CGRect(x: imageViewRulerCard.frame.minX-25, y: imageViewRulerCard.frame.minY-50-30, width: 50, height: 50)
            buttonRotation.addTarget(self, action: #selector(clickRulerCardRotation), for: .touchUpInside)
            viewRuler.addSubview(buttonRotation)
        } else {
            buttonRotation.isHidden = false
            buttonRotation.alpha = 0.0
            UIView.animate(withDuration: 0.5, animations: {
                self.imageViewFull.frame = self.imageViewRulerCardPlantFrame
                self.imageViewRulerCard.transform = CGAffineTransform(translationX: self.imageViewRulerCard.frame.maxX, y: 0)
                self.buttonRotation.alpha = 1.0
            })
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            // Cm label 위치 조정
            self.labelFigureCM.frame.origin.y = self.imageViewFull.frame.minY
            
            // dash image 길이 조정
            self.imageViewFigureDash.frame.origin.y = self.labelFigureCM.frame.maxY
            self.imageViewFigureDash.frame.size.height = self.imageHeightBaseLine - self.labelFigureCM.frame.maxY
        })
        exImageViewRuler = "card"
    }
    @objc func clickRulerBasketBall() {
        setoffImageViewRuler(exImageViewRuler)
        buttonRulerBasketBall.setImage(UIImage(named: "button_basketball_on"), for: .disabled)
        buttonRulerBasketBall.isEnabled = false
        
        if imageViewRulerBasketBall.image == nil {
            let rulerFrames = setRulerFrames(compItem: "basketball")
            
            imageViewRulerBasketBall.image = UIImage(named: "image_basketBall")
            imageViewRulerBasketBall.frame = rulerFrames.left
            imageViewRulerBasketBall.transform = CGAffineTransform(translationX: -imageViewRulerBasketBall.frame.maxX, y: 0).rotated(by: 180)
            viewRuler.addSubview(imageViewRulerBasketBall)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.imageViewFull.frame = rulerFrames.right
                self.imageViewRulerBasketBall.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            imageViewRulerBasketBallPlantFrame = rulerFrames.right
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.imageViewFull.frame = self.imageViewRulerBasketBallPlantFrame
                self.imageViewRulerBasketBall.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            // Cm label 위치 조정
            self.labelFigureCM.frame.origin.y = self.imageViewFull.frame.minY
            
            // dash image 길이 조정
            self.imageViewFigureDash.frame.origin.y = self.labelFigureCM.frame.maxY
            self.imageViewFigureDash.frame.size.height = self.imageHeightBaseLine - self.labelFigureCM.frame.maxY
        })
        exImageViewRuler = "basketball"
    }
    @objc func clickRulerMan() {
        setoffImageViewRuler(exImageViewRuler)
        buttonRulerMan.setImage(UIImage(named: "button_man_on"), for: .disabled)
        buttonRulerMan.isEnabled = false
        
        if imageViewRulerMan.image == nil {
            let rulerFrames = setRulerFrames(compItem: "man")
            
            imageViewRulerMan.image = UIImage(named: "image_man")
            imageViewRulerMan.frame = rulerFrames.left
            imageViewRulerMan.transform = CGAffineTransform(translationX: -imageViewRulerMan.frame.maxX, y: 0)
            viewRuler.addSubview(imageViewRulerMan)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.imageViewFull.frame = rulerFrames.right
                self.imageViewRulerMan.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            imageViewRulerManPlantFrame = rulerFrames.right
            
            // make cm dial image
            //
            let dialImage = UIImage(named: "image_dial")
            let dialImageScale = dialImage!.size.height / dialImage!.size.width
            let dialImageWidth: CGFloat = vPadding * 1.5
            let dialImageHeight: CGFloat = dialImageWidth * dialImageScale
            imageViewRulerDial.image = dialImage
            imageViewRulerDial.frame = CGRect(x: viewRuler.bounds.minX, y: viewRuler.bounds.minY, width: dialImageWidth, height: dialImageHeight)
            imageViewRulerDial.isUserInteractionEnabled = true
            viewRuler.addSubview(imageViewRulerDial)
            
            // label - "cm"
            let dialLabelCm = UILabel()
            let dialLabelCmWidth = imageViewRulerDial.frame.width/2.0
            let dialLabelCmHeight = imageViewRulerDial.frame.height
            dialLabelCm.frame = CGRect(x: imageViewRulerDial.frame.minX, y: imageViewRulerDial.frame.minY, width: dialLabelCmWidth, height: dialLabelCmHeight)
            dialLabelCm.text = "cm"
            dialLabelCm.textAlignment = .center
            dialLabelCm.baselineAdjustment = .alignCenters
            dialLabelCm.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: CGFloat(12))
            dialLabelCm.minimumScaleFactor = 0.5
            dialLabelCm.adjustsFontSizeToFitWidth = true
            dialLabelCm.lineBreakMode = .byTruncatingTail
            imageViewRulerDial.addSubview(dialLabelCm)
            
            // label - Figure
            let dialLabelFigureWidth = imageViewRulerDial.frame.width/2.0
            let dialLabelFigureHeight: CGFloat = 20
            dialLabelFigure.frame = CGRect(x: dialLabelCm.frame.maxX, y: (dialLabelCm.frame.maxY-dialLabelFigureHeight)/2.0, width: dialLabelFigureWidth, height: dialLabelFigureHeight)
            dialLabelFigure.text = String(Int(sizeOfMan_height))
            dialLabelFigure.textAlignment = .right
            dialLabelFigure.font = UIFont(name: "AppleSDGothicNeo-Light", size: CGFloat(14))
            dialLabelFigure.minimumScaleFactor = 0.5
            dialLabelFigure.adjustsFontSizeToFitWidth = true
            dialLabelFigure.lineBreakMode = .byTruncatingTail
            imageViewRulerDial.addSubview(dialLabelFigure)
            
            // add panning functions
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panDial))
            imageViewRulerDial.addGestureRecognizer(panGesture)
        } else {
            imageViewRulerDial.isHidden = false
            imageViewRulerDial.alpha = 0.0
            UIView.animate(withDuration: 0.5, animations: {
                self.imageViewFull.frame = self.imageViewRulerManPlantFrame
                self.imageViewRulerMan.transform = CGAffineTransform(translationX: self.imageViewRulerMan.frame.maxX, y: 0)
                self.imageViewRulerDial.alpha = 1.0
            })
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            // Cm label 위치 조정
            self.labelFigureCM.frame.origin.y = self.imageViewFull.frame.minY
            
            // dash image 길이 조정
            self.imageViewFigureDash.frame.origin.y = self.labelFigureCM.frame.maxY
            self.imageViewFigureDash.frame.size.height = self.imageHeightBaseLine - self.labelFigureCM.frame.maxY
        })
        exImageViewRuler = "man"
    }
    
    // ruler -> man : dial panning 시, 이미지뷰 크기 조절
    //
    @objc func panDial(gesture: UIPanGestureRecognizer) {
        var dialLabelFigureValue = Int(dialLabelFigure.text!)!
        let velocity = gesture.velocity(in: gesture.view)
        if dialLabelFigureValue >= 100 && dialLabelFigureValue <= 200 {
            // panning down
            //
            if velocity.y > 0 && dialLabelFigureValue != 200 {
                dialLabelFigureValue += 1
            }
            // panning up
            //
            else if velocity.y < 0 && dialLabelFigureValue != 100 {
                dialLabelFigureValue -= 1
            }
            dialLabelFigure.text = String(dialLabelFigureValue)
            
            let scaleOrigin = sizeOfMan_width / sizeOfMan_height
            sizeOfMan_height = CGFloat(dialLabelFigureValue)
            sizeOfMan_width = sizeOfMan_height * scaleOrigin
            
            let rulerFrames = setRulerFrames(compItem: "man")
            UIView.animate(withDuration: 0.05, animations: {
                self.imageViewRulerMan.frame = rulerFrames.left
                self.imageViewFull.frame = rulerFrames.right
                
                // figure label 위치 조정
                self.labelFigureCM.frame.origin.y = self.imageViewFull.frame.minY
                // dash image 길이 조정
                self.imageViewFigureDash.frame.origin.y = self.labelFigureCM.frame.maxY
                self.imageViewFigureDash.frame.size.height = self.imageHeightBaseLine - self.labelFigureCM.frame.maxY
            })
            imageViewRulerManPlantFrame = rulerFrames.right
        }
    }
    
    // var buttonSlider 의 클릭 함수
    //
    @IBAction func clickSlider(_ sender: UIButton) {
        let moveValue = sliderBackground.frame.width - viewSlider.frame.width
        if !defaultSlider {
            defaultSlider = true
            
            viewMainAbout.isHidden = false
            viewMainAbout.alpha = 0
            UIView.animate(withDuration: 0.4, animations: {
                self.viewSlider.transform = CGAffineTransform(translationX: moveValue, y: 0)
            })
            UIView.animate(withDuration: 0.5, animations: {
                self.viewMain.alpha = 0
                self.viewHeader.alpha = 0
                self.viewBottom.alpha = 0
            }) { finished in
                self.viewMain.isHidden = true
                self.viewHeader.isHidden = true
                self.viewBottom.isHidden = true
            }
            UIView.animate(withDuration: 0.5, animations: {
                self.viewMainAbout.alpha = 1
            })
            
            if viewMainAbout.subviews.count == 0 {
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "bookAboutVC") as! bookAboutVC
                vc._plant = _plant
                vc.view.frame = viewMainAbout.bounds
                viewMainAbout.addSubview(vc.view)
                self.addChild(vc)
                vc.didMove(toParent: self)
            }
        } else {
            defaultSlider = false
            
            viewMain.isHidden = false
            viewHeader.isHidden = false
            viewBottom.isHidden = false
            viewMain.alpha = 0
            viewHeader.alpha = 0
            viewBottom.alpha = 0
            UIView.animate(withDuration: 0.4, animations: {
                self.viewSlider.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            UIView.animate(withDuration: 0.5, animations: {
                self.viewMain.alpha = 1
                self.viewHeader.alpha = 1
                self.viewBottom.alpha = 1
            })
            UIView.animate(withDuration: 0.5, animations: {
                self.viewMainAbout.alpha = 0
            }) { finished in
                self.viewMainAbout.isHidden = true
            }
        }
    }
    
    @IBAction func clickBackFirst() {
        // back from <Seed>
        if defaultShowSeed {
            clickBackAfterShowSeed()
        }
        
        // back from <FlowerMap>
        if defaultShowFlowerMap {
            clickBackAfterShowFlowerMap()
        }
        
        // back from <Stalk>
        if !defaultShowStalk {
            clickShowStalk()
        }
        
        // back from <Flower or Fruit>
        if defaultShowFruit || defaultShowFlower {
            clickBackAfterZoomFlowerOrFruit()
        }
        
        // back from <Flower & Fruit>
        if defaultShowFlowerAndFruit {
            clickBackAfterZoomFlowerAndFruit()
        }
        // back from <Pitcher>
        if defaultShowPitcher {
            clickBackAfterZoomPitcher()
        }
        // back from <Phyllodia>
        if defaultShowPhyllodia {
            clickBackAfterZoomPhyllodia()
        }
        
        // back from <Divide>
        if defaultDivide {
            clickDivide(buttonDivide)
        }
    }
    
    // var buttonDivide 의 클릭 함수
    //
    @IBAction func clickDivide(_ sender: UIButton) {
        if _plantGenus == "Sarracenia" {
            if !defaultDivide {
                defaultDivide = true
                activeDivide(_plantGenus)
                addButtonAfterDivide(_plantGenus)
                addLabelAfterDivide(_plantGenus)
                
                tagShowDetailPart = ""
                tagShowDetailPartSub = ""
                buttonShowDetail.isHidden = true
                
                UIView.animate(withDuration: 0.4, animations: {
                    self.buttonBack.alpha = 1
                    self.buttonBackFirst.alpha = 1
                    self.buttonShowStem.alpha = 1
                    self.buttonShowRoot.alpha = 1
                })
                buttonBack.addTarget(self, action: #selector(clickDivide), for: .touchUpInside)
            } else {
                defaultDivide = false
                activeAssemble(_plantGenus)
                setOffLabels(_plantGenus)
                removeButtonAfterDivide(_plantGenus)
                
                tagShowDetailPart = "basic"
                tagShowDetailPartSub = "basic"
                buttonShowDetail.isHidden = false
                
                UIView.animate(withDuration: 0.4, animations: {
                    self.buttonBack.alpha = 0
                    self.buttonBackFirst.alpha = 0
                    self.buttonShowStem.alpha = 0
                    self.buttonShowRoot.alpha = 0
                })
            }
        }
    }
    
    // 활성화된 이미지의 버튼 생성 함수
    //
    func addButtonAfterDivide(_ plantGenus: String) {
        if plantGenus == "Sarracenia" {
            if imageViewActivePitcher.image != nil {
                let frame = imageViewActivePitcher.frame
                buttonActivePitcher = UIButton(frame: frame)
                buttonActivePitcher.addTarget(self, action: #selector(clickActivePitcher), for: .touchUpInside)
                viewMain.addSubview(buttonActivePitcher)
            }
            if imageViewActiveFlower.image != nil {
                let frame = imageViewActiveFlower.frame
                buttonActiveFlower = UIButton(frame: frame)
                buttonActiveFlower.addTarget(self, action: #selector(clickActiveFlower), for: .touchUpInside)
                viewMain.addSubview(buttonActiveFlower)
            }
            if imageViewActivePhyllodia.image != nil {
                let frame = imageViewActivePhyllodia.frame
                buttonActivePhyllodia = UIButton(frame: frame)
                buttonActivePhyllodia.addTarget(self, action: #selector(clickActivePhyllodia), for: .touchUpInside)
                viewMain.addSubview(buttonActivePhyllodia)
            }
        }
    }
    
    // assemble 후, 활성화된 이미지의 버튼 제거 함수
    //
    func removeButtonAfterDivide(_ plantGenus: String) {
        if plantGenus == "Sarracenia" {
            buttonActivePitcher.removeFromSuperview()
            buttonActiveFlower.removeFromSuperview()
            buttonActivePhyllodia.removeFromSuperview()
        }
    }
    
    // 활성화된 이미지의 라벨 설정 함수
    //
    func setLabel(plantGenus: String, imageView: UIImageView, frame: CGRect) -> UILabel {
        let label = UILabel(frame: frame)
        
        if plantGenus == "Sarracenia" {
            label.font = UIFont(name: "AppleSDGothicNeo-thin", size: CGFloat(20))
            
            var labelText = String()
            if imageView == imageViewActivePitcher {
                labelText = "Pitcher"
            }
            else if imageView == imageViewActiveFlower {
                labelText = "Flower"
            }
            else if imageView == imageViewActivePhyllodia {
                labelText = "Phyllodia"
            }
            
            let attr = NSMutableAttributedString.init(string: labelText)
            attr.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 0, length: attr.length))
            label.attributedText = attr
            label.frame = frame
        }
        
        return label
    }
    
    // 활성화된 이미지의 라벨 생성 함수
    //
    func addLabelAfterDivide(_ plantGenus: String) {
        if plantGenus == "Sarracenia" {
            if imageViewActivePitcher.image != nil {
                let frame = CGRect(x: imageViewActivePitcher.center.x - imageViewActivePitcher.frame.width/4.0, y: imageViewActivePitcher.frame.minY - 30, width: 100, height: 20)
                labelActivePitcher = setLabel(plantGenus: plantGenus, imageView: imageViewActivePitcher, frame: frame)
                labelActivePitcher.alpha = 0
                viewMain.addSubview(labelActivePitcher)
                
                UIView.animate(withDuration: 0.4, animations: {
                    self.labelActivePitcher.alpha = 1
                })
            }
            if imageViewActiveFlower.image != nil {
                let frame = CGRect(x: imageViewActiveFlower.center.x - imageViewActiveFlower.frame.width/4.0, y: imageViewActiveFlower.frame.maxY + 10, width: 100, height: 20)
                labelActiveFlower = setLabel(plantGenus: plantGenus, imageView: imageViewActiveFlower, frame: frame)
                labelActiveFlower.alpha = 0
                viewMain.addSubview(labelActiveFlower)
                
                UIView.animate(withDuration: 0.4, animations: {
                    self.labelActiveFlower.alpha = 1
                })
            }
            if imageViewActivePhyllodia.image != nil {
                let frame = CGRect(x: imageViewActivePhyllodia.center.x - imageViewActivePhyllodia.frame.width/4.0, y: imageViewActivePhyllodia.frame.minY - 30, width: 100, height: 20)
                labelActivePhyllodia = setLabel(plantGenus: plantGenus, imageView: imageViewActivePhyllodia, frame: frame)
                labelActivePhyllodia.alpha = 0
                viewMain.addSubview(labelActivePhyllodia)
                
                UIView.animate(withDuration: 0.4, animations: {
                    self.labelActivePhyllodia.alpha = 1
                })
            }
        }
    }
    
    // 이미지 중앙 이동 및 scale up 할 위치 도출 함수
    //
    func moveCenterActiveImageView(_ button: UIButton) -> CGAffineTransform {
        let centerViewMain = CGPoint(x: (self.viewMain.bounds.maxX - self.viewMain.bounds.minX)/2.0, y: (self.viewMain.bounds.maxY - self.viewMain.bounds.minY)/2.0)
        let centerButton = CGPoint(x: button.center.x, y: button.center.y)
        
        let scaleX = self.viewMain.bounds.width / button.frame.width
        let scaleY = self.viewMain.bounds.height / button.frame.height
        var scale = CGFloat()
        if scaleX > scaleY {
            scale = scaleY
        } else {
            scale = scaleX
        }
        
        if scale > 1.2 {
            scale *= 0.8
        }
        
        let moveValueX = centerViewMain.x - centerButton.x
        let moveValueY = centerViewMain.y - centerButton.y
        return CGAffineTransform(translationX: moveValueX, y: moveValueY).scaledBy(x: scale, y: scale)
    }
    
    // 클릭한 이미지 이외의 이미지 fade in OR fade out 함수
    //
    func fadeSubImageViews(mainView: UIView, exceptionImageView: [UIImageView], fade: Int) {
        for v in mainView.subviews {
            if v is UIImageView && !exceptionImageView.contains(v as! UIImageView) {
                v.alpha = CGFloat(fade)
            }
        }
    }
    
    // active 이미지 클릭 시, 기존 Label - hide 및 main label text 변경
    //
    func addLabelToMain(plantGenus: String, label: UILabel) {
        if plantGenus == "Sarracenia" {
            var textLabel = String()
            if label == labelActivePitcher {
                textLabel = "Pitcher"
            }
            else if label == labelActiveFlower {
                textLabel = "Flower & Fruit"
            }
            else if label == labelActivePhyllodia {
                textLabel = "Phyllodia"
            }
            lblMain.text = textLabel
            
            self.labelActivePitcher.alpha = 0
            self.labelActiveFlower.alpha = 0
            self.labelActivePhyllodia.alpha = 0
            
            lblMain.alpha = 0
            UIView.animate(withDuration: 0.4, animations: {
                self.lblMain.alpha = 1
                self.imageVerticalBar.alpha = 1
            })
        }
    }
    
    // active->zoom 이후의 이미지 클릭 시, Label 원위치 함수
    //
    func setOffLabels(_ plantGenus: String) {
        if plantGenus == "Sarracenia" {
            UIView.animate(withDuration: 0.4, animations: {
                self.labelActivePitcher.alpha = 0
                self.labelActiveFlower.alpha = 0
                self.labelActivePhyllodia.alpha = 0
            })
        }
    }
    
    // active->zoom 이후의 이미지 클릭 시, Label 원위치 함수
    //
    func setOffMainLabel(plantGenus: String) {
        if plantGenus == "Sarracenia" {
            UIView.animate(withDuration: 0.4, animations: {
                self.imageVerticalBar.alpha = 0
                
                self.labelActivePitcher.alpha = 1
                self.labelActiveFlower.alpha = 1
                self.labelActivePhyllodia.alpha = 1
                
                self.lblMain.alpha = 0
            })
        }
    }
    
    // active flower -> [Switch] 버튼 작동 함수
    //
    @IBAction func clickSwitchFlower(_ sender: UIButton) {
        // FAF Switch가 Off일 때 -> [Stalk and Flower] 화면 보여주기
        if !defaultFAFSwitch {
            defaultFAFSwitch = true
            defaultFAFSwitchFlower = true
            imageSwitchCircle.alpha = 1
            
            clickShowStalkAndFlower()
        }
        // FAF Switch가 On일 때
        else {
            // Flower가 보여지고 있을 때 -> [Flower & Fruit] 화면 보여주기
            if defaultFAFSwitchFlower {
                defaultFAFSwitch = false
                defaultFAFSwitchFlower = false
                imageSwitchCircle.alpha = 0
                
                if defaultShowFlowerMap {
                    clickBackAfterShowFlowerMap()
                }
                
                clickBackAfterZoomFlowerOrFruit()
                buttonAfterZoomActiveFlower.isHidden = true
            }
            // Fruit이 보여지고 있을 때 -> [Stalk and Flower] 화면 보여주기
            else if defaultFAFSwitchFruit {
                defaultFAFSwitchFruit = false
                
                if defaultShowSeed {
                    clickBackAfterShowSeed()
                }
                
                clickBackAfterZoomFlowerOrFruit()
                clickShowStalkAndFlower()
            }
        }
        
        UIView.animate(withDuration: 0.4, animations: {
            self.imageSwitchCircle.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        
//        { finished in
//            self.buttonSwitchFlower.isUserInteractionEnabled = false
//            self.buttonSwitchFruit.isUserInteractionEnabled = true
//        }
    }
    @IBAction func clickSwitchFruit(_ sender: UIButton) {
        let circlePaddingX: CGFloat = 4.0
        let moveValueX = viewSwitchFlowerAndFruit.frame.width - imageSwitchCircle.frame.width - circlePaddingX * 2.0
        
        // FAF Switch가 Off일 때 -> [Fruit] 화면 보여주기
        if !defaultFAFSwitch {
            defaultFAFSwitch = true
            defaultFAFSwitchFruit = true
            imageSwitchCircle.alpha = 1
            
            imageSwitchCircle.transform = CGAffineTransform(translationX: moveValueX, y: 0)
            
            clickShowFruit()
        }
        // FAF Switch가 On일 때
        else {
            // Fruit이 보여지고 있을 때 -> [Flower & Fruit] 화면 보여주기
            if defaultFAFSwitchFruit {
                defaultFAFSwitch = false
                defaultFAFSwitchFruit = false
                imageSwitchCircle.alpha = 0
                
                imageSwitchCircle.transform = .identity
                
                if defaultShowSeed {
                    clickBackAfterShowSeed()
                }
                
                clickBackAfterZoomFlowerOrFruit()
            }
            // Flower가 보여지고 있을 때 -> [Fruit] 화면 보여주기
            else if defaultFAFSwitchFlower {
                defaultFAFSwitchFlower = false
                
                UIView.animate(withDuration: 0.4, animations: {
                    self.imageSwitchCircle.transform = CGAffineTransform(translationX: moveValueX, y: 0)
                })
                
                if defaultShowFlowerMap {
                    clickBackAfterShowFlowerMap()
                }
                
                clickBackAfterZoomFlowerOrFruit()
                clickShowFruit()
                buttonAfterZoomActiveFlower.isHidden = true
            }
        }
//        { finished in
//            self.buttonSwitchFlower.isUserInteractionEnabled = true
//            self.buttonSwitchFruit.isUserInteractionEnabled = false
//        }
    }
    
    // crossSection - 이미지 단면<->원본 보기 함수
    //
    @objc func clickCrossSection() {
        // 단면 보기
        if !defaultCrossSection {
            defaultCrossSection = true
            let circlePaddingX: CGFloat = 2
            let moveX: CGFloat = viewCrossSection.frame.width - imageCrossSectionCircle.frame.width - circlePaddingX * 2.0
            UIView.animate(withDuration: 0.4, animations: {
                self.imageCrossSectionCircle.transform = CGAffineTransform(translationX: moveX, y: 0)
                self.imageCrossSectionCircle.image = UIImage(named: "image_recombine")
            })
            
            if tagCrossSection == "pitcher" {
                clickCrossSectionAtPitcher()
            }
            else if tagCrossSection == "flower" {
                clickCrossSectionAtFlower()
            }
            else if tagCrossSection == "phyllodia" {
                clickCrossSectionAtPhyllodia()
            }
            else if tagCrossSection == "fruit" {
                clickCrossSectionAtFruit()
            }
        }
        // 원본 보기
        else {
            defaultCrossSection = false
            UIView.animate(withDuration: 0.4, animations: {
                self.imageCrossSectionCircle.transform = CGAffineTransform(translationX: 0, y: 0)
                self.imageCrossSectionCircle.image = UIImage(named: "image_crossSection")
            })
            
            if tagCrossSection == "pitcher" {
                clickRecombineAtPitcher()
            }
            else if tagCrossSection == "flower" {
                clickRecombineAtFlower()
            }
            else if tagCrossSection == "phyllodia" {
                clickRecombineAtPhyllodia()
            }
            else if tagCrossSection == "fruit" {
                clickRecombineAtFruit()
            }
        }
    }
    
    // crossSection 초기화 함수
    func clickCrossSectionInit() {
        if tagCrossSection == "pitcher" {
            clickRecombineAtPitcher()
        }
        else if tagCrossSection == "flower" {
            clickRecombineAtFlower()
        }
        else if tagCrossSection == "phyllodia" {
            clickRecombineAtPhyllodia()
        }
        else if tagCrossSection == "fruit" {
            clickRecombineAtFruit()
        }
        
        defaultCrossSection = false
        tagCrossSection = ""
        imageCrossSectionCircle.transform = CGAffineTransform(translationX: 0, y: 0)
        imageCrossSectionCircle.image = UIImage(named: "image_crossSection")
    }
    
    // pitcher 또는 flower가 보여지는 뷰에서, Detail 팝업 작동 함수
    //
    @objc func clickShowDetail() {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "bookShowDetailVC") as? bookShowDetailVC else {
            return
        }
        rvc._plant = _plant
        rvc.tagSuperTitle = tagShowDetailPart
        rvc.tagMainTitle = tagShowDetailPartSub

        rvc.modalPresentationStyle = .overCurrentContext
        rvc.modalTransitionStyle = .coverVertical
        self.present(rvc, animated: true, completion: nil)
    }
    
    // active 이미지 클릭 시, 중앙 이동 및 scale up 함수
    //
    @objc func clickActivePitcher() {
        defaultShowPitcher = true
        buttonShowStem.alpha = 0
        buttonShowRoot.alpha = 0
        
        tagShowDetailPart = "leaf"
        tagShowDetailPartSub = "pitcher"
        buttonShowDetail.isHidden = false
        
        buttonDivide.isEnabled = false
        buttonActivePitcher.isEnabled = false
        
        buttonActiveFlower.isEnabled = false
        buttonActivePhyllodia.isEnabled = false
        
        addLabelToMain(plantGenus: _plantGenus, label: labelActivePitcher)
        
        let arrExceptionImageViews = [imageViewActivePitcher, imageViewActivePitcherSide]
        
        UIView.animate(withDuration: 0.4, animations: {
            self.imageViewActivePitcher.transform = self.moveCenterActiveImageView(self.buttonActivePitcher)
            if self.imageViewActivePitcherSide.image != nil {
                self.imageViewActivePitcherSide.transform = self.moveCenterActiveImageView(self.buttonActivePitcher)
            }
            self.fadeSubImageViews(mainView: self.viewMain, exceptionImageView: arrExceptionImageViews, fade: 0)
        })
        
        buttonBack.removeTarget(nil, action: nil, for: .allEvents)
        buttonBack.addTarget(self, action: #selector(clickBackAfterZoomPitcher), for: .touchUpInside)
        
        if imageViewActivePitcherSide.image != nil {
            UIView.animate(withDuration: 0.4, animations: {
                self.viewCrossSection.alpha = 1
            })
            tagCrossSection = "pitcher"
            buttonCrossSection.removeTarget(nil, action: nil, for: .allEvents)
            buttonCrossSection.addTarget(self, action: #selector(clickCrossSection), for: .touchUpInside)
        }
    }
    @objc func clickActivePhyllodia() {
        defaultShowPhyllodia = true
        buttonShowStem.alpha = 0
        buttonShowRoot.alpha = 0
        
        tagShowDetailPart = "leaf"
        tagShowDetailPartSub = "phyllodia"
        buttonShowDetail.isHidden = false
        
        buttonDivide.isEnabled = false
        buttonActivePhyllodia.isEnabled = false
        
        buttonActivePitcher.isEnabled = false
        buttonActiveFlower.isEnabled = false
        
        addLabelToMain(plantGenus: _plantGenus, label: labelActivePhyllodia)
        
        let arrExceptionImageViews = [imageViewActivePhyllodia, imageViewActivePhyllodiaSide]
        
        UIView.animate(withDuration: 0.4, animations: {
            self.imageViewActivePhyllodia.transform = self.moveCenterActiveImageView(self.buttonActivePhyllodia)
            if self.imageViewActivePhyllodiaSide.image != nil {
                self.imageViewActivePhyllodiaSide.transform = self.moveCenterActiveImageView(self.buttonActivePhyllodia)
            }
            self.fadeSubImageViews(mainView: self.viewMain, exceptionImageView: arrExceptionImageViews, fade: 0)
        })
        
        buttonBack.removeTarget(nil, action: nil, for: .allEvents)
        buttonBack.addTarget(self, action: #selector(clickBackAfterZoomPhyllodia), for: .touchUpInside)
        
        if imageViewActivePhyllodiaSide.image != nil {
            UIView.animate(withDuration: 0.4, animations: {
                self.viewCrossSection.alpha = 1
            })
            tagCrossSection = "phyllodia"
            buttonCrossSection.removeTarget(nil, action: nil, for: .allEvents)
            buttonCrossSection.addTarget(self, action: #selector(clickCrossSection), for: .touchUpInside)
        }
    }
    @objc func clickActiveFlower() {
        defaultShowFlowerAndFruit = true
        buttonRuler.isHidden = true
        viewSwitchFlowerAndFruit.isHidden = false
        
        buttonShowStem.alpha = 0
        buttonShowRoot.alpha = 0
        
        buttonDivide.isEnabled = false
        buttonActiveFlower.isEnabled = false
        
        buttonActivePitcher.isEnabled = false
        buttonActivePhyllodia.isEnabled = false
        
        addLabelToMain(plantGenus: _plantGenus, label: labelActiveFlower)
        
        //
        //
        let centerViewMain = CGPoint(x: viewMain.frame.width/2.0, y: viewMain.frame.height/2.0)
        let centerFlower = CGPoint(x: imageViewActiveFlower.center.x, y: imageViewActiveFlower.center.y)
        let centerFlowerSide = CGPoint(x: imageViewActiveFlowerSide.center.x, y: imageViewActiveFlowerSide.center.y)
        let centerStalk = CGPoint(x: imageViewActiveStalk.center.x, y: imageViewActiveStalk.center.y)
        
        let scaleX = viewMain.bounds.width / imageViewActiveFlower.frame.width
        let scaleY = viewMain.bounds.height / imageViewActiveFlower.frame.height
        var scale = CGFloat()
        if scaleX > scaleY {
            scale = scaleY
        } else {
            scale = scaleX
        }
        if scale > 1.2 {
            scale *= 0.8
        }
        
        scale *= 0.7 // 크기 -> 70%로 감소
        
        let diffCenterX = centerFlower.x - centerFlowerSide.x
        let diffCenterY = centerFlower.y - centerFlowerSide.y
        
        let diffCenterX4Stalk = centerFlower.x - centerStalk.x
        let diffCenterY4Stalk = centerFlower.y - centerStalk.y
        
        var moveValueFlowerX = centerViewMain.x - centerFlower.x
        var moveValueFlowerY = centerViewMain.y - centerFlower.y
    
        var moveValueFlowerSideX = centerViewMain.x - centerFlowerSide.x - diffCenterX*scale
        var moveValueFlowerSideY = centerViewMain.y - centerFlowerSide.y - diffCenterY*scale
        
        let vMoveOffsetY: CGFloat = 20  // active image의 공통 y 이동값
        var moveValueStalkX = centerViewMain.x - centerStalk.x - diffCenterX4Stalk*scale + vMoveFlower*scale
        var moveValueStalkY = centerViewMain.y - centerStalk.y - diffCenterY4Stalk*scale + vMoveOffsetY*scale
        
        // 가운데로 옮겨졌을 경우의 imageViewActiveStalk의 Frame값 이용 -> 모든 이미지의 위치를 viewMain의 좌측 상단으로 이동
        imageViewActiveStalk.transform = CGAffineTransform(translationX: moveValueStalkX, y: moveValueStalkY).scaledBy(x: scale, y: scale)
        let tempFrame4Stalk = imageViewActiveStalk.frame
        tempFrameForStalk = tempFrame4Stalk
        let modMoveValueX = -tempFrame4Stalk.minX
        let modMoveValueY = -tempFrame4Stalk.minY
        moveValueFlowerX += modMoveValueX
        moveValueFlowerY += modMoveValueY
        
        moveValueFlowerSideX += modMoveValueX
        moveValueFlowerSideY += modMoveValueY
        
        moveValueStalkX += modMoveValueX
        moveValueStalkY += modMoveValueY
        
        imageViewActiveStalk.transform = .identity // 임시로 작동한 transform -> 초기화
        
        let arrExceptionImageViews = [imageViewActiveFlower, imageViewActiveFlowerSide, imageViewActiveStalk]
        
        UIView.animate(withDuration: 0.4, animations: {
            self.imageViewActiveFlower.transform = CGAffineTransform(translationX: moveValueFlowerX, y: moveValueFlowerY).scaledBy(x: scale, y: scale)
            
            self.imageViewActiveFlowerSide.transform = CGAffineTransform(translationX: moveValueFlowerSideX, y: moveValueFlowerSideY).scaledBy(x: scale, y: scale)
            
            self.imageViewActiveStalk.transform = CGAffineTransform(translationX: moveValueStalkX, y: moveValueStalkY).scaledBy(x: scale, y: scale)
            
            self.fadeSubImageViews(mainView: self.viewMain, exceptionImageView: arrExceptionImageViews, fade: 0)
        })
        //
        //
        
        
        // [fruit, fruit side]의 position 및 scale 조정 후 viewMain에 배치
        //
        let frame4Fruit = CGRect(x: imageViewActiveStalk.frame.maxX, y: imageViewActiveFlower.frame.maxY, width: viewMain.frame.maxX - imageViewActiveStalk.frame.width, height: viewMain.frame.height - imageViewActiveFlower.frame.maxY)
        
        let centerFrame4Fruit = CGPoint(x: frame4Fruit.maxX-frame4Fruit.width/2.0, y: frame4Fruit.maxY-frame4Fruit.height/2.0)
        let centerFruit = CGPoint(x: imageViewActiveFruit.center.x, y: imageViewActiveFruit.center.y)
        let centerFruitSide = CGPoint(x: imageViewActiveFruitSide.center.x, y: imageViewActiveFruitSide.center.y)
        
        let scaleX4Fruit = frame4Fruit.width / imageViewActiveFruit.frame.width
        let scaleY4Fruit = frame4Fruit.height / imageViewActiveFruit.frame.height
        var scale4Fruit = CGFloat()
        if scaleX4Fruit > scaleY4Fruit {
            scale4Fruit = scaleY4Fruit
        } else {
            scale4Fruit = scaleX4Fruit
        }
        if scale4Fruit > 1.2 {
            scale4Fruit *= 0.8
        }

        let diffCenterX4FruitSide = centerFruit.x - centerFruitSide.x
        let diffCenterY4FruitSide = centerFruit.y - centerFruitSide.y

        let moveValueFruitX = centerFrame4Fruit.x - centerFruit.x
        let moveValueFruitY = centerFrame4Fruit.y - centerFruit.y

        let moveValueFruitSideX = centerFrame4Fruit.x - centerFruitSide.x - diffCenterX4FruitSide*scale4Fruit
        let moveValueFruitSideY = centerFrame4Fruit.y - centerFruitSide.y - diffCenterY4FruitSide*scale4Fruit

        let resizingValueWidth4Fruit = imageViewActiveFruit.frame.width * (1-scale4Fruit)
        let resizingValueHeight4Fruit = imageViewActiveFruit.frame.height * (1-scale4Fruit)
        let resizingValueWidth4FruitSide = imageViewActiveFruitSide.frame.width * (1-scale4Fruit)
        let resizingValueHeight4FruitSide = imageViewActiveFruitSide.frame.height * (1-scale4Fruit)
        
        imageViewActiveFruit.frame.origin.x += moveValueFruitX + resizingValueWidth4Fruit/2.0
        imageViewActiveFruit.frame.origin.y += moveValueFruitY + resizingValueHeight4Fruit/2.0
        imageViewActiveFruit.frame.size.width *= scale4Fruit
        imageViewActiveFruit.frame.size.height *= scale4Fruit
        
        imageViewActiveFruitSide.frame.origin.x += moveValueFruitSideX + resizingValueWidth4FruitSide/2.0
        imageViewActiveFruitSide.frame.origin.y += moveValueFruitSideY + resizingValueHeight4FruitSide/2.0
        imageViewActiveFruitSide.frame.size.width *= scale4Fruit
        imageViewActiveFruitSide.frame.size.height *= scale4Fruit
        
        UIView.animate(withDuration: 0.4, animations: {
            self.imageViewActiveFruit.alpha = 1.0
            self.imageViewActiveFruitSide.alpha = 1.0
        })
        //
        //
        
        let newRectFlower = imageViewActiveFlower.frame
        buttonAfterZoomActiveStalkAndFlower = UIButton(frame: newRectFlower)
        buttonAfterZoomActiveStalkAndFlower.addTarget(self, action: #selector(clickShowStalkAndFlower), for: .touchUpInside)
        viewMain.addSubview(buttonAfterZoomActiveStalkAndFlower)
        
        let newRectFruit = imageViewActiveFruit.frame
        buttonAfterZoomActiveFruit = UIButton(frame: newRectFruit)
        buttonAfterZoomActiveFruit.addTarget(self, action: #selector(clickShowFruit), for: .touchUpInside)
        viewMain.addSubview(buttonAfterZoomActiveFruit)
        
        buttonBack.removeTarget(nil, action: nil, for: .allEvents)
        buttonBack.addTarget(self, action: #selector(clickBackAfterZoomFlowerAndFruit), for: .touchUpInside)
    }
    
    // buttonCrossSection 클릭 시, 작동 함수
    //
    @objc func clickCrossSectionAtPitcher() {
        UIView.animate(withDuration: 0.4, animations: {
            self.imageViewActivePitcher.frame.origin.x += self.imageViewActivePitcher.frame.width * 3.0
        })
        
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 0
        })
        
        let newLabelMainText = lblMain.text! + " C.S"
        lblMain.text = newLabelMainText
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 1
        })
    }
    @objc func clickCrossSectionAtFlower() {
        UIView.animate(withDuration: 0.4, animations: {
            self.imageViewActiveFlower.frame.origin.x += self.imageViewActiveFlower.frame.width * 3.0
        })
        
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 0
        })
        
        let newLabelMainText = "Flower C.S"
        lblMain.text = newLabelMainText
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 1
        })
    }
    @objc func clickCrossSectionAtPhyllodia() {
        UIView.animate(withDuration: 0.4, animations: {
            self.imageViewActivePhyllodia.frame.origin.x += self.imageViewActivePhyllodia.frame.width * 3.0
        })
        
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 0
        })
        
        let newLabelMainText = lblMain.text! + " C.S"
        lblMain.text = newLabelMainText
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 1
        })
    }
    @objc func clickCrossSectionAtFruit() {
        UIView.animate(withDuration: 0.4, animations: {
            self.imageViewActiveFruitSide.frame.origin.x += self.imageViewActiveFruitSide.frame.width * 5.0
        })
        
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 0
        })
        
        let newLabelMainText = lblMain.text! + " C.S"
        lblMain.text = newLabelMainText
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 1
        })
    }
    // buttonCrossSection 클릭하여 Side image Show 이후에 buttonCrossSection(= Recombine) 재클릭 시, 작동 함수
    //
    @objc func clickRecombineAtPitcher() {
        if !defaultCrossSection {
            UIView.animate(withDuration: 0.4, animations: {
                self.imageViewActivePitcher.frame.origin.x -= self.imageViewActivePitcher.frame.width * 3.0
            })
            
            UIView.animate(withDuration: 0.2, animations: {
                self.lblMain.alpha = 0
            })
            
            let newLabelMainText = "Pitcher"
            lblMain.text = newLabelMainText
            UIView.animate(withDuration: 0.2, animations: {
                self.lblMain.alpha = 1
            })
        } else {
            imageViewActivePitcher.frame.origin.x -= imageViewActivePitcher.frame.width * 3.0
            lblMain.text = ""
        }
    }
    @objc func clickRecombineAtFlower() {
        if !defaultCrossSection {
            UIView.animate(withDuration: 0.4, animations: {
                self.imageViewActiveFlower.frame.origin.x -= self.imageViewActiveFlower.frame.width * 3.0
            })
            
            UIView.animate(withDuration: 0.2, animations: {
                self.lblMain.alpha = 0
            })
            
            let newLabelMainText = "Flower Type"
            lblMain.text = newLabelMainText
            UIView.animate(withDuration: 0.2, animations: {
                self.lblMain.alpha = 1
            })
        } else {
            imageViewActiveFlower.frame.origin.x -= imageViewActiveFlower.frame.width * 3.0
            lblMain.text = "Flower & Fruit"
        }
    }
    @objc func clickRecombineAtPhyllodia() {
        if !defaultCrossSection {
            UIView.animate(withDuration: 0.4, animations: {
                self.imageViewActivePhyllodia.frame.origin.x -= self.imageViewActivePhyllodia.frame.width * 3.0
            })
            
            UIView.animate(withDuration: 0.2, animations: {
                self.lblMain.alpha = 0
            })
            
            let newLabelMainText = "Phyllodia"
            lblMain.text = newLabelMainText
            UIView.animate(withDuration: 0.2, animations: {
                self.lblMain.alpha = 1
            })
        } else {
            imageViewActivePhyllodia.frame.origin.x -= imageViewActivePhyllodia.frame.width * 3.0
            lblMain.text = ""
        }
    }
    @objc func clickRecombineAtFruit() {
        if !defaultCrossSection {
            UIView.animate(withDuration: 0.4, animations: {
                self.imageViewActiveFruitSide.frame.origin.x -= self.imageViewActiveFruitSide.frame.width * 5.0
            })
            
            UIView.animate(withDuration: 0.2, animations: {
                self.lblMain.alpha = 0
            })
            
            let newLabelMainText = "Fruit"
            lblMain.text = newLabelMainText
            UIView.animate(withDuration: 0.2, animations: {
                self.lblMain.alpha = 1
            })
        } else {
            imageViewActiveFruitSide.frame.origin.x -= imageViewActiveFruitSide.frame.width * 5.0
            lblMain.text = "Flower & Fruit"
        }
    }
    
    // active->zoom 이후의 Button Back 클릭 시, 원위치로 이동 함수
    //
    @objc func clickBackAfterZoomPitcher() {
        defaultShowPitcher = false
        buttonShowStem.alpha = 1
        buttonShowRoot.alpha = 1
        
        buttonShowDetail.isHidden = true
        
        viewCrossSection.alpha = 0
        if defaultCrossSection {
            clickCrossSectionInit()
        }
        
        buttonDivide.isEnabled = true
        buttonActivePitcher.isEnabled = true
        
        buttonActiveFlower.isEnabled = true
        buttonActivePhyllodia.isEnabled = true
        
        setOffMainLabel(plantGenus: _plantGenus)
        
        let arrExceptionImageViews = [imageViewActivePitcher, imageViewActivePitcherSide, imageViewActiveFruit, imageViewActiveFruitSide, imageViewActiveSeed, imageViewActiveSeed_copyLT, imageViewActiveSeed_copyRT]
        
        UIView.animate(withDuration: 0.4, animations: {
            self.imageViewActivePitcher.transform = CGAffineTransform(translationX: 0, y: 0)
            if self.imageViewActivePitcherSide.image != nil {
                self.imageViewActivePitcherSide.transform = CGAffineTransform(translationX: 0, y: 0)
            }
            self.fadeSubImageViews(mainView: self.viewMain, exceptionImageView: arrExceptionImageViews, fade: 1)
            
            self.imageViewActiveSeed_copyLT.alpha = 0
            self.imageViewActiveSeed_copyRT.alpha = 0
        })
        
        buttonBack.removeTarget(nil, action: nil, for: .allEvents)
        buttonBack.addTarget(self, action: #selector(clickDivide), for: .touchUpInside)
    }
    @objc func clickBackAfterZoomPhyllodia() {
        defaultShowPhyllodia = false
        buttonShowStem.alpha = 1
        buttonShowRoot.alpha = 1
        
        buttonShowDetail.isHidden = true
        
        viewCrossSection.alpha = 0
        if defaultCrossSection {
            clickCrossSectionInit()
        }
        
        buttonDivide.isEnabled = true
        buttonActivePhyllodia.isEnabled = true
        
        buttonActivePitcher.isEnabled = true
        buttonActiveFlower.isEnabled = true
        
        setOffMainLabel(plantGenus: _plantGenus)
        
        let arrExceptionImageViews = [imageViewActivePhyllodia, imageViewActivePhyllodiaSide, imageViewActiveFruit, imageViewActiveFruitSide, imageViewActiveSeed, imageViewActiveSeed_copyLT, imageViewActiveSeed_copyRT]
        
        UIView.animate(withDuration: 0.4, animations: {
            self.imageViewActivePhyllodia.transform = CGAffineTransform(translationX: 0, y: 0)
            if self.imageViewActivePhyllodiaSide.image != nil {
                self.imageViewActivePhyllodiaSide.transform = CGAffineTransform(translationX: 0, y: 0)
            }
            self.fadeSubImageViews(mainView: self.viewMain, exceptionImageView: arrExceptionImageViews, fade: 1)
        })
        
        buttonBack.removeTarget(nil, action: nil, for: .allEvents)
        buttonBack.addTarget(self, action: #selector(clickDivide), for: .touchUpInside)
    }
    @objc func clickBackAfterZoomFlowerAndFruit() {
        defaultShowFlowerAndFruit = false
        
        buttonRuler.isHidden = false
        viewSwitchFlowerAndFruit.isHidden = true
        
        buttonShowStem.alpha = 1
        buttonShowRoot.alpha = 1
        
        buttonDivide.isEnabled = true
        buttonActiveFlower.isEnabled = true
        
        buttonActivePitcher.isEnabled = true
        buttonActivePhyllodia.isEnabled = true
        
        setOffMainLabel(plantGenus: _plantGenus)
        
        buttonAfterZoomActiveStalkAndFlower.isHidden = true
        buttonAfterZoomActiveFruit.isHidden = true
        
        let arrExceptionImageViews = [imageViewActiveFlower, imageViewActiveFlowerSide, imageViewActiveFruit, imageViewActiveFruitSide, imageViewActiveSeed, imageViewActiveSeed_copyLT, imageViewActiveSeed_copyRT]
        
        UIView.animate(withDuration: 0.4, animations: {
            self.imageViewActiveFlower.transform = CGAffineTransform(translationX: 0, y: 0)
            if self.imageViewActiveStalk.image != nil {
                self.imageViewActiveStalk.transform = CGAffineTransform(translationX: 0, y: 0)
            }
            if self.imageViewActiveFlowerSide.image != nil {
                self.imageViewActiveFlowerSide.transform = CGAffineTransform(translationX: 0, y: 0)
            }
            if self.imageViewActiveFruit.image != nil {
                self.imageViewActiveFruit.alpha = 0
            }
            if self.imageViewActiveFruitSide.image != nil {
                self.imageViewActiveFruitSide.alpha = 0
            }
            if self.imageViewActiveSeed.image != nil {
                self.imageViewActiveSeed.alpha = 0
            }
            if self.imageViewActiveSeed_copyLT.image != nil {
                self.imageViewActiveSeed_copyLT.alpha = 0
            }
            if self.imageViewActiveSeed_copyRT.image != nil {
                self.imageViewActiveSeed.alpha = 0
            }
            self.fadeSubImageViews(mainView: self.viewMain, exceptionImageView: arrExceptionImageViews, fade: 1)
        }) { finished in
            if self.imageViewActiveFruit.image != nil {
                self.imageViewActiveFruit.transform = CGAffineTransform(translationX: 0, y: 0)
            }
            if self.imageViewActiveFruitSide.image != nil {
                self.imageViewActiveFruitSide.transform = CGAffineTransform(translationX: 0, y: 0)
            }
            if self.imageViewActiveSeed.image != nil {
                self.imageViewActiveSeed.transform = CGAffineTransform(translationX: 0, y: 0)
            }
        }
    
        buttonBack.removeTarget(nil, action: nil, for: .allEvents)
        buttonBack.addTarget(self, action: #selector(clickDivide), for: .touchUpInside)
    }
    @objc func clickBackAfterZoomFlowerOrFruit() {
        buttonAfterZoomActiveFlower.isHidden = true
        buttonAfterZoomActiveStalkAndFlower.isHidden = false
        buttonAfterZoomActiveFruit.isHidden = false
        
        buttonShowDetail.isHidden = true
        
        defaultFAFSwitch = false
        imageSwitchCircle.alpha = 0
        
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 0
        })
        
        let newLabelMainText = "Flower & Fruit"
        lblMain.text = newLabelMainText
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 1
        })
        
        if defaultShowFlower {
            if !defaultShowStalk {
                clickShowStalk()
            }
            
            defaultShowFlower = false
            buttonShowRoot.isHidden = false
            buttonShowStalk.isHidden = true
            
            defaultFAFSwitchFlower = false
            //
            //
            let centerViewMain = CGPoint(x: viewMain.frame.width/2.0, y: viewMain.frame.height/2.0)
            let centerFlower = CGPoint(x: imageViewActiveFlower.center.x, y: imageViewActiveFlower.center.y)
            let centerFlowerSide = CGPoint(x: imageViewActiveFlowerSide.center.x, y: imageViewActiveFlowerSide.center.y)
            let centerStalk = CGPoint(x: imageViewActiveStalk.center.x, y: imageViewActiveStalk.center.y)
            
            let scaleX = viewMain.bounds.width / imageViewActiveFlower.frame.width
            let scaleY = viewMain.bounds.height / imageViewActiveFlower.frame.height
            var scale = CGFloat()
            if scaleX > scaleY {
                scale = scaleY
            } else {
                scale = scaleX
            }
            
            scale /= 0.7
            
            let diffCenterX = centerFlower.x - centerFlowerSide.x
            let diffCenterY = centerFlower.y - centerFlowerSide.y
            
            let diffCenterX4Stalk = centerFlower.x - centerStalk.x
            let diffCenterY4Stalk = centerFlower.y - centerStalk.y
            
            var moveValueFlowerX = centerViewMain.x - centerFlower.x
            var moveValueFlowerY = centerViewMain.y - centerFlower.y
            
            var moveValueFlowerSideX = centerViewMain.x - centerFlowerSide.x - diffCenterX*scale
            var moveValueFlowerSideY = centerViewMain.y - centerFlowerSide.y - diffCenterY*scale
            
            let vMoveOffsetY: CGFloat = 20  // active image의 공통 y 이동값
            var moveValueStalkX = centerViewMain.x - centerStalk.x - diffCenterX4Stalk*scale + vMoveFlower*scale
            var moveValueStalkY = centerViewMain.y - centerStalk.y - diffCenterY4Stalk*scale + vMoveOffsetY*scale
            
            // 가운데로 옮겨졌을 경우의 imageViewActiveStalk의 Frame값 이용 -> 모든 이미지의 위치를 viewMain의 좌측 상단으로 이동
            let tempFrame4Stalk = tempFrameForStalk
            let modMoveValueX = -tempFrame4Stalk.minX
            let modMoveValueY = -tempFrame4Stalk.minY
            moveValueFlowerX += modMoveValueX
            moveValueFlowerY += modMoveValueY
            
            moveValueFlowerSideX += modMoveValueX
            moveValueFlowerSideY += modMoveValueY
            
            moveValueStalkX += modMoveValueX
            moveValueStalkY += modMoveValueY
            //
            
            let arrExceptionImageViews = [imageViewActiveFlower, imageViewActiveFlowerSide, imageViewActiveStalk]
            
            UIView.animate(withDuration: 0.4, animations: {
                self.imageViewActiveFlower.transform = CGAffineTransform(translationX: moveValueFlowerX, y: moveValueFlowerY).scaledBy(x: scale, y: scale)
                
                self.imageViewActiveFlowerSide.transform = CGAffineTransform(translationX: moveValueFlowerSideX, y: moveValueFlowerSideY).scaledBy(x: scale, y: scale)
                
                self.imageViewActiveStalk.transform = CGAffineTransform(translationX: moveValueStalkX, y: moveValueStalkY).scaledBy(x: scale, y: scale)
                
                self.fadeSubImageViews(mainView: self.viewMain, exceptionImageView: arrExceptionImageViews, fade: 0)
                
                self.imageViewActiveFruit.alpha = 1.0
                self.imageViewActiveFruitSide.alpha = 1.0
            })
        }
        
        if defaultShowFruit {
            defaultShowFruit = false
            
            defaultFAFSwitchFruit = false
            
            buttonShowRoot.isHidden = false
            buttonShowSeed.isHidden = true
            
            buttonAfterZoomActiveSeed.isHidden = true
            
            viewCrossSection.alpha = 0
            if defaultCrossSection {
                clickCrossSectionInit()
            }
            
            UIView.animate(withDuration: 0.4, animations: {
                self.imageViewActiveFlower.alpha = 1
                self.imageViewActiveFlowerSide.alpha = 1
                self.imageViewActiveStalk.alpha = 1
                self.imageViewActiveFruit.transform = CGAffineTransform(translationX: 0, y: 0)
                self.imageViewActiveFruitSide.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
        
        buttonBack.removeTarget(nil, action: nil, for: .allEvents)
        buttonBack.addTarget(self, action: #selector(clickBackAfterZoomFlowerAndFruit), for: .touchUpInside)
    }
    
    // buttonAfterZoomActiveStalkAndFlower -> transform(move to center) 함수
    //
    @objc func clickShowStalkAndFlower() {
        defaultShowFlower = true
        buttonShowRoot.isHidden = true
        buttonShowStalk.alpha = 1
        buttonShowStalk.isHidden = false
        buttonShowStalk.addTarget(self, action: #selector(clickShowStalk), for: .touchUpInside)
        
        tagShowDetailPart = "flower"
        tagShowDetailPartSub = "inflorescence"
        buttonShowDetail.isHidden = false
        
        defaultFAFSwitch = true
        defaultFAFSwitchFlower = true
        imageSwitchCircle.alpha = 1
        imageSwitchCircle.transform = .identity
        
        buttonAfterZoomActiveStalkAndFlower.isHidden = true
        buttonAfterZoomActiveFruit.isHidden = true
        
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 0
        })
        
        let newLabelMainText = "Inflorescence"      // == "Stalk"
        lblMain.text = newLabelMainText
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 1
        })
        //
        //
        let centerViewMain = CGPoint(x: viewMain.frame.width/2.0, y: viewMain.frame.height/2.0)
        let centerFlower = CGPoint(x: imageViewActiveFlower.center.x, y: imageViewActiveFlower.center.y)
        let centerFlowerSide = CGPoint(x: imageViewActiveFlowerSide.center.x, y: imageViewActiveFlowerSide.center.y)
        let centerStalk = CGPoint(x: imageViewActiveStalk.center.x, y: imageViewActiveStalk.center.y)
        
        let scaleX = viewMain.bounds.width / imageViewActiveFlower.frame.width
        let scaleY = viewMain.bounds.height / imageViewActiveFlower.frame.height
        var scale = CGFloat()
        if scaleX > scaleY {
            scale = scaleY
        } else {
            scale = scaleX
        }
        
        scale /= 0.7
        
        let diffCenterX = centerFlower.x - centerFlowerSide.x
        let diffCenterY = centerFlower.y - centerFlowerSide.y
        
        let diffCenterX4Stalk = centerFlower.x - centerStalk.x
        let diffCenterY4Stalk = centerFlower.y - centerStalk.y
        
        let moveValueFlowerX = centerViewMain.x - centerFlower.x
        let moveValueFlowerY = centerViewMain.y - centerFlower.y
        
        let moveValueFlowerSideX = centerViewMain.x - centerFlowerSide.x - diffCenterX*scale
        let moveValueFlowerSideY = centerViewMain.y - centerFlowerSide.y - diffCenterY*scale
        
        let vMoveOffsetY: CGFloat = 20  // active image의 공통 y 이동값
        let moveValueStalkX = centerViewMain.x - centerStalk.x - diffCenterX4Stalk*scale + vMoveFlower*scale
        let moveValueStalkY = centerViewMain.y - centerStalk.y - diffCenterY4Stalk*scale + vMoveOffsetY*scale
        
        UIView.animate(withDuration: 0.4, animations: {
            self.imageViewActiveFlower.transform = CGAffineTransform(translationX: moveValueFlowerX, y: moveValueFlowerY).scaledBy(x: scale, y: scale)
            self.imageViewActiveFlowerSide.transform = CGAffineTransform(translationX: moveValueFlowerSideX, y: moveValueFlowerSideY).scaledBy(x: scale, y: scale)
            self.imageViewActiveStalk.transform = CGAffineTransform(translationX: moveValueStalkX, y: moveValueStalkY).scaledBy(x: scale, y: scale)
            
            if self.imageViewActiveFruit.image != nil {
                self.imageViewActiveFruit.alpha = 0
            }
            if self.imageViewActiveFruitSide.image != nil {
                self.imageViewActiveFruitSide.alpha = 0
            }
            if self.imageViewActiveSeed.image != nil {
                self.imageViewActiveSeed.alpha = 0
            }
        })
        //
        //
        
        let newRect = imageViewActiveFlower.frame
        buttonAfterZoomActiveFlower = UIButton(frame: newRect)
        buttonAfterZoomActiveFlower.addTarget(self, action: #selector(clickShowStalk), for: .touchUpInside)
        viewMain.addSubview(buttonAfterZoomActiveFlower)
        
        buttonBack.removeTarget(nil, action: nil, for: .allEvents)
        buttonBack.addTarget(self, action: #selector(clickBackAfterZoomFlowerOrFruit), for: .touchUpInside)
    }
    
    // buttonAfterZoomActiveFruit -> transform(move to center) 함수
    //
    @objc func clickShowFruit() {
        defaultShowFruit = true
        
        buttonShowRoot.isHidden = true
        buttonShowSeed.isHidden = false
        
        tagShowDetailPart = "fruit"
        tagShowDetailPartSub = "fruit"
        buttonShowDetail.isHidden = false
        
        defaultFAFSwitch = true
        defaultFAFSwitchFruit = true
        let circlePaddingX: CGFloat = 4.0
        let moveValueForSwitchX = viewSwitchFlowerAndFruit.frame.width - imageSwitchCircle.frame.width - circlePaddingX * 2.0
        imageSwitchCircle.alpha = 1
        imageSwitchCircle.transform = CGAffineTransform(translationX: moveValueForSwitchX, y: 0)
        
        buttonAfterZoomActiveStalkAndFlower.isHidden = true
        buttonAfterZoomActiveFruit.isHidden = true
        
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 0
        })
        
        let newLabelMainText = "Fruit"
        lblMain.text = newLabelMainText
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 1
        })
        
        //
        //
        let centerViewMain = CGPoint(x: viewMain.frame.width/2.0, y: viewMain.frame.height/2.0)
        let centerFruit = CGPoint(x: imageViewActiveFruit.center.x, y: imageViewActiveFruit.center.y)
        let centerFruitSide = CGPoint(x: imageViewActiveFruitSide.center.x, y: imageViewActiveFruitSide.center.y)
        
        let scaleX = viewMain.bounds.width / imageViewActiveFruit.frame.width
        let scaleY = viewMain.bounds.height / imageViewActiveFruit.frame.height
        var scale = CGFloat()
        if scaleX > scaleY {
            scale = scaleY
        } else {
            scale = scaleX
        }
        if scale > 1.2 {
            scale *= 0.8
        }
        
        let diffCenterX = centerFruit.x - centerFruitSide.x
        let diffCenterY = centerFruit.y - centerFruitSide.y
        
        let moveValueFruitX = centerViewMain.x - centerFruit.x
        let moveValueFruitY = centerViewMain.y - centerFruit.y
        
        let moveValueFruitSideX = centerViewMain.x - centerFruitSide.x - diffCenterX*scale
        let moveValueFruitSideY = centerViewMain.y - centerFruitSide.y - diffCenterY*scale
        
        let arrExceptionImageViews = [imageViewActiveFruit, imageViewActiveFruitSide]

        UIView.animate(withDuration: 0.4, animations: {
            self.imageViewActiveFruit.transform = CGAffineTransform(translationX: moveValueFruitX, y: moveValueFruitY).scaledBy(x: scale, y: scale)
            
            self.imageViewActiveFruitSide.transform = CGAffineTransform(translationX: moveValueFruitSideX, y: moveValueFruitSideY).scaledBy(x: scale, y: scale)
            
            self.fadeSubImageViews(mainView: self.viewMain, exceptionImageView: arrExceptionImageViews, fade: 0)
        })
        //
        //
        
        let newRect = imageViewActiveFruit.frame
        buttonAfterZoomActiveSeed = UIButton(frame: newRect)
        buttonAfterZoomActiveSeed.addTarget(self, action: #selector(clickShowSeed), for: .touchUpInside)
        viewMain.addSubview(buttonAfterZoomActiveSeed)
        
        buttonShowSeed.removeTarget(nil, action: nil, for: .allEvents)
        buttonShowSeed.addTarget(self, action: #selector(clickShowSeed), for: .touchUpInside)
        
        buttonBack.removeTarget(nil, action: nil, for: .allEvents)
        buttonBack.addTarget(self, action: #selector(clickBackAfterZoomFlowerOrFruit), for: .touchUpInside)
        
        if imageViewActiveFruitSide.image != nil {
            UIView.animate(withDuration: 0.4, animations: {
                self.viewCrossSection.alpha = 1
            })
            tagCrossSection = "fruit"
            buttonCrossSection.removeTarget(nil, action: nil, for: .allEvents)
            buttonCrossSection.addTarget(self, action: #selector(clickCrossSection), for: .touchUpInside)
        }
    }
    
    // buttonShowStalk 작동(On or Off) 함수
    //
    @objc func clickShowStalk() {
        if !defaultShowStalk {
            defaultShowStalk = true
            
            buttonAfterZoomActiveFlower.isHidden = false
            buttonShowFlowerMap.isHidden = true
            
            tagShowDetailPart = "flower"
            tagShowDetailPartSub = "inflorescence"
            
            viewCrossSection.alpha = 0
            if defaultCrossSection {
                clickCrossSectionInit()
            }
            
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonShowStalk.setImage(UIImage(named: "button_showStalk_on"), for: .normal)
                self.imageViewActiveStalk.frame.origin.x += self.imageViewActiveStalk.frame.width * 3.0
            })
            
            UIView.animate(withDuration: 0.2, animations: {
                self.lblMain.alpha = 0
            })
            
            let newLabelMainText = "Inflorescence"      // == "Stalk"
            lblMain.text = newLabelMainText
            UIView.animate(withDuration: 0.2, animations: {
                self.lblMain.alpha = 1
            })
            
            buttonBack.removeTarget(nil, action: nil, for: .allEvents)
            buttonBack.addTarget(self, action: #selector(clickBackAfterZoomFlowerOrFruit), for: .touchUpInside)
        } else {
            defaultShowStalk = false
            
            buttonAfterZoomActiveFlower.isHidden = true
            
            tagShowDetailPart = "flower"
            tagShowDetailPartSub = "flower type"    // == flower
            
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonShowStalk.setImage(UIImage(named: "button_showStalk_off"), for: .normal)
                self.imageViewActiveStalk.frame.origin.x -= self.imageViewActiveStalk.frame.width * 3.0
            })
            
            UIView.animate(withDuration: 0.2, animations: {
                self.lblMain.alpha = 0
            })
            
            let newLabelMainText = "Flower Type"
            lblMain.text = newLabelMainText
            UIView.animate(withDuration: 0.2, animations: {
                self.lblMain.alpha = 1
            })
            
            let newRect = imageViewActiveFlower.frame
            buttonShowFlowerMap = UIButton(frame: newRect)
            buttonShowFlowerMap.addTarget(self, action: #selector(clickShowFlowerMap), for: .touchUpInside)
            viewMain.addSubview(buttonShowFlowerMap)
            
            buttonBack.removeTarget(nil, action: nil, for: .allEvents)
            buttonBack.addTarget(self, action: #selector(clickShowStalk), for: .touchUpInside)
            
            if imageViewActiveFlowerSide.image != nil {
                UIView.animate(withDuration: 0.4, animations: {
                    self.viewCrossSection.alpha = 1
                })
                tagCrossSection = "flower"
                buttonCrossSection.removeTarget(nil, action: nil, for: .allEvents)
                buttonCrossSection.addTarget(self, action: #selector(clickCrossSection), for: .touchUpInside)
            }
        }
    }
    
    @objc func clickShowFlowerMap() {
        defaultShowFlowerMap = true
        buttonShowFlowerMap.isHidden = true
        subviewFlowerMap.isHidden = false
        subviewFlowerMap.alpha = 1
        buttonShowStalk.alpha = 0
        
        imageViewActiveStalk.isHidden = true
        imageViewActiveFlower.isHidden = true
        imageViewActiveFlowerSide.isHidden = true
        viewCrossSection.isHidden = true
        
        buttonShowDetail.isHidden = true
        tagShowDetailPart = ""
        tagShowDetailPartSub = ""
        
        tagFlowerMap = "flowerMap"
        buttonFlowerMap.isUserInteractionEnabled = false
        
        imageViewActiveFlowerMap.alpha = 0
        UIView.animate(withDuration: 0.4, animations: {
            self.imageViewActiveFlowerMap.alpha = 1
        })
        
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 0
        })
        
        let newLabelMainText = "Flower Map"
        lblMain.text = newLabelMainText
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 1
        })
        
        // addTarget to all button (buttonFlowerMap, buttonFlowerMapPetal, buttonFlowerMapSepal, buttonFlowerMapStamen, buttonFlowerMapPistil)
        for buttons in stackViewFlowerMap.subviews {
            if let button = buttons as? UIButton {
                button.removeTarget(nil, action: nil, for: .allEvents)
                button.addTarget(self, action: #selector(checkButtonFlowerMap), for: .touchUpInside)
            }
        }
        
        buttonBack.removeTarget(nil, action: nil, for: .allEvents)
        buttonBack.addTarget(self, action: #selector(clickBackAfterShowFlowerMap), for: .touchUpInside)
    }
    @objc func clickBackAfterShowFlowerMap() {
        viewMain.alpha = 0
        UIView.animate(withDuration: 0.4, animations: {
            self.viewMain.alpha = 1
        })
        
        UIView.animate(withDuration: 0.2, animations: {
            self.subviewFlowerMap.alpha = 0
        }) { finished in
            self.subviewFlowerMap.isHidden = true
        }
        
        defaultShowFlowerMap = false
        buttonShowFlowerMap.isHidden = false
        buttonShowStalk.alpha = 1
        
        imageViewActiveStalk.isHidden = false
        imageViewActiveFlower.isHidden = false
        imageViewActiveFlowerSide.isHidden = false
        viewCrossSection.isHidden = false
        
        buttonShowDetail.isHidden = false
        tagShowDetailPart = "flower"
        tagShowDetailPartSub = "flower type"
        
        initStackViewFlowerMap()
        
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 0
        })
        
        let newLabelMainText = "Flower Type"
        lblMain.text = newLabelMainText
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 1
        })
        
        buttonBack.removeTarget(nil, action: nil, for: .allEvents)
        buttonBack.addTarget(self, action: #selector(clickShowStalk), for: .touchUpInside)
    }
    
    @objc func checkButtonFlowerMap(sender: UIButton) {
        // tagFlowerMap(현재 활성화되어있는 버튼의 tag값) 확인 후 -> 버튼 비활성화 + 이미지 off로 변경
        //
        if tagFlowerMap == "flowerMap" {
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonFlowerMap.setImage(UIImage(named: "button_flowerMap_off"), for: .normal)
                self.imageViewActiveFlowerMap.transform = CGAffineTransform(translationX: self.viewFlowerMap.frame.width, y: 0).scaledBy(x: 0.2, y: 0.2)
            })
            buttonFlowerMap.isUserInteractionEnabled = true
        }
        else if tagFlowerMap == "petal" {
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonFlowerMapPetal.setImage(UIImage(named: "button_petal_off"), for: .normal)
                self.imageViewActiveFlowerMapPetal.transform = CGAffineTransform(translationX: self.viewFlowerMap.frame.width, y: 0).scaledBy(x: 0.2, y: 0.2)
            })
            buttonFlowerMapPetal.isUserInteractionEnabled = true
        }
        else if tagFlowerMap == "sepal" {
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonFlowerMapSepal.setImage(UIImage(named: "button_sepal_off"), for: .normal)
                self.imageViewActiveFlowerMapSepal.transform = CGAffineTransform(translationX: self.viewFlowerMap.frame.width, y: 0).scaledBy(x: 0.2, y: 0.2)
            })
            buttonFlowerMapSepal.isUserInteractionEnabled = true
        }
        else if tagFlowerMap == "stamen" {
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonFlowerMapStamen.setImage(UIImage(named: "button_stamen_off"), for: .normal)
                self.imageViewActiveFlowerMapStamen.transform = CGAffineTransform(translationX: self.viewFlowerMap.frame.width, y: 0).scaledBy(x: 0.2, y: 0.2)
            })
            buttonFlowerMapStamen.isUserInteractionEnabled = true
        }
        else if tagFlowerMap == "pistil" {
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonFlowerMapPistil.setImage(UIImage(named: "button_pistil_off"), for: .normal)
                self.imageViewActiveFlowerMapPistil.transform = CGAffineTransform(translationX: self.viewFlowerMap.frame.width, y: 0).scaledBy(x: 0.2, y: 0.2)
            })
            buttonFlowerMapPistil.isUserInteractionEnabled = true
        }
        
        var newLabelMainText = String()
        
        // 새로이 활성화할 버튼 및 tag값 설정
        //
        if sender == buttonFlowerMap {
            buttonShowDetail.isHidden = true
            tagFlowerMap = "flowerMap"
            tagShowDetailPart = ""
            tagShowDetailPartSub = ""
            
            newLabelMainText = "Flower Map"
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonFlowerMap.setImage(UIImage(named: "button_flowerMap_on"), for: .normal)
                self.imageViewActiveFlowerMap.transform = .identity
            })
            buttonFlowerMap.isUserInteractionEnabled = false
        }
        else if sender == buttonFlowerMapPetal {
            buttonShowDetail.isHidden = false
            tagFlowerMap = "petal"
            tagShowDetailPart = "flower"
            tagShowDetailPartSub = "petal"
            
            newLabelMainText = "Petal"
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonFlowerMapPetal.setImage(UIImage(named: "button_petal_on"), for: .normal)
                self.imageViewActiveFlowerMapPetal.transform = .identity
            })
            buttonFlowerMapPetal.isUserInteractionEnabled = false
        }
        else if sender == buttonFlowerMapSepal {
            buttonShowDetail.isHidden = false
            tagFlowerMap = "sepal"
            tagShowDetailPart = "flower"
            tagShowDetailPartSub = "sepal"
            
            newLabelMainText = "Sepal"
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonFlowerMapSepal.setImage(UIImage(named: "button_sepal_on"), for: .normal)
                self.imageViewActiveFlowerMapSepal.transform = .identity
            })
            buttonFlowerMapSepal.isUserInteractionEnabled = false
        }
        else if sender == buttonFlowerMapStamen {
            buttonShowDetail.isHidden = false
            tagFlowerMap = "stamen"
            tagShowDetailPart = "flower"
            tagShowDetailPartSub = "stamen"
            
            newLabelMainText = "Stamen"
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonFlowerMapStamen.setImage(UIImage(named: "button_stamen_on"), for: .normal)
                self.imageViewActiveFlowerMapStamen.transform = .identity
            })
            buttonFlowerMapStamen.isUserInteractionEnabled = false
        }
        else if sender == buttonFlowerMapPistil {
            buttonShowDetail.isHidden = false
            tagFlowerMap = "pistil"
            tagShowDetailPart = "flower"
            tagShowDetailPartSub = "pistil"
            
            newLabelMainText = "Pistil"
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonFlowerMapPistil.setImage(UIImage(named: "button_pistil_on"), for: .normal)
                self.imageViewActiveFlowerMapPistil.transform = .identity
            })
            buttonFlowerMapPistil.isUserInteractionEnabled = false
        }
        
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 0
        })
        lblMain.text = newLabelMainText
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 1
        })
    }
    
    func initStackViewFlowerMap() {
        if tagFlowerMap == "petal" {
            buttonFlowerMapPetal.setImage(UIImage(named: "button_petal_off"), for: .normal)
            buttonFlowerMapPetal.isUserInteractionEnabled = true
            imageViewActiveFlowerMapPetal.transform = CGAffineTransform(translationX: viewFlowerMap.frame.width, y: 0).scaledBy(x: 0.2, y: 0.2)
        }
        else if tagFlowerMap == "sepal" {
            buttonFlowerMapSepal.setImage(UIImage(named: "button_sepal_off"), for: .normal)
            buttonFlowerMapSepal.isUserInteractionEnabled = true
            imageViewActiveFlowerMapSepal.transform = CGAffineTransform(translationX: viewFlowerMap.frame.width, y: 0).scaledBy(x: 0.2, y: 0.2)
        }
        else if tagFlowerMap == "stamen" {
            buttonFlowerMapStamen.setImage(UIImage(named: "button_stamen_off"), for: .normal)
            buttonFlowerMapStamen.isUserInteractionEnabled = true
            imageViewActiveFlowerMapStamen.transform = CGAffineTransform(translationX: viewFlowerMap.frame.width, y: 0).scaledBy(x: 0.2, y: 0.2)
        }
        else if tagFlowerMap == "pistil" {
            buttonFlowerMapPistil.setImage(UIImage(named: "button_pistil_off"), for: .normal)
            buttonFlowerMapPistil.isUserInteractionEnabled = true
            imageViewActiveFlowerMapPistil.transform = CGAffineTransform(translationX: viewFlowerMap.frame.width, y: 0).scaledBy(x: 0.2, y: 0.2)
        }
        tagFlowerMap = "flowerMap"
        lblMain.text = "Flower Map"
        buttonFlowerMap.setImage(UIImage(named: "button_flowerMap_on"), for: .normal)
        buttonFlowerMap.isUserInteractionEnabled = false
        imageViewActiveFlowerMap.transform = .identity
    }
    
    @objc func clickShowSeed() {
        defaultShowSeed = true
        
        tagShowDetailPart = "seed"
        tagShowDetailPartSub = "seed"
        
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 0
        })
        
        let newLabelMainText = "Seed"
        lblMain.text = newLabelMainText
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 1
        })
        
        UIView.animate(withDuration: 0.4, animations: {
            self.imageViewActiveFruit.alpha = 0
            self.imageViewActiveFruitSide.alpha = 0
            
            self.imageViewActiveSeed.alpha = 1
            self.imageViewActiveSeed.transform = self.moveCenterActiveImageView(self.buttonAfterZoomActiveSeed)
            
            self.buttonShowSeed.setImage(UIImage(named: "button_showSeed_on"), for: .normal)
        })
        
        buttonShowSeed.removeTarget(nil, action: nil, for: .allEvents)
        buttonShowSeed.addTarget(self, action: #selector(clickBackAfterShowSeed), for: .touchUpInside)
        
        buttonAfterZoomActiveSeed.removeTarget(nil, action: nil, for: .allEvents)
        buttonAfterZoomActiveSeed.addTarget(self, action: #selector(clickBackAfterShowSeed), for: .touchUpInside)
        
        buttonBack.removeTarget(nil, action: nil, for: .allEvents)
        buttonBack.addTarget(self, action: #selector(clickBackAfterShowSeed), for: .touchUpInside)
        
        viewCrossSection.alpha = 0
        if defaultCrossSection {
            clickCrossSectionInit()
        }
        
        //
        //
        if imageViewActiveSeed_copyLT.image == nil {
            let frameOfimageViewActiveSeed = imageViewActiveSeed.frame
            let scale4SeedCopy: CGFloat = 0.6
            let width4SeedCopy = frameOfimageViewActiveSeed.width * scale4SeedCopy
            let height4SeedCopy = frameOfimageViewActiveSeed.height * scale4SeedCopy
            
            let frame4SeedCopyLT_x = frameOfimageViewActiveSeed.minX - width4SeedCopy
            let frame4SeedCopyLT_y = frameOfimageViewActiveSeed.minY - height4SeedCopy
            let frame4SeedCopyLT = CGRect(x: frame4SeedCopyLT_x, y: frame4SeedCopyLT_y, width: width4SeedCopy, height: height4SeedCopy)
            let frame4SeedCopyLT_rotateAngle: CGFloat = 90
            
            let frame4SeedCopyRT_x = frameOfimageViewActiveSeed.maxX - width4SeedCopy/2.0
            let frame4SeedCopyRT_y = frameOfimageViewActiveSeed.minY - height4SeedCopy
            let frame4SeedCopyRT = CGRect(x: frame4SeedCopyRT_x, y: frame4SeedCopyRT_y, width: width4SeedCopy, height: height4SeedCopy)
            let frame4SeedCopyRT_rotateAngle: CGFloat = 150
            
            imageViewActiveSeed_copyLT.image = imageViewActiveSeed.image
            imageViewActiveSeed_copyRT.image = imageViewActiveSeed.image
            imageViewActiveSeed_copyLT.frame = frame4SeedCopyLT
            imageViewActiveSeed_copyRT.frame = frame4SeedCopyRT
            imageViewActiveSeed_copyLT.transform = CGAffineTransform(rotationAngle: frame4SeedCopyLT_rotateAngle * .pi/180)
            imageViewActiveSeed_copyRT.transform = CGAffineTransform(rotationAngle: frame4SeedCopyRT_rotateAngle * .pi/180)
            
            viewMain.addSubview(imageViewActiveSeed_copyLT)
            viewMain.addSubview(imageViewActiveSeed_copyRT)
            
            imageViewActiveSeed_copyLT.alpha = 0
            imageViewActiveSeed_copyRT.alpha = 0
            UIView.animate(withDuration: 0.4, animations: {
                self.imageViewActiveSeed_copyLT.alpha = 1
                self.imageViewActiveSeed_copyRT.alpha = 1
            })
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                self.imageViewActiveSeed_copyLT.alpha = 1
                self.imageViewActiveSeed_copyRT.alpha = 1
            })
        }
        //
        //
        
        UIView.animate(withDuration: 0.4, animations: {
            self.viewSeedZoom.alpha = 1
        })
        buttonSeedZoom.removeTarget(nil, action: nil, for: .allEvents)
        buttonSeedZoom.addTarget(self, action: #selector(clickSeedZoom), for: .touchUpInside)
    }
    @objc func clickBackAfterShowSeed() {
        defaultShowSeed = false
        
        tagShowDetailPart = "fruit"
        tagShowDetailPartSub = "fruit"
        
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 0
        })
        
        let newLabelMainText = "Fruit"
        lblMain.text = newLabelMainText
        UIView.animate(withDuration: 0.2, animations: {
            self.lblMain.alpha = 1
        })
        
        UIView.animate(withDuration: 0.4, animations: {
            self.imageViewActiveFruit.alpha = 1
            self.imageViewActiveFruitSide.alpha = 1
            
            self.imageViewActiveSeed.alpha = 0
            self.imageViewActiveSeed.transform = .identity
            
            self.buttonShowSeed.setImage(UIImage(named: "button_showSeed_off"), for: .normal)
        })
        
        buttonShowSeed.removeTarget(nil, action: nil, for: .allEvents)
        buttonShowSeed.addTarget(self, action: #selector(clickShowSeed), for: .touchUpInside)
        
        buttonAfterZoomActiveSeed.removeTarget(nil, action: nil, for: .allEvents)
        buttonAfterZoomActiveSeed.addTarget(self, action: #selector(clickShowSeed), for: .touchUpInside)
        
        buttonBack.removeTarget(nil, action: nil, for: .allEvents)
        buttonBack.addTarget(self, action: #selector(clickBackAfterZoomFlowerOrFruit), for: .touchUpInside)
        
        if imageViewActiveFruitSide.image != nil {
            UIView.animate(withDuration: 0.4, animations: {
                self.viewCrossSection.alpha = 1
            })
            tagCrossSection = "fruit"
            buttonCrossSection.removeTarget(nil, action: nil, for: .allEvents)
            buttonCrossSection.addTarget(self, action: #selector(clickCrossSection), for: .touchUpInside)
        }
        
        viewSeedZoom.alpha = 0
        if !defaultSeedZoom {
            UIView.animate(withDuration: 0.4, animations: {
                self.imageViewActiveSeed_copyLT.alpha = 0
                self.imageViewActiveSeed_copyRT.alpha = 0
            })
        } else {
            defaultSeedZoom = false
            UIView.animate(withDuration: 0.4, animations: {
                self.imageSeedZoomCircle.transform = CGAffineTransform(translationX: 0, y: 0)
                self.imageSeedZoomCircle.image = UIImage(named: "image_seedZoom_in")
                self.imageViewActiveSeed.transform = .identity
            })
        }
    }
    
    @objc func clickSeedZoom() {
        // Seed - Zoom in
        if !defaultSeedZoom {
            defaultSeedZoom = true
            let circlePaddingX: CGFloat = 2
            let moveX: CGFloat = viewSeedZoom.frame.width - imageSeedZoomCircle.frame.width - circlePaddingX * 2.0
            UIView.animate(withDuration: 0.4, animations: {
                self.imageSeedZoomCircle.image = UIImage(named: "image_seedZoom_out")
                self.imageSeedZoomCircle.transform = CGAffineTransform(translationX: moveX, y: 0)
            })
            
            let scaleX = viewMain.bounds.width / imageViewActiveSeed.frame.width
            let scaleY = viewMain.bounds.height / imageViewActiveSeed.frame.height
            var scale = CGFloat()
            if scaleX > scaleY {
                scale = scaleY
            } else {
                scale = scaleX
            }
            if scale > 1.2 {
                scale *= 0.8
            }
            
            UIView.animate(withDuration: 0.4, animations: {
                self.imageViewActiveSeed_copyLT.alpha = 0
                self.imageViewActiveSeed_copyRT.alpha = 0
                self.imageViewActiveSeed.transform = CGAffineTransform(scaleX: scale, y: scale)
            })
        }
        // Seed - Zoom out
        else {
            defaultSeedZoom = false
            UIView.animate(withDuration: 0.4, animations: {
                self.imageSeedZoomCircle.image = UIImage(named: "image_seedZoom_in")
                self.imageSeedZoomCircle.transform = .identity
            })
            
            UIView.animate(withDuration: 0.4, animations: {
                self.imageViewActiveSeed_copyLT.alpha = 1
                self.imageViewActiveSeed_copyRT.alpha = 1
                self.imageViewActiveSeed.transform = .identity
            })
        }
    }
    // 이미지 divide 애니메이션 함수
    //
    @objc func activeDivide(_ plantGenus: String) {
        if plantGenus == "Sarracenia" {
            animationDivide([imageViewActivePitcher, imageViewActivePitcherSide])
            animationDivide([imageViewActiveFlower, imageViewActiveFlowerSide])
            animationDivide([imageViewActivePhyllodia])
        }
        
    }
    
    // 이미지 assemble 애니메이션 함수
    //
    @objc func activeAssemble(_ plantGenus: String) {
        if plantGenus == "Sarracenia" {
            animationAssemble([imageViewActivePitcher, imageViewActivePitcherSide])
            animationAssemble([imageViewActiveFlower, imageViewActiveFlowerSide])
            animationAssemble([imageViewActivePhyllodia])
        }
    }
    
    // 이미지 divide 함수
    //
    func animationDivide(_ imageView: [UIImageView]) {
        var valueMove = CGFloat()
        let valueMoveOffset: CGFloat = 10
        if imageView.count == 1 {
            let _imageView: UIImageView = imageView[0]
            if _imageView.center.x > buttonDivide.center.x {
                valueMove = viewMain.frame.maxX - _imageView.frame.maxX - valueMoveOffset
                UIView.animate(withDuration: 0.4, animations: {
                    _imageView.frame.origin.x += valueMove

                    _imageView.frame.origin.y -= 20
                })
            } else {
                valueMove = _imageView.frame.minX - viewMain.frame.minX - valueMoveOffset
                UIView.animate(withDuration: 0.4, animations: {
                    _imageView.frame.origin.x -= valueMove

                    _imageView.frame.origin.y += 20
                })
            }
        }
        else if imageView.count == 2 {
            let imageView1st: UIImageView = imageView[0]
            let imageView2nd: UIImageView = imageView[1]
            if imageView1st.center.x > buttonDivide.center.x {
                valueMove = viewMain.frame.maxX - imageView1st.frame.maxX - valueMoveOffset
                UIView.animate(withDuration: 0.4, animations: {
                    imageView1st.frame.origin.x += valueMove
                    imageView2nd.frame.origin.x += valueMove

                    imageView1st.frame.origin.y += 20
                    imageView2nd.frame.origin.y += 20
                })
            } else {
                valueMove = imageView1st.frame.minX - viewMain.frame.minX - valueMoveOffset
                UIView.animate(withDuration: 0.4, animations: {
                    imageView1st.frame.origin.x -= valueMove
                    imageView2nd.frame.origin.x -= valueMove

                    imageView1st.frame.origin.y -= 20
                    imageView2nd.frame.origin.y -= 20
                })
            }
        }

        if imageView.contains(imageViewActivePitcher) {
            vMovePitcher = valueMove
        }
        else if imageView.contains(imageViewActiveFlower) {
            vMoveFlower = valueMove
        }
        else if imageView.contains(imageViewActivePhyllodia) {
            vMovePhyllodia = valueMove
        }
    }
    
    // 이미지 assemble 함수
    //
    func animationAssemble(_ imageView: [UIImageView]) {
        var valueMove = CGFloat()
        if imageView.contains(imageViewActivePitcher) {
            valueMove = vMovePitcher
        }
        else if imageView.contains(imageViewActiveFlower) {
            valueMove = vMoveFlower
        }
        else if imageView.contains(imageViewActivePhyllodia) {
            valueMove = vMovePhyllodia
        }
        
        if imageView.count == 1 {
            let _imageView: UIImageView = imageView[0]
            if _imageView.center.x > buttonDivide.center.x {
                UIView.animate(withDuration: 0.4, animations: {
                    _imageView.frame.origin.x -= valueMove
                    
                    _imageView.frame.origin.y += 20
                })
            } else {
                UIView.animate(withDuration: 0.4, animations: {
                    _imageView.frame.origin.x += valueMove
                    
                    _imageView.frame.origin.y -= 20
                })
            }
        }
        else if imageView.count == 2 {
            let imageView1st: UIImageView = imageView[0]
            let imageView2nd: UIImageView = imageView[1]
            if imageView1st.center.x > buttonDivide.center.x {
                UIView.animate(withDuration: 0.4, animations: {
                    imageView1st.frame.origin.x -= valueMove
                    imageView2nd.frame.origin.x -= valueMove
                    
                    imageView1st.frame.origin.y -= 20
                    imageView2nd.frame.origin.y -= 20
                })
            } else {
                UIView.animate(withDuration: 0.4, animations: {
                    imageView1st.frame.origin.x += valueMove
                    imageView2nd.frame.origin.x += valueMove
                    
                    imageView1st.frame.origin.y += 20
                    imageView2nd.frame.origin.y += 20
                })
            }
        }
    }
    
    // 디렉토리 읽어서 이미지 파일 로드 및 변수 저장
    //
    func addImageToMainImageView(_ plantGenus: String) {
        do {
            let imageFiles: [String] = try FileManager.default.contentsOfDirectory(atPath: imageFilesDir + _plant)
            
            // 액티브 파일 디렉토리
            if plantGenus == "Sarracenia" {
                for i in 0..<imageFiles.count {
//                    //imageViewFull = default image in viewRuler
//                    if imageFiles[i].contains("full") {
//                        imageViewFull = setEachImageView(mainView: viewMain, imageFile: imageFiles[i])
//                    }
                    if imageFiles[i].contains("nonactive") {
                        imageViewNonActive = setEachImageView(mainView: viewMain, imageFile: imageFiles[i])
                    }
//                    if imageFiles[i].contains("pitcher") {
//                        if !imageFiles[i].contains("side") {
//                            imageViewActivePitcher = setEachImageView(mainView: viewMain, imageFile: imageFiles[i])
//                        } else {
//                            imageViewActivePitcherSide = setEachImageView(mainView: viewMain, imageFile: imageFiles[i])
//                        }
//                    }
//                    if imageFiles[i].contains("flower") {
//                        if !imageFiles[i].contains("side") {
//                            imageViewActiveFlower = setEachImageView(mainView: viewMain, imageFile: imageFiles[i])
//                        } else {
//                            imageViewActiveFlowerSide = setEachImageView(mainView: viewMain, imageFile: imageFiles[i])
//                        }
//                    }
//                    if imageFiles[i].contains("stalk") {
//                        imageViewActiveStalk = setEachImageView(mainView: viewMain, imageFile: imageFiles[i])
//                    }
//                    if imageFiles[i].contains("phyllodia") {
//                        imageViewActivePhyllodia = setEachImageView(mainView: viewMain, imageFile: imageFiles[i])
//                    }
//                    if imageFiles[i].contains("fruit") {
//                        if !imageFiles[i].contains("side") {
//                            imageViewActiveFruit = setEachImageView(mainView: viewMain, imageFile: imageFiles[i])
//                        } else {
//                            imageViewActiveFruitSide = setEachImageView(mainView: viewMain, imageFile: imageFiles[i])
//                        }
//                    }
//                    if imageFiles[i].contains("seed") {
//                        imageViewActiveSeed = setEachImageView(mainView: viewMain, imageFile: imageFiles[i])
//                    }
//
//                    // imageviews for flower map
//                    if imageFiles[i].contains("flowerMap") {
//                        imageViewActiveFlowerMap = setEachImageView(mainView: viewFlowerMap, imageFile: imageFiles[i])
//                    }
//                    if imageFiles[i].contains("petal") {
//                        imageViewActiveFlowerMapPetal = setEachImageView(mainView: viewFlowerMap, imageFile: imageFiles[i])
//                    }
//                    if imageFiles[i].contains("sepal") {
//                        imageViewActiveFlowerMapSepal = setEachImageView(mainView: viewFlowerMap, imageFile: imageFiles[i])
//                    }
//                    if imageFiles[i].contains("stamen") {
//                        imageViewActiveFlowerMapStamen = setEachImageView(mainView: viewFlowerMap, imageFile: imageFiles[i])
//                    }
//                    if imageFiles[i].contains("pistil") {
//                        imageViewActiveFlowerMapPistil = setEachImageView(mainView: viewFlowerMap, imageFile: imageFiles[i])
//                    }
//                    //
                }
//                viewMain.addSubview(imageViewActiveFlowerSide)
//                viewMain.addSubview(imageViewActiveFlower)
//                viewMain.addSubview(imageViewActiveStalk)
//                viewMain.addSubview(imageViewActivePhyllodia)
                viewMain.addSubview(imageViewNonActive)
//                viewMain.addSubview(imageViewActivePitcherSide)
//                viewMain.addSubview(imageViewActivePitcher)
//
//                // fruit, fruit side -> alpha=0
//                viewMain.addSubview(imageViewActiveFruit)
//                imageViewActiveFruit.alpha = 0
//                viewMain.addSubview(imageViewActiveFruitSide)
//                imageViewActiveFruitSide.alpha = 0
//
//                // seed, seed group -> alpha=0
//                viewMain.addSubview(imageViewActiveSeed)
//                imageViewActiveSeed.alpha = 0
//
//                // flower map -> alpha=0
//                viewFlowerMap.addSubview(imageViewActiveFlowerMap)
//                viewFlowerMap.addSubview(imageViewActiveFlowerMapPetal)
//                viewFlowerMap.addSubview(imageViewActiveFlowerMapSepal)
//                viewFlowerMap.addSubview(imageViewActiveFlowerMapStamen)
//                viewFlowerMap.addSubview(imageViewActiveFlowerMapPistil)
//                imageViewActiveFlowerMapPetal.transform = CGAffineTransform(translationX: viewFlowerMap.frame.width, y: 0).scaledBy(x: 0.2, y: 0.2)
//                imageViewActiveFlowerMapSepal.transform = CGAffineTransform(translationX: viewFlowerMap.frame.width, y: 0).scaledBy(x: 0.2, y: 0.2)
//                imageViewActiveFlowerMapStamen.transform = CGAffineTransform(translationX: viewFlowerMap.frame.width, y: 0).scaledBy(x: 0.2, y: 0.2)
//                imageViewActiveFlowerMapPistil.transform = CGAffineTransform(translationX: viewFlowerMap.frame.width, y: 0).scaledBy(x: 0.2, y: 0.2)
            }
//            else if {
//
//            }
        } catch {
            print(error.localizedDescription)
        }
    }

    // cropped 이미지 설정
    //
    func setEachImageView(mainView: UIView, imageFile: String) -> UIImageView {
        let image = UIImage(named: imageFile)
        let croppedImageAndRect = getCroppedImageAndRectFromImage(mainView, image!)
        let imageView = UIImageView(frame: croppedImageAndRect.scaledRect)
        imageView.image = croppedImageAndRect.croppedImage
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }
    
    // bitmap으로 변환된 이미지에서 특정 이미지 crop 및 rect 반환
    //
    func getCroppedImageAndRectFromImage(_ view: UIView, _ image: UIImage) -> (croppedImage: UIImage, scaledRect: CGRect) {
        let cgImage = image.cgImage!
        let imageWidth = cgImage.width
        let imageHeight = cgImage.height
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bytesPerPixel = 4
        let bytesPerRow = bytesPerPixel * imageWidth
        let bitmapData = malloc(imageHeight * imageWidth * 4)
        let bitsPerComponent = 8
        let bitmapInfo: UInt32 = CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Big.rawValue
        let context = CGContext(data: bitmapData, width: imageWidth, height: imageHeight, bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo)
        var rect = CGRect(x: 0, y: 0, width: CGFloat(imageWidth), height: CGFloat(imageHeight))
        context?.draw(cgImage, in: rect)
        
        let pixelData = cgImage.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        var minX: CGFloat = CGFloat(imageWidth)
        var minY: CGFloat = CGFloat(imageHeight)
        var maxX: CGFloat = 0
        var maxY: CGFloat = 0
        
        //Filter through data and look for non-transparent pixels.
        for y in 0..<imageHeight {
            for x in 0..<imageWidth {
                let pixelIndex = (imageWidth * y + x) * 4 /* 4 for A, R, G, B */
                
                if data[Int(pixelIndex)] != 0 { //Alpha value is not zero pixel is not transparent.
                    if x < Int(minX) {
                        minX = CGFloat(x)
                    }
                    if x > Int(maxX) {
                        maxX = CGFloat(x)
                    }
                    if y < Int(minY) {
                        minY = CGFloat(y)
                    }
                    if y > Int(maxY) {
                        maxY = CGFloat(y)
                    }
                }
            }
        }
        
        rect = CGRect(x: minX, y: minY, width: (maxX-minX), height: (maxY-minY))
        let croppedImage = UIImage(cgImage: (image.cgImage?.cropping(to: rect))!)
        
        let imageViewWidth = CGFloat(view.frame.size.width)
        let imageViewHeight = CGFloat(view.frame.size.height)
        
        let aspectWidth = imageViewWidth / CGFloat(imageWidth)
        let aspectHeight = imageViewHeight / CGFloat(imageHeight)

        let aspectFillRatio = max(aspectWidth, aspectHeight)

        let xOffset = (imageViewWidth - CGFloat(imageWidth)*aspectFillRatio) / 2.0
        let yOffset = (imageViewHeight - CGFloat(imageHeight)*aspectFillRatio) / 2.0

        let scaledMinX = minX * aspectFillRatio + xOffset
        let scaledMaxX = maxX * aspectFillRatio + xOffset
        let scaledMinY = minY * aspectFillRatio + yOffset
        let scaledMaxY = maxY * aspectFillRatio + yOffset
        
        let scaledRect = CGRect(x: scaledMinX, y: scaledMinY, width: (scaledMaxX-scaledMinX), height: (scaledMaxY-scaledMinY))
        
        return (croppedImage: croppedImage, scaledRect: scaledRect)
    }
    
    //
    //
    func bg(_ rect: CGRect) {
        let bg = UIImageView(frame: rect)
        bg.layer.masksToBounds = true
        bg.layer.borderWidth = 0.5
        bg.layer.borderColor = UIColor.red.cgColor
        viewMain.addSubview(bg)
    }
    func point(_ point: CGPoint) {
        let rect = CGRect(x: point.x, y: point.y, width: 3, height: 3)
        let point = UIImageView(frame: rect)
        point.backgroundColor = .red
        viewMain.addSubview(point)
    }
    //
}
