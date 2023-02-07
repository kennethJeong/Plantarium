//
//  bookPartsInflorescenceVC.swift
//  newNotitle1
//
//  Created by 정은후 on 2021/02/09.
//  Copyright © 2021 정은후. All rights reserved.
//

import UIKit

class bookPartsInflorescenceVC: UIViewController {
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
    var imageViewFlower = UIImageView()
    var imageViewFlowerSide = UIImageView()
    var imageViewStalk = UIImageView()
    
    var defaultShowStalk = false
    var buttonShowFlowerMap = UIButton()
    
    var tagSuperTitle: String = "flower"
    var tagMainTitle: String = "inflorescence"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // labelMain 설정
        bookPartsFunctions().setLabelMain(_labelMain, "Inflorescence")
        
        // bookVC의 buttonShowStalk = show
        _buttonShowRoot.isHidden = true
        _buttonShowSeed.isHidden = true
        _buttonShowStalk.isHidden = false
        _buttonShowStalk.addTarget(self, action: #selector(clickShowStalk), for: .touchUpInside)
        
        DispatchQueue.main.async {
            //화면 가운데로 imageView 이동
            self.moveToCenterForParts(self._viewFrameSize)
            
            // 단면 보기 버튼 생성 함수
            self.mkCrossSection()
            
            // 단면(Side) 이미지가 있으면, 단면 보기 버튼 생성
            if self.imageViewFlowerSide.image != nil {
                self.mkCrossSection()   // 단면 보기 버튼 생성 함수
            }
        }
        
        // Switch [Flower <-> Fruit] 설정
//        _buttonSwitchFlower.removeTarget(nil, action: nil, for: .allEvents)
//        _buttonSwitchFlower.addTarget(self, action: #selector(clickButtonBack), for: .touchUpInside)
//        _buttonSwitchFruit.removeTarget(nil, action: nil, for: .allEvents)
//        _buttonSwitchFruit.addTarget(self, action: #selector(clickSwitchFruit), for: .touchUpInside)
        
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
    func mkCrossSection() {
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
        
        viewCS.isHidden = true
        self.view.addSubview(viewCS)
        
        viewCrossSection = viewCS
        
        viewCS.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            viewCS.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: viewCS_padding),
            viewCS.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            viewCS.widthAnchor.constraint(equalToConstant: viewSize.width),
            viewCS.heightAnchor.constraint(equalToConstant: viewSize.height)
        ]
        NSLayoutConstraint.activate(constraints)
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
                self.imageViewFlower.frame.origin.x += self.imageViewFlower.frame.width * 3.0
            })
            bookPartsFunctions().setLabelMain(_labelMain, "Flower Type C.S")
            buttonShowFlowerMap.isHidden = true
        }
        // 원본 보기
        else {
            defaultCrossSection = false
            UIView.animate(withDuration: 0.4, animations: {
                self.imageCrossSectionCircle.transform = .identity
                self.imageCrossSectionCircle.image = UIImage(named: "image_crossSection")
            })
            UIView.animate(withDuration: 0.4, animations: {
                self.imageViewFlower.frame.origin.x -= self.imageViewFlower.frame.width * 3.0
            })
            bookPartsFunctions().setLabelMain(_labelMain, "Flower Type")
            buttonShowFlowerMap.isHidden = false
        }
    }
    
    // buttonShowStalk 작동(On or Off) 함수
    //
    @objc func clickShowStalk() {
        if !defaultShowStalk {
            defaultShowStalk = true
            
            tagSuperTitle = "flower"
            tagMainTitle = "flower type"
            
            viewCrossSection.isHidden = false
            UIView.animate(withDuration: 0.4, animations: {
                self._buttonShowStalk.setImage(UIImage(named: "button_showStalk_off"), for: .normal)
                self.imageViewStalk.frame.origin.x -= self.imageViewStalk.frame.width * 3.0
            })
            bookPartsFunctions().setLabelMain(_labelMain, "Flower Type")
            
            // bookPartsFlowerMap으로 이동하기 위한 버튼 '생성'
            buttonShowFlowerMap.frame = imageViewFlower.frame
            buttonShowFlowerMap.addTarget(self, action: #selector(clickShowFlowerMap), for: .touchUpInside)
            self.view.addSubview(buttonShowFlowerMap)
        } else {
            defaultShowStalk = false
            
            tagSuperTitle = "flower"
            tagMainTitle = "inflorescence"
            
            viewCrossSection.isHidden = true
            UIView.animate(withDuration: 0.4, animations: {
                self._buttonShowStalk.setImage(UIImage(named: "button_showStalk_on"), for: .normal)
                self.imageViewStalk.frame.origin.x += self.imageViewStalk.frame.width * 3.0
            })
            bookPartsFunctions().setLabelMain(_labelMain, "Inflorescence")
            
            // bookPartsFlowerMap으로 이동하는 버튼 '제거'
            buttonShowFlowerMap.removeFromSuperview()
        }
    }
    
    @objc func clickShowFlowerMap() {
        bookPartsFunctions().setLabelMain(_labelMain, "Flower Map")
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "bookPartsFlowerMapVC") as! bookPartsFlowerMapVC
        vc._plant = _plant
        vc._labelMain = _labelMain
        vc._viewSwitch = _viewSwitch
        vc._buttonShowStalk = _buttonShowStalk
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
        UIView.animate(withDuration: 0.4, animations: {
            self._imageViewSwitch.transform = CGAffineTransform(translationX: moveValueX, y: 0)
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
    
    // 화면 가운데로 imageView 이동
    //
    func moveToCenterForParts(_ _viewFrameSize: CGSize) {
        addAndSetImageView(_dicActiveImageView)
        
        let centerViewMain = CGPoint(x: _viewFrameSize.width/2.0, y: _viewFrameSize.height/2.0)
        let centerFlower = CGPoint(x: imageViewFlower.center.x, y: imageViewFlower.center.y)
        let centerFlowerSide = CGPoint(x: imageViewFlowerSide.center.x, y: imageViewFlowerSide.center.y)
        let centerStalk = CGPoint(x: imageViewStalk.center.x, y: imageViewStalk.center.y)
        
        let scaleX = _viewFrameSize.width / imageViewFlower.frame.width
        let scaleY = _viewFrameSize.height / imageViewFlower.frame.height
        var scale = CGFloat()
        if scaleX > scaleY {
            scale = scaleY
        } else {
            scale = scaleX
        }
        
        scale *= 0.7
        
        let diffCenterX = centerFlower.x - centerFlowerSide.x
        let diffCenterY = centerFlower.y - centerFlowerSide.y
        
        let diffCenterX4Stalk = centerFlower.x - centerStalk.x
        let diffCenterY4Stalk = centerFlower.y - centerStalk.y
        
        let moveValueFlowerX = centerViewMain.x - centerFlower.x
        let moveValueFlowerY = centerViewMain.y - centerFlower.y
        
        let moveValueFlowerSideX = centerViewMain.x - centerFlowerSide.x - diffCenterX*scale
        let moveValueFlowerSideY = centerViewMain.y - centerFlowerSide.y - diffCenterY*scale
        
        let moveValueStalkX = centerViewMain.x - centerStalk.x - diffCenterX4Stalk*scale
        let moveValueStalkY = centerViewMain.y - centerStalk.y - diffCenterY4Stalk*scale
        
        imageViewFlower.transform = CGAffineTransform(translationX: moveValueFlowerX, y: moveValueFlowerY).scaledBy(x: scale, y: scale)
        imageViewFlowerSide.transform = CGAffineTransform(translationX: moveValueFlowerSideX, y: moveValueFlowerSideY).scaledBy(x: scale, y: scale)
        imageViewStalk.transform = CGAffineTransform(translationX: moveValueStalkX, y: moveValueStalkY).scaledBy(x: scale, y: scale)
    }
    
    // 각 parts에 맞는 imageView 변수 생성 및 view에 이미지 생성
    //
    func addAndSetImageView(_ dicActiveImageView: [String : UIImageView]) {
        let arrPartsForInit = ["flower", "stalk"]  // viewMain에 넣을 초기 이미지 -> 순서대로 배치해야함.
        for i in 0..<arrPartsForInit.count {
            let activeParts = arrPartsForInit[i]
            if activeParts == "flower" {
                if dicActiveImageView[activeParts + "_side"] != nil {
                    let imageView = UIImageView()
                    imageView.frame = dicActiveImageView[activeParts + "_side"]!.frame
                    imageView.image = dicActiveImageView[activeParts + "_side"]!.image
                    imageViewFlowerSide = imageView
                    self.view.addSubview(imageView)
                }
                let imageView = UIImageView()
                imageView.frame = dicActiveImageView[activeParts]!.frame
                imageView.image = dicActiveImageView[activeParts]!.image
                imageViewFlower = imageView
                self.view.addSubview(imageView)
            }
            else if activeParts == "stalk" {
                let imageView = UIImageView()
                imageView.frame = dicActiveImageView[activeParts]!.frame
                imageView.image = dicActiveImageView[activeParts]!.image
                imageViewStalk = imageView
                self.view.addSubview(imageView)
            }
        }
    }
    
    
    // view dismiss 함수
    //
    @objc func clickButtonBack() {
        _buttonShowRoot.isHidden = false
        _buttonShowStalk.isHidden = true
        
        _imageViewSwitch.alpha = 0
        _imageViewSwitch.transform = .identity
        
        imageViewFlower.transform = .identity
        imageViewFlowerSide.transform = .identity
        imageViewStalk.transform = .identity
        
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
    
    //
    func bg(_ view: UIView, _ rect: CGRect) {
        let bg = UIImageView(frame: rect)
        bg.layer.masksToBounds = true
        bg.layer.borderWidth = 0.5
        bg.layer.borderColor = UIColor.red.cgColor
        view.addSubview(bg)
    }
    //
}
