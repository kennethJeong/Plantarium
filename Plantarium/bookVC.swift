//
//  bookVC.swift
//  newNotitle1
//
//  Created by 정은후 on 2021/02/05.
//  Copyright © 2021 정은후. All rights reserved.
//

import UIKit
import RealmSwift

class bookVC: UIViewController {
    @IBOutlet var viewHeader: UIView!
    @IBOutlet var sliderBackground: UIImageView!
    @IBOutlet var viewSlider: UIView!
    @IBOutlet var buttonSlider: UIButton!
    
    @IBOutlet var viewBody: UIView!
    @IBOutlet var viewTop: UIView!
    @IBOutlet var viewTopLabel: UIView!
    @IBOutlet var imageViewVerticalBar: UIImageView!
    @IBOutlet var labelMain: UILabel!
    
    @IBOutlet var viewRuler: UIView!
    @IBOutlet var buttonRuler: UIButton!
    @IBOutlet var stackViewRuler: UIStackView!
    @IBOutlet var buttonRulerCard: UIButton!
    @IBOutlet var buttonRulerBasketBall: UIButton!
    @IBOutlet var buttonRulerMan: UIButton!
    
    @IBOutlet var viewMain: UIView!
    @IBOutlet var buttonDivide: UIButton!
    @IBOutlet var buttonShowDetail: UIButton!
    
    @IBOutlet var viewPartsContainer: UIView!
    
    @IBOutlet var viewBottom: UIView!
    @IBOutlet var buttonBack: UIButton!
    @IBOutlet var buttonGoFirst: UIButton!
    @IBOutlet var buttonClose: UIButton!
    @IBOutlet var buttonShowRoot: UIButton!
    @IBOutlet var buttonShowStalk: UIButton!
    @IBOutlet var buttonShowSeed: UIButton!
    
    @IBOutlet var viewSwitchFlowerAndFruit: UIView!
    @IBOutlet var imageSwitchCircle: UIImageView!
    @IBOutlet var buttonSwitchFlower: UIButton!
    @IBOutlet var buttonSwitchFruit: UIButton!
    
    @IBOutlet var viewAboutContainer: UIView!
    
    
    // data From SearchNameVC or SearchMontageVC
    //
    var _plant: String = ""
    var _plantSName: String = ""
    var _plantCName: String = ""
    var _plantFamily: String = ""
    var _plantOrder: String = ""
    var _plantGenus: String = ""
    var _plantHeight: CGFloat = 70          // !! 임시로 설정된 값 !! 수정 필요 !!
    //
    
 
    var dicPartsImageView = [String : UIImageView]()
    var dicPartsButton = [String : UIButton]()
    
    var defaultDivide: Bool = false
    
    var tagSuperTitle: String = "system"
    var tagMainTitle: String = "life"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        _plant = "Sarracenia alata   "
        _plantSName = _plant.trimmingCharacters(in: .whitespacesAndNewlines)
        _plantCName = "Pale Pitcher Plant"
        _plantFamily = "Sarraceniaceae"
        _plantOrder = "Ericales"
        _plantGenus = "Sarracenia"
        //
        
        viewMain.clipsToBounds = true
        
