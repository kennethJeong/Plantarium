//
//  bookPartsFruitVC.swift
//  newNotitle1
//
//  Created by 정은후 on 2021/02/09.
//  Copyright © 2021 정은후. All rights reserved.
//

import UIKit

class bookPartsFruitVC: UIViewController {
    @IBOutlet var buttonShowDetail: UIButton!
    
    // 전달받은 변수들
    var _plant = String()
    var _parts = String()
    var _viewTopLabel = UIView()
    var _labelMain = UILabel()
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
    
    // viewCrossSection
    var defaultCrossSection = false
    var viewCrossSection = UIView()
    var buttonCrossSection = UIButton()
    var imageCrossSectionCircle = UIImageView()
    
    // active imageViews
    var arrActiveImageView = [UIImageView]()
    var imageViewFruit = UIImageView()
    var imageViewFruitSide = UIImageView()
    var imageViewSeed = UIImageView()
    
    var defaultShowSeed = false
    
    let tagSuperTitle: String = "fruit"
    let tagMainTitle: String = "fruit"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // viewTop hidden 해제 및 labelMain 설정
        bookPartsFunctions().setLabelMain(_labelMain, "Fruit")
        
        // bookVC의 buttonShowSeed = show
        _buttonShowRoot.isHidden = true
        _buttonShowStalk.isHidden = true
        _buttonShowSeed.isHidden = false
        _buttonShowSeed.addTarget(self, action: #selector(clickShowSeed), for: .touchUpInside)
    
        self.moveToCenterForParts(self._viewFrameSize)
        
        // 단면(Side) 이미지가 있으면, 단면 보기 버튼 생성
        if self.imageViewFruitSide.image != nil {
            let viewCS = mkCrossSection()   // 단면 보기 버튼 생성 함수
            self.view.addSubview(viewCS)
            viewCrossSection = viewCS
        }
        
        // Switch [Flower <-> Fruit] 설정
//        _buttonSwitchFlower.removeTarget(nil, action: nil, for: .allEvents)
//        _buttonSwitchFlower.addTarget(self, action: #selector(clickSwitchFlower), for: .touchUpInside)
//        _buttonSwitchFruit.removeTarget(nil, action: nil, for: .allEvents)
//        _buttonSwitchFruit.addTarget(self, action: #selector(clickButtonBack), for: .touchUpInside)
        
        // buttonShowDetail 작동 함수 설정
        buttonShowDetail.addTarget(self, action: #selector(clickShowDetail), for: .touchUpInside)
        
        // 기존의 buttonBack 작동 함수 재설정
        _buttonBack.removeTarget(nil, action: nil, for: .allEvents)
        _buttonBack.addTarget(self, action: #selector(clickButtonBack), for: .touchUpInside)
        
        _buttonGoFirst.addTarget(self, action: #selector(clickButtonBack), for: .touchUpInside)
        
        // child viewController에서 다시 돌아왔을 때 _buttonBack에 부여할 함수 저장
        NotificationCenter.default.addObserver(self, selector: #selector(clickButtonBack), name: NSNotification.Name(rawValue: "clickBackInInflorescence"), object: nil)
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
    
    // viewCrossSection 생성 함수
    func mkCrossSection() -> UIView {
        let viewCS_padding: CGFloat = 20.0
        let viewSize = CGSize(width: 64, height: 34)
        let viewCS: UIView = {
            let view = UIView()
            view.frame = CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height)
            view.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1.0)
            view.layer.cornerRadius = 17
            view.layer.borderWidth = 0
            
            let imageViewCS: UIImageView = {
                let imageView = UIImageView()
                let imageViewFrame = CGRect(x: 2, y: 2, width: 30, height: 30)
                imageView.frame = imageViewFrame
                imageView.image = UIImage(named: "image_crossSection")
                return imageView
            }()
            imageCrossSectionCircle = imageViewCS
            view.addSubview(imageViewCS)
            
            let buttonCS: UIButton = {
                let button = UIButton()
                button.setTitle("", for: .normal)
                button.frame = view.frame
                button.addTarget(self, action: #selector(clickCrossSection), for: .touchUpInside)
                
                return button
            }()
            buttonCrossSection = buttonCS
            view.addSubview(buttonCS)
            
            return view
        }()
        
        viewCrossSection = viewCS
        self.view.addSubview(viewCS)
        
        viewCS.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            viewCS.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: viewCS_padding),
            viewCS.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            viewCS.widthAnchor.constraint(equalToConstant: viewSize.width),
            viewCS.heightAnchor.constraint(equalToConstant: viewSize.height)
        ]
        NSLayoutConstraint.activate(constraints)
        
        return viewCS
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
            UIView.animate(withDuration: 0.4, animations: {
                self.imageViewFruitSide.frame.origin.x += self.imageViewFruitSide.frame.width * 3.0
            })
            bookPartsFunctions().setLabelMain(_labelMain, "Fruit C.S")
        }
        // 원본 보기
        else {
            defaultCrossSection = false
            UIView.animate(withDuration: 0.4, animations: {
                self.imageCrossSectionCircle.transform = .identity
                self.imageCrossSectionCircle.image = UIImage(named: "image_crossSection")
            })
            UIView.animate(withDuration: 0.4, animations: {
                self.imageViewFruitSide.frame.origin.x -= self.imageViewFruitSide.frame.width * 3.0
            })
            bookPartsFunctions().setLabelMain(_labelMain, "Fruit")
        }
    }
    
    // buttonShowSeed 작동(On or Off) 함수
    //
    @objc func clickShowSeed() {
        if !defaultShowSeed {
            defaultShowSeed = true
            viewCrossSection.isHidden = true
            imageViewSeed.isHidden = false
            UIView.animate(withDuration: 0.4, animations: {
                self._buttonShowSeed.setImage(UIImage(named: "button_showSeed_on"), for: .normal)
                self.imageViewFruit.alpha = 0
                self.imageViewFruitSide.alpha = 0
                self.imageViewSeed.alpha = 1
            })
            bookPartsFunctions().setLabelMain(_labelMain, "Seed")
            buttonShowDetail.isHidden = true
        } else {
            defaultShowSeed = false
            viewCrossSection.isHidden = false
            imageViewSeed.isHidden = true
            UIView.animate(withDuration: 0.4, animations: {
                self._buttonShowSeed.setImage(UIImage(named: "button_showSeed_off"), for: .normal)
                self.imageViewFruit.alpha = 1
                self.imageViewFruitSide.alpha = 1
                self.imageViewSeed.alpha = 0
            })
            bookPartsFunctions().setLabelMain(_labelMain, "Fruit")
            buttonShowDetail.isHidden = false
        }
    }
    
    // _buttonSwitchFlower 클릭 -> bookPartsFlowerVC로 view 전환
    //
    @objc func clickSwitchFlower() {
        UIView.animate(withDuration: 0.4, animations: {
            self._imageViewSwitch.transform = .identity
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
        
        self.view.removeFromSuperview()
    }
    
    // 화면 가운데로 imageView 이동
    //
    func moveToCenterForParts(_ _viewFrameSize: CGSize) {
        addAndSetImageView(_dicActiveImageView)
        
        let centerViewMain = CGPoint(x: _viewFrameSize.width/2.0, y: _viewFrameSize.height/2.0)
        let centerFlower = CGPoint(x: imageViewFruit.center.x, y: imageViewFruit.center.y)
        let centerFlowerSide = CGPoint(x: imageViewFruitSide.center.x, y: imageViewFruitSide.center.y)
        let centerSeed = CGPoint(x: imageViewSeed.center.x, y: imageViewSeed.center.y)
        
        let scaleX = _viewFrameSize.width / imageViewFruit.frame.width
        let scaleY = _viewFrameSize.height / imageViewFruit.frame.height
        var scale = CGFloat()
        if scaleX > scaleY {
            scale = scaleY
        } else {
            scale = scaleX
        }
        
        scale *= 0.7
        
        let diffCenterX = centerFlower.x - centerFlowerSide.x
        let diffCenterY = centerFlower.y - centerFlowerSide.y
        
        let moveValueFlowerX = centerViewMain.x - centerFlower.x
        let moveValueFlowerY = centerViewMain.y - centerFlower.y
        
        let moveValueFlowerSideX = centerViewMain.x - centerFlowerSide.x - diffCenterX*scale
        let moveValueFlowerSideY = centerViewMain.y - centerFlowerSide.y - diffCenterY*scale
        
        let moveValueSeedX = centerViewMain.x - centerSeed.x
        let moveValueSeedY = centerViewMain.y - centerSeed.y
        
        imageViewFruit.transform = CGAffineTransform(translationX: moveValueFlowerX, y: moveValueFlowerY).scaledBy(x: scale, y: scale)
        imageViewFruitSide.transform = CGAffineTransform(translationX: moveValueFlowerSideX, y: moveValueFlowerSideY).scaledBy(x: scale, y: scale)
        imageViewSeed.transform = CGAffineTransform(translationX: moveValueSeedX, y: moveValueSeedY).scaledBy(x: scale, y: scale)
    }
    
    // 각 parts에 맞는 imageView 변수 생성 및 view에 이미지 생성
    //
    func addAndSetImageView(_ dicActiveImageView: [String : UIImageView]) {
        let arrPartsForInit = ["fruit", "seed"]  // viewMain에 넣을 초기 이미지 -> 순서대로 배치해야함.
        for i in 0..<arrPartsForInit.count {
            let activeParts = arrPartsForInit[i]
            if activeParts == "fruit" {
                let imageView = UIImageView()
                imageView.frame = dicActiveImageView[activeParts]!.frame
                imageView.image = dicActiveImageView[activeParts]!.image
                imageViewFruit = imageView
                self.view.addSubview(imageView)
                
                if dicActiveImageView[activeParts + "_side"] != nil {
                    let imageView = UIImageView()
                    imageView.frame = dicActiveImageView[activeParts + "_side"]!.frame
                    imageView.image = dicActiveImageView[activeParts + "_side"]!.image
                    imageViewFruitSide = imageView
                    self.view.addSubview(imageView)
                }
            }
            else if activeParts == "seed" {
                let imageFileNameSeed = _plant + "_" + activeParts
                imageViewSeed = self.setEachImageView(viewSize: _viewFrameSize, imageFile: imageFileNameSeed)
                imageViewSeed.isHidden = true
                self.view.addSubview(imageViewSeed)
            }
        }
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
        _buttonShowRoot.isHidden = false
        _buttonShowSeed.isHidden = true
        _buttonShowSeed.setImage(UIImage(named: "button_showSeed_off"), for: .normal)
        
        _imageViewSwitch.alpha = 0
        _imageViewSwitch.transform = .identity
        
        imageViewFruit.transform = .identity
        imageViewFruitSide.transform = .identity
        imageViewSeed.transform = .identity
        
        bookPartsFunctions().setLabelMain(_labelMain, "Flower & Fruit")
        
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
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "clickBackInFlowerAndFruit"), object: nil)
    }
}
