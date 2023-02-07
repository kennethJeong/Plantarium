//
//  bookPartsFlowerAndFruitVC.swift
//  newNotitle1
//
//  Created by 정은후 on 2021/02/15.
//  Copyright © 2021 정은후. All rights reserved.
//

import UIKit

class bookPartsFlowerAndFruitVC: UIViewController {
    // 전달받은 변수들
    var _plant = String()
    var _parts = String()
    var _labelMain = UILabel()
    var _viewTopLabel = UIView()
    var _dicActiveImageView = [String : UIImageView]()
    var _activeButton = UIButton()
    var _viewFrameSize = CGSize()
    var _viewSwitch = UIView()
    var _imageViewSwitch = UIImageView()
    var _buttonSwitchFlower = UIButton()
    var _buttonSwitchFruit = UIButton()
    var _buttonShowRoot = UIButton()
    var _buttonShowStalk = UIButton()
    var _buttonShowSeed = UIButton()
    var _buttonBack = UIButton()
    var _buttonGoFirst = UIButton()
    //
    
    var arrActiveImageView = [UIImageView]()    // main view에 보여져야할 imageView 순서대로 담겨진 배열
    var dicActiveImageViewAboutFlower = [String : UIImageView]()    // flower와 관련된 imageView만 담긴 dictionary
    var dicActiveImageViewAboutFruit = [String : UIImageView]()    // fruit과 관련된 imageView만 담긴 dictionary
    
    // active imageViews
    var imageViewFlower = UIImageView()
    var imageViewFlowerSide = UIImageView()
    var imageViewStalk = UIImageView()
    var imageViewFruit = UIImageView()
    var imageViewFruitSide = UIImageView()
    
    let viewFlowerWidthRatio: CGFloat = 0.6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.clipsToBounds = true
        
        // bookVC의 buttonShowRoot = hide
        _buttonShowRoot.alpha = 0
        
        // viewTop hidden 해제 및 labelMain 설정
        _viewTopLabel.isHidden = false
        bookPartsFunctions().setLabelMain(_labelMain, "Flower & Fruit")
        
        // UIImageView를 담은 배열 또는 사전 생성
        addImageViewToArrayOrDictionary(_plant)
        
        DispatchQueue.main.async {
            // 각 parts에 해당하는 imageView들의 크기 및 배치 위치 조정
            self.assignViewForFlower(viewFrameSize: self._viewFrameSize)
            self.assignViewForFruit(viewFrameSize: self._viewFrameSize)
        }
        
        // Switch [Flower <-> Fruit] 설정
        _viewSwitch.isHidden = false
        _imageViewSwitch.alpha = 0
//        _buttonSwitchFlower.removeTarget(nil, action: nil, for: .allEvents)
//        _buttonSwitchFlower.addTarget(self, action: #selector(clickSwitchFlower), for: .touchUpInside)
//        _buttonSwitchFruit.removeTarget(nil, action: nil, for: .allEvents)
//        _buttonSwitchFruit.addTarget(self, action: #selector(clickSwitchFruit), for: .touchUpInside)
        