        DispatchQueue.main.async {
            self.addImageToMainImageView(self._plant)     // 이미지 파일 로드
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
        
        // viewSwitchFlowerAndFruit 설정
        viewSwitchFlowerAndFruit.layer.cornerRadius = viewSwitchFlowerAndFruit.frame.height / 2.0
        viewSwitchFlowerAndFruit.layer.borderWidth = 0
        
        // buttonDivide버튼 작동 함수
        buttonDivide.addTarget(self, action: #selector(clickDivide), for: .touchUpInside)
        
        // buttonShowDetail 작동 함수 설정
        buttonShowDetail.addTarget(self, action: #selector(clickShowDetail), for: .touchUpInside)
        
        // child viewController에서 다시 돌아왔을 때 _buttonBack에 부여할 함수 저장
        NotificationCenter.default.addObserver(self, selector: #selector(clickDivide), name: NSNotification.Name(rawValue: "clickDivide"), object: nil)
        
        // child viewController에서 다시 돌아왔을 때 buttonRuler에 부여할 함수 저장
        NotificationCenter.default.addObserver(self, selector: #selector(clickRuler), name: NSNotification.Name(rawValue: "clickRuler"), object: nil)
    }
    
    // var buttonSlider 의 클릭 함수
    //
    @IBAction func clickSlider(_ sender: UIButton) {
        let moveValue = sliderBackground.frame.width - viewSlider.frame.width
        let isMoved = (sliderBackground.frame.maxX - viewSlider.frame.maxX == 0) ? true : false
        if !isMoved {
            viewAboutContainer.isHidden = false
            viewAboutContainer.alpha = 0
            UIView.animate(withDuration: 0.4, animations: {
                self.viewSlider.transform = CGAffineTransform(translationX: moveValue, y: 0)
                self.viewBody.alpha = 0
                self.viewAboutContainer.alpha = 1
            }) { finished in
                self.viewBody.isHidden = true
            }
            
            if viewAboutContainer.subviews.count == 0 {
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "bookAboutVC") as! bookAboutVC
                vc._plant = _plant
                vc.view.frame = viewAboutContainer.bounds
                viewAboutContainer.addSubview(vc.view)
                self.addChild(vc)
                vc.didMove(toParent: self)
            }
        } else {
            viewBody.isHidden = false
            viewBody.alpha = 0
            UIView.animate(withDuration: 0.4, animations: {
                self.viewSlider.transform = .identity
                self.viewBody.alpha = 1
                self.viewAboutContainer.alpha = 0
            }) { finished in
                self.viewAboutContainer.isHidden = true
            }
        }
    }
    
    @objc func clickDivide() {
        if !defaultDivide {
            defaultDivide = true
            buttonShowDetail.isHidden = true
            scaleActiveImageView(divide_or_assemble: "divide")
            addButtonAfterDivide(dicPartsImageView)     // 각 active imageview에 버튼 추가
            
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonBack.alpha = 1
                self.buttonGoFirst.alpha = 1
                self.buttonShowRoot.alpha = 1
            })
            buttonBack.removeTarget(nil, action: nil, for: .allEvents)
            buttonBack.addTarget(self, action: #selector(clickDivide), for: .touchUpInside)
            
            print("// divide //")
        } else {
            defaultDivide = false
            buttonShowDetail.isHidden = false
            scaleActiveImageView(divide_or_assemble: "assemble")
            removeButtonAfterDivide(dicPartsButton)     // 각 active imageview에 버튼 추가된 버튼 제거
            
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonBack.alpha = 0
                self.buttonGoFirst.alpha = 0
                self.buttonShowRoot.alpha = 0
            })
            
            print("// assemble //")
        }
    }
    
    // Detail 팝업 작동 함수
    //
    @objc func clickShowDetail() {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "bookShowDetailVC") as? bookShowDetailVC else {
            return
        }
        rvc._plant = _plant
        rvc.tagSuperTitle = tagSuperTitle
        rvc.tagMainTitle = tagMainTitle

