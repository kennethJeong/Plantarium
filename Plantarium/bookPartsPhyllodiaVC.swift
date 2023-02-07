//
//  bookPartsPhyllodiaVC.swift
//  newNotitle1
//
//  Created by 정은후 on 2021/02/09.
//  Copyright © 2021 정은후. All rights reserved.
//

import UIKit

class bookPartsPhyllodiaVC: UIViewController {
    @IBOutlet var buttonShowDetail: UIButton!
    
    // 전달받은 변수들
    var _plant = String()
    var _parts = String()
    var _labelMain = UILabel()
    var _viewTopLabel = UIView()
    var _dicActiveImageView = [String : UIImageView]()
    var _activeButton = UIButton()
    var _viewFrameSize = CGSize()
    var _buttonShowRoot = UIButton()
    var _buttonBack = UIButton()
    var _buttonGoFirst = UIButton()
    
    // viewCrossSection
    var viewCrossSection = UIView()
    var buttonCrossSection = UIButton()
    var imageCrossSectionCircle = UIImageView()
    
    // active imageViews
    var imageViewPhyllodia = UIImageView()
    var imageViewPhyllodiaSide = UIImageView()
    
    var tagSuperTitle: String = "leaf"
    var tagMainTitle: String = "phyllodia"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // bookVC의 buttonShowRoot = hide
        _buttonShowRoot.alpha = 0
        
        // viewTop hidden 해제 및 labelMain 설정
        _viewTopLabel.isHidden = false
        bookPartsFunctions().setLabelMain(_labelMain, "Phyllodia")
        
        // 전달받은 active imageView -> view 가운데 배치 및 이동 애니메이션 설정
        let bookVC_frameSize = CGRect(x: 0, y: 0, width: _viewFrameSize.width, height: _viewFrameSize.height)   // bookVC의 viewMain에 맞는 Frame값
        for (parts, partsImageView) in _dicActiveImageView {
            if parts.contains("side") {
                imageViewPhyllodiaSide = partsImageView
                self.view.insertSubview(partsImageView, at: 0)
            } else {
                imageViewPhyllodia = partsImageView
                self.view.addSubview(partsImageView)
            }
            
            // 가운데로 배치하기 및 애니메이션 적용
            UIView.animate(withDuration: 0.4, animations: {
                partsImageView.transform = self.moveCenterActiveImageView(bookVC_frameSize, self._activeButton)
            })
        }
        
        // 단면 보기 버튼 생성 함수
        mkCrossSection()
        
        // 단면(Side) 이미지가 없으면, viewCrossSection 'hide'
        if imageViewPhyllodiaSide.image == nil {
            viewCrossSection.isHidden = true
        }
        
        // buttonShowDetail 작동 함수 설정
        buttonShowDetail.addTarget(self, action: #selector(clickShowDetail), for: .touchUpInside)
        
        // 기존의 buttonBack 작동 함수 재설정
        _buttonBack.removeTarget(nil, action: nil, for: .allEvents)
        _buttonBack.addTarget(self, action: #selector(clickButtonBack), for: .touchUpInside)
        
        _buttonGoFirst.addTarget(self, action: #selector(clickButtonBack), for: .touchUpInside)
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
    }
    
    // crossSection - 이미지 단면<->원본 보기 함수
    //
    @objc func clickCrossSection() {
        // 단면 보기
        if imageViewPhyllodia.center == imageViewPhyllodiaSide.center {
            let circlePaddingX: CGFloat = 2
            let moveX: CGFloat = viewCrossSection.frame.width - imageCrossSectionCircle.frame.width - circlePaddingX * 2.0
            UIView.animate(withDuration: 0.4, animations: {
                self.imageCrossSectionCircle.transform = CGAffineTransform(translationX: moveX, y: 0)
                self.imageCrossSectionCircle.image = UIImage(named: "image_recombine")
            })
            UIView.animate(withDuration: 0.4, animations: {
                self.imageViewPhyllodia.frame.origin.x += self.imageViewPhyllodia.frame.width * 3.0
            })
            bookPartsFunctions().setLabelMain(_labelMain, "Pitcher C.S")
        }
        // 원본 보기
        else {
            UIView.animate(withDuration: 0.4, animations: {
                self.imageCrossSectionCircle.transform = .identity
                self.imageCrossSectionCircle.image = UIImage(named: "image_crossSection")
            })
            UIView.animate(withDuration: 0.4, animations: {
                self.imageViewPhyllodia.frame.origin.x -= self.imageViewPhyllodia.frame.width * 3.0
            })
            bookPartsFunctions().setLabelMain(_labelMain, "Pitcher")
        }
    }
    
    // 이미지 중앙 이동 및 scale up 할 위치 도출 함수
    //
    func moveCenterActiveImageView(_ frame: CGRect, _ button: UIButton) -> CGAffineTransform {
        let centerViewMain = CGPoint(x: (frame.maxX - frame.minX)/2.0, y: (frame.maxY - frame.minY)/2.0)
        let centerButton = CGPoint(x: button.center.x, y: button.center.y)
        
        let scaleX = frame.width / button.frame.width
        let scaleY = frame.height / button.frame.height
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
    
    // view dismiss 함수
    //
    @objc func clickButtonBack() {
        _viewTopLabel.isHidden = true
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