        // 기존의 buttonBack 작동 함수 재설정
        _buttonBack.removeTarget(nil, action: nil, for: .allEvents)
        _buttonBack.addTarget(self, action: #selector(clickButtonBack), for: .touchUpInside)
        
        _buttonGoFirst.addTarget(self, action: #selector(clickButtonBack), for: .touchUpInside)
        
        // child viewController에서 다시 돌아왔을 때 _buttonBack에 부여할 함수 저장
        NotificationCenter.default.addObserver(self, selector: #selector(clickButtonBack), name: NSNotification.Name(rawValue: "clickBackInFlowerAndFruit"), object: nil)
    }
    
    // _buttonSwitchFlower 클릭 -> bookPartsInflorescenceVC로 view 전환
    //
    @objc func clickSwitchFlower() {
        UIView.animate(withDuration: 0.4, animations: {
            self._imageViewSwitch.alpha = 1.0
        })
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "bookPartsInflorescenceVC") as! bookPartsInflorescenceVC
        vc._plant = _plant
        vc._parts = _parts
        vc._viewTopLabel = _viewTopLabel
        vc._labelMain = _labelMain
        vc._dicActiveImageView = _dicActiveImageView
        vc._activeButton = _activeButton
        vc._viewFrameSize = _viewFrameSize
        vc._viewSwitch = _viewSwitch
        vc._imageViewSwitch = _imageViewSwitch
        vc._buttonSwitchFlower = _buttonSwitchFlower
        vc._buttonSwitchFruit = _buttonSwitchFruit
        vc._buttonShowRoot = _buttonShowRoot
        vc._buttonShowStalk = _buttonShowStalk
        vc._buttonShowSeed = _buttonShowSeed
        vc._buttonBack = _buttonBack
        vc._buttonGoFirst = _buttonGoFirst

        vc.view.frame = self.view.bounds
        self.view.addSubview(vc.view)
        self.addChild(vc)
        vc.didMove(toParent: self)
    }
    
    // _buttonSwitchFruit 클릭 -> bookPartsFruitVC로 view 전환
    //
    @objc func clickSwitchFruit() {
        let circlePaddingX: CGFloat = 4.0
        let moveValueX = _viewSwitch.frame.width - _imageViewSwitch.frame.width - circlePaddingX * 2.0
        _imageViewSwitch.transform = CGAffineTransform(translationX: moveValueX, y: 0)
        UIView.animate(withDuration: 0.4, animations: {
            self._imageViewSwitch.alpha = 1.0
        })
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "bookPartsFruitVC") as! bookPartsFruitVC
        vc._plant = _plant
        vc._parts = _parts
        vc._viewTopLabel = _viewTopLabel
        vc._labelMain = _labelMain
        vc._dicActiveImageView = _dicActiveImageView
        vc._activeButton = _activeButton
        vc._viewFrameSize = _viewFrameSize
        vc._viewSwitch = _viewSwitch
        vc._imageViewSwitch = _imageViewSwitch
        vc._buttonSwitchFlower = _buttonSwitchFlower
        vc._buttonSwitchFruit = _buttonSwitchFruit
        vc._buttonShowRoot = _buttonShowRoot
        vc._buttonShowStalk = _buttonShowStalk
        vc._buttonShowSeed = _buttonShowSeed
        vc._buttonBack = _buttonBack
        vc._buttonGoFirst = _buttonGoFirst

        vc.view.frame = self.view.bounds
        self.view.addSubview(vc.view)
        self.addChild(vc)
        vc.didMove(toParent: self)
    }
    