        rvc.modalPresentationStyle = .overCurrentContext
        rvc.modalTransitionStyle = .coverVertical
        self.present(rvc, animated: true, completion: nil)
    }
    
    // 첫 화면으로 돌아가기 위한 함수
    //
    @IBAction func clickGoFirst(_ sender: UIButton) {
        clickDivide()
    }
    
    // dismiss [bookVC] 함수
    //
    @IBAction func clickClose(_ sender: UIButton) {
    }
    
    // buttonRuler 작동 함수
    //
    @IBAction func clickRuler(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "bookRulerVC") as? bookRulerVC else {
            return
        }
        vc._plant = _plant
        vc._plantHeight = _plantHeight
        vc._viewRuler = viewRuler
        vc._buttonRuler = buttonRuler
        vc._viewTopLabel = viewTopLabel
        vc._viewFrameSize = viewRuler.frame.size
        vc._stackViewRuler = stackViewRuler
        vc._buttonRulerCard = buttonRulerCard
        vc._buttonRulerBasketBall = buttonRulerBasketBall
        vc._buttonRulerMan = buttonRulerMan
        
        viewRuler.isHidden = false
        vc.view.frame = viewRuler.bounds
        viewRuler.addSubview(vc.view)
        self.addChild(vc)
        vc.didMove(toParent: self)
    }
    
    // 뿌리부분 보기 함수
    //
    @IBAction func clickShowRoot(_ sender: UIButton) {
    }
    
    // 활성화된 이미지 확대 or 축소 함수
    //
    func scaleActiveImageView(divide_or_assemble: String) {
        let scale: CGFloat = 1.1    // 110% 확대
        if divide_or_assemble == "divide" {
            for iv in viewMain.subviews {
                if iv is UIImageView {
                    iv.alpha = 0.3
                }
            }
            for (_, partsImageView) in dicPartsImageView {
                partsImageView.alpha = 1.0
                
                UIView.animate(withDuration: 0.4, animations: {
                    partsImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
                })
            }
        }
        else if divide_or_assemble == "assemble" {
            for iv in viewMain.subviews {
                if iv is UIImageView {
                    iv.alpha = 1.0
                }
            }
            for (_, partsImageView) in dicPartsImageView {
                UIView.animate(withDuration: 0.4, animations: {
                    partsImageView.transform = .identity
                })
            }
        }
    }
    
    // 활성화된 이미지의 '버튼' 생성 함수
    //
    func addButtonAfterDivide(_ dicPartsImageView: [String : UIImageView]) {
        for (parts, partsImageView) in dicPartsImageView {
            if !parts.contains("side") {
                let imageViewFrame = partsImageView.frame
                let partsButton = UIButton(frame: imageViewFrame)
                partsButton.addTarget(self, action: #selector(clickActiveButton), for: .touchUpInside)
                viewMain.addSubview(partsButton)
                
                dicPartsButton[parts] = partsButton
            }
        }
    }
    
    // assemble 후, 활성화된 이미지의 버튼 제거 함수
    //
    func removeButtonAfterDivide(_ dicPartsButton: [String : UIButton]) {
        for (_, partsButton) in dicPartsButton {
            partsButton.removeFromSuperview()
        }
    }
    
    // active 이미지 클릭 시, 각 parts의 view transition 함수
    //
    @objc func clickActiveButton(_ sender: UIButton) {
        for (parts, partsButton) in dicPartsButton {
            if sender == partsButton {
                var dicActiveImageView = [String: UIImageView]()
                
                if dicPartsImageView[parts+"_side"] != nil {
                    let activeSideImageView = UIImageView(image: dicPartsImageView[parts+"_side"]!.image)
                    activeSideImageView.frame = dicPartsImageView[parts+"_side"]!.frame
                    activeSideImageView.transform = CGAffineTransform(scaleX: 1/1.1, y: 1/1.1)   // scaleActiveImageView 함수로 인해 변경된 transform 초기화
                    dicActiveImageView[parts+"_side"] = activeSideImageView
                }
                let activeImageView = UIImageView(image: dicPartsImageView[parts]!.image)
                activeImageView.frame = dicPartsImageView[parts]!.frame
                activeImageView.transform = CGAffineTransform(scaleX: 1/1.1, y: 1/1.1)   // scaleActiveImageView 함수로 인해 변경된 transform 초기화
                dicActiveImageView[parts] = activeImageView
                
                var vc = UIViewController()
                if parts == "pitcher" {
                    let rvc = self.storyboard!.instantiateViewController(withIdentifier: "bookPartsPitcherVC") as! bookPartsPitcherVC
                    rvc._plant = _plant
                    rvc._parts = parts
                    rvc._viewTopLabel = viewTopLabel
                    rvc._labelMain = labelMain
                    rvc._dicActiveImageView = dicActiveImageView
                    rvc._activeButton = partsButton
                    rvc._viewFrameSize = viewMain.frame.size
                    rvc._buttonShowRoot = buttonShowRoot
                    rvc._buttonBack = buttonBack
                    rvc._buttonGoFirst = buttonGoFirst
                    vc = rvc
                }
                else if parts == "phyllodia" {
                    let rvc = self.storyboard!.instantiateViewController(withIdentifier: "bookPartsPhyllodiaVC") as! bookPartsPhyllodiaVC
                    rvc._plant = _plant
                    rvc._parts = parts
                    rvc._viewTopLabel = viewTopLabel
                    rvc._labelMain = labelMain
                    rvc._dicActiveImageView = dicActiveImageView
                    rvc._activeButton = partsButton
                    rvc._viewFrameSize = viewMain.frame.size
                    rvc._buttonShowRoot = buttonShowRoot
                    rvc._buttonBack = buttonBack
                    rvc._buttonGoFirst = buttonGoFirst
                    vc = rvc
                }
                else if parts == "flower" {
                    let rvc = self.storyboard!.instantiateViewController(withIdentifier: "bookPartsFlowerAndFruitVC") as! bookPartsFlowerAndFruitVC
                    rvc._plant = _plant
                    rvc._parts = parts
                    rvc._viewTopLabel = viewTopLabel
                    rvc._labelMain = labelMain
                    rvc._dicActiveImageView = dicActiveImageView
                    rvc._activeButton = partsButton
                    rvc._viewFrameSize = viewMain.frame.size
                    rvc._viewSwitch = viewSwitchFlowerAndFruit
                    rvc._imageViewSwitch = imageSwitchCircle
                    rvc._buttonSwitchFlower = buttonSwitchFlower
                    rvc._buttonSwitchFruit = buttonSwitchFruit
                    rvc._buttonShowStalk = buttonShowStalk
                    rvc._buttonShowSeed = buttonShowSeed
                    rvc._buttonShowRoot = buttonShowRoot
                    rvc._buttonBack = buttonBack
                    rvc._buttonGoFirst = buttonGoFirst
                    vc = rvc
                }
                
                vc.view.frame = viewMain.bounds
                viewMain.addSubview(vc.view)
                self.addChild(vc)
                vc.didMove(toParent: self)
            }
        }
    }
    
    // 디렉토리 읽어서 이미지 파일 로드 및 변수 저장
    //
    func addImageToMainImageView(_ _plant: String) {
        let arrPartsForInit = ["flower", "stalk", "phyllodia", "nonactive", "pitcher"]  // viewMain에 넣을 초기 이미지 -> 순서대로 배치해야함.
        let arrPartsForInitExpection = ["stalk", "nonactive"]   // 버튼으로 활성화하지않을 Parts
        
        for i in 0..<arrPartsForInit.count {
            let partsForInit = arrPartsForInit[i]
            let imageFileName = _plant + "_" + partsForInit
            let imageFileNameForSide = imageFileName + "_side"
            
            // 단면(side) 이미지 파일이 있다면 imageView로 추가
            var imageViewForSideToBeAdded = UIImageView()
            if UIImage(named: imageFileNameForSide) != nil {
                imageViewForSideToBeAdded = self.setEachImageView(mainView: self.viewMain, imageFile: imageFileNameForSide)
                viewMain.addSubview(imageViewForSideToBeAdded)
                
                let partsSideForInit = partsForInit + "_side"
                dicPartsImageView[partsSideForInit] = imageViewForSideToBeAdded
            }
            
            let imageViewToBeAdded: UIImageView = self.setEachImageView(mainView: self.viewMain, imageFile: imageFileName)
            viewMain.addSubview(imageViewToBeAdded)
            
            // 버튼이 필요한 parts만 dictionary에 추가
            if !arrPartsForInitExpection.contains(partsForInit) {
                dicPartsImageView[partsForInit] = imageViewToBeAdded
            }
        }
    }
    
    // cropped 이미지 설정
    //
    func setEachImageView(mainView: UIView, imageFile: String) -> UIImageView {
        let image = UIImage(named: imageFile)
        let croppedImageAndRect = getCroppedImageAndRectFromImage(mainView, image!)
        let imageView = UIImageView(frame: croppedImageAndRect.croppedRect)
        imageView.image = croppedImageAndRect.croppedImage
        
        return imageView
    }
    
    // bitmap으로 변환된 이미지에서 특정 이미지 crop 및 rect 반환
    //
    func getCroppedImageAndRectFromImage(_ view: UIView, _ image: UIImage) -> (croppedImage: UIImage, croppedRect: CGRect) {
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
        
        let croppedRect = CGRect(x: scaledMinX, y: scaledMinY, width: (scaledMaxX-scaledMinX), height: (scaledMaxY-scaledMinY))
        
        return (croppedImage: croppedImage, croppedRect: croppedRect)
    }
}