    // flower와 관련된 imageView들의 크기 및 배치 위치 조정
    //
    func assignViewForFlower(viewFrameSize: CGSize) {
        // flower를 위한 view의 width = 전체 view의 60%
        let viewFrameForFlower = CGRect(x: 0, y: 0, width: viewFrameSize.width * viewFlowerWidthRatio, height: viewFrameSize.height)
        
        var minX: CGFloat = 9999
        var minY: CGFloat = 9999
        var maxWidth: CGFloat = 0
        var maxHeight: CGFloat = 0
        
        var tempArrActiveImageView = [UIImageView]()
        for (_, partsImageView) in dicActiveImageViewAboutFlower {
            if partsImageView.frame.minX < minX {
                minX = partsImageView.frame.minX
            }
            if partsImageView.frame.minY < minY {
                minY = partsImageView.frame.minY
            }
            if partsImageView.frame.width > maxWidth {
                maxWidth = partsImageView.frame.width
            }
            if partsImageView.frame.height > maxHeight {
                maxHeight = partsImageView.frame.height
            }
            tempArrActiveImageView.append(partsImageView)
        }
        let entireViewFrame = CGRect(x: minX, y: minY, width: maxWidth, height: maxHeight)
        let scale = viewFrameForFlower.width / entireViewFrame.width
        let modEntireViewFrame = CGRect(x: 0, y: 0, width: entireViewFrame.width, height: entireViewFrame.height)
        let entireView = UIView(frame: modEntireViewFrame)
        
        for i in 0..<arrActiveImageView.count {
            let activeImageView = arrActiveImageView[i]
            if tempArrActiveImageView.contains(activeImageView) {
                activeImageView.frame = CGRect(x: activeImageView.frame.minX - entireViewFrame.minX, y: activeImageView.frame.minY - entireViewFrame.minY, width: activeImageView.frame.width, height: activeImageView.frame.height)
                entireView.addSubview(activeImageView)
            }
        }
        let entireViewAnchorPoint = CGPoint(x: 0, y: 0)
        entireView.layer.anchorPoint = entireViewAnchorPoint
        entireView.applyTransform(withScale: scale, anchorPoint: entireViewAnchorPoint)
        self.view.addSubview(entireView)
        
        // 각 parts에 해당하는 active 버튼 생성
        let buttonForParts: UIButton = {
            let button = UIButton()
            button.frame = entireView.frame
            button.addTarget(self, action: #selector(clickSwitchFlower), for: .touchUpInside)
            
            return button
        }()
        self.view.addSubview(buttonForParts)
    }
    
    // fruit과 관련된 imageView들의 크기 및 배치 위치 조정
    //
    func assignViewForFruit(viewFrameSize: CGSize) {
        // flower를 위한 view의 width = 전체 view의 40%
        let viewFrameForFruit = CGRect(x: viewFrameSize.width * viewFlowerWidthRatio, y: 0, width: viewFrameSize.width * (1 - viewFlowerWidthRatio), height: viewFrameSize.height)

        var minX: CGFloat = 9999
        var minY: CGFloat = 9999
        var maxWidth: CGFloat = 0
        var maxHeight: CGFloat = 0
        
        var tempArrActiveImageView = [UIImageView]()
        for (_, partsImageView) in dicActiveImageViewAboutFruit {
            if partsImageView.frame.minX < minX {
                minX = partsImageView.frame.minX
            }
            if partsImageView.frame.minY < minY {
                minY = partsImageView.frame.minY
            }
            if partsImageView.frame.width > maxWidth {
                maxWidth = partsImageView.frame.width
            }
            if partsImageView.frame.height > maxHeight {
                maxHeight = partsImageView.frame.height
            }
            tempArrActiveImageView.append(partsImageView)
        }
        let entireViewFrame = CGRect(x: minX, y: minY, width: maxWidth, height: maxHeight)
        let scale = viewFrameForFruit.width / entireViewFrame.width
        let modEntireViewFrame = CGRect(x: viewFrameForFruit.maxX - entireViewFrame.width, y: viewFrameForFruit.maxY - entireViewFrame.height, width: entireViewFrame.width, height: entireViewFrame.height)
        let entireView = UIView(frame: modEntireViewFrame)
        
        for i in 0..<arrActiveImageView.count {
            let activeImageView = arrActiveImageView[i]
            if tempArrActiveImageView.contains(activeImageView) {
                activeImageView.frame = CGRect(x: activeImageView.frame.minX - entireViewFrame.minX, y: activeImageView.frame.minY - entireViewFrame.minY, width: activeImageView.frame.width, height: activeImageView.frame.height)
                entireView.addSubview(activeImageView)
            }
        }
        
        let entireViewAnchorPoint = CGPoint(x: 1, y: 1)
        entireView.layer.anchorPoint = entireViewAnchorPoint
        entireView.applyTransform(withScale: scale, anchorPoint: entireViewAnchorPoint)
        self.view.addSubview(entireView)
        
        // 각 parts에 해당하는 active 버튼 생성
        let buttonForParts: UIButton = {
            let button = UIButton()
            button.frame = entireView.frame
            button.addTarget(self, action: #selector(clickSwitchFruit), for: .touchUpInside)
            
            return button
        }()
        self.view.addSubview(buttonForParts)
    }
    
    // 각 parts에 맞는 imageView 변수 생성
    //
    func mkVariableForParts(_ dicActiveImageView: [String : UIImageView]) {
        for (parts, partsImageView) in dicActiveImageView {
            if parts.contains("flower") {
                if parts.contains("side") {
                    imageViewFlowerSide = partsImageView
                } else {
                    imageViewFlower = partsImageView
                }
            }
            else if parts == "stalk" {
                imageViewStalk = partsImageView
            }
            else if parts.contains("fruit") {
                if parts.contains("side") {
                    imageViewFruitSide = partsImageView
                } else {
                    imageViewFruit = partsImageView
                }
            }
        }
    }
    
    // 변수(arrActiveImageView)에 imageView 추가하기 && 변수(dicPartsImageView)에도 추가하기
    //
    func addImageViewToArrayOrDictionary(_ _plant: String) {
        let arrPartsForInit = ["flower", "stalk", "fruit"]  // viewMain에 넣을 초기 이미지 -> 순서대로 배치해야함.
        
        for i in 0..<arrPartsForInit.count {
            let partsForInit = arrPartsForInit[i]
            let imageFileName = _plant + "_" + partsForInit
            let imageFileNameForSide = imageFileName + "_side"
            
            // 전달받은 _dicActiveImageView에 '포함된' UIImageView라면 -> 그대로 arrActiveImageView 변수에 추가
            if _dicActiveImageView[partsForInit] != nil {
                let partsSideForInit = partsForInit + "_side"
                arrActiveImageView.append(_dicActiveImageView[partsSideForInit]!)
                if _dicActiveImageView[partsSideForInit] != nil {
                    arrActiveImageView.append(_dicActiveImageView[partsForInit]!)
                }
            }
            // 전달받은 _dicActiveImageView에 '포함되지 않는' UIImageView라면 -> 새로 UIImageView 생성 후, arrActiveImageView 변수에 추가
            else {
                let imageViewToBeAdded: UIImageView = self.setEachImageView(viewSize: _viewFrameSize, imageFile: imageFileName)
                _dicActiveImageView[partsForInit] = imageViewToBeAdded
                arrActiveImageView.append(imageViewToBeAdded)
                
                // 단면(side) 이미지 파일이 있다면 imageView로 추가
                var imageViewForSideToBeAdded = UIImageView()
                if UIImage(named: imageFileNameForSide) != nil {
                    imageViewForSideToBeAdded = self.setEachImageView(viewSize: _viewFrameSize, imageFile: imageFileNameForSide)
                    
                    let partsSideForInit = partsForInit + "_side"
                    _dicActiveImageView[partsSideForInit] = imageViewForSideToBeAdded
                    arrActiveImageView.append(imageViewForSideToBeAdded)
                }
            }
        }
        
        // 각 parts imageView별로 따로 dictionary 생성
        for (parts, partsImageView) in _dicActiveImageView {
            if parts.contains("fruit") {
                dicActiveImageViewAboutFruit[parts] = partsImageView
            } else {
                dicActiveImageViewAboutFlower[parts] = partsImageView
            }
        }
        
        // 각 parts에 맞는 imageView 변수 생성
        mkVariableForParts(_dicActiveImageView)
    }
    
    // cropped 이미지 설정
    //
    func setEachImageView(viewSize: CGSize, imageFile: String) -> UIImageView {
        let image = UIImage(named: imageFile)
        let croppedImageAndRect = getCroppedImageAndRectFromImage(viewSize, image!)
        let imageView = UIImageView(frame: croppedImageAndRect.croppedRect)
        imageView.image = croppedImageAndRect.croppedImage
        
        return imageView
    }
    
    // bitmap으로 변환된 이미지에서 특정 이미지 crop 및 rect 반환
    //
    func getCroppedImageAndRectFromImage(_ viewSize: CGSize, _ image: UIImage) -> (croppedImage: UIImage, croppedRect: CGRect) {
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
        
        let imageViewWidth = viewSize.width
        let imageViewHeight = viewSize.height
        
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
    
    // view dismiss 함수
    //
    @objc func clickButtonBack() {
        _viewTopLabel.isHidden = true
        _viewSwitch.isHidden = true
        _buttonShowRoot.alpha = 1
        _buttonBack.removeTarget(nil, action: nil, for: .allEvents)
        _buttonBack.addTarget(self, action: #selector(loadPrevBackFunction), for: .touchUpInside)
        
        UIView.animate(withDuration: 0.4, animations: {
            self.view.alpha = 0
        }) { finished in
            self.view.removeFromSuperview()
        }
    }
    
    // NotificationCenter에 저장한 _buttonBack의 이전 함수 Load
    //
    @objc func loadPrevBackFunction() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "clickDivide"), object: nil)
    }
}


extension UIView {
    func applyTransform(withScale scale: CGFloat, anchorPoint: CGPoint) {
        layer.anchorPoint = anchorPoint
        let scale = scale != 0 ? scale : CGFloat.leastNonzeroMagnitude
        let xPadding = 1/scale * (anchorPoint.x - 0.5)*bounds.width
        let yPadding = 1/scale * (anchorPoint.y - 0.5)*bounds.height
        transform = CGAffineTransform(scaleX: scale, y: scale).translatedBy(x: xPadding, y: yPadding)
    }
}
