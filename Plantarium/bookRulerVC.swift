//
//  bookRulerVC.swift
//  newNotitle1
//
//  Created by 정은후 on 2020. 5. 7..
//  Copyright © 2020년 정은후. All rights reserved.
//

import UIKit

class bookRulerVC: UIViewController {
    // 전달받은 변수들
    var _plant = String()
    var _plantHeight = CGFloat()
    var _viewRuler = UIView()
    var _buttonRuler = UIButton()
    var _viewTopLabel = UIView()
    var _viewFrameSize = CGSize()
    var _stackViewRuler = UIStackView()
    var _buttonRulerCard = UIButton()
    var _buttonRulerBasketBall = UIButton()
    var _buttonRulerMan = UIButton()
    //
    
    var imageViewFull = UIImageView()
    
    let sizeOfCard_width: CGFloat = 8.560
    let sizeOfCard_height: CGFloat = 5.398
    let sizeOfBasketBall: CGFloat = 24.300
    var sizeOfMan_width: CGFloat = 62
    var sizeOfMan_height: CGFloat = 200
    
    let imageRulerGround = UIImageView()
    var vPadding = CGFloat()
    var vWidthFigure = CGFloat()
    var imageHeightBaseLine = CGFloat()
    
    let labelFigureCM = UILabel()
    let imageViewFigureDash = UIImageView()
    
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
    var exImageViewRuler: String = "card"
    
    var defaultViewTopLabelIsHidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // viewTopLabel 설정
        if !_viewTopLabel.isHidden {
            _viewTopLabel.isHidden = true
        } else {
            defaultViewTopLabelIsHidden = true
        }
        _stackViewRuler.isHidden = false
        
        // buttonRuler 설정
        _buttonRuler.setImage(UIImage(named: "button_ruler_on"), for: .normal)
        _buttonRuler.addTarget(self, action: #selector(clickButtonBack), for: .touchUpInside)
        
        // 바닥 이미지 설정
        let imageRulerGroundHeight: CGFloat = 75.0
        imageRulerGround.image = UIImage(named: "image_ground.png")
        imageRulerGround.frame = CGRect(x: -_viewFrameSize.width/2.0, y: _viewFrameSize.height-imageRulerGroundHeight, width: _viewFrameSize.width*2.0, height: imageRulerGroundHeight)
        self.view.addSubview(imageRulerGround)
        
        vPadding = _viewFrameSize.width / 10.0     // viewRuler의 imageView 간 padding
        vWidthFigure = _viewFrameSize.width / 10.0      // viewRulerFigure 너비
        imageHeightBaseLine = _viewFrameSize.height - imageRulerGround.frame.height/2.0    // 이미지가 위치할 base line
        
        // 초기 이미지 생성
        DispatchQueue.main.async {
            self.initRuler(self._plant)
        }
    }
    
    func initRuler(_ _plant: String) {
        let fullImageFileName = _plant + "_full"
        imageViewFull = self.setEachImageView(viewSize: _viewFrameSize, imageFile: fullImageFileName)
        
        let tempImageRight = imageViewFull
        let tempImageLeft = UIImageView(image: UIImage(named: "image_card"))
        
        let tempImageRightHeight = _viewFrameSize.height - imageRulerGround.frame.height
        let tempImageRightWidth = imageViewFull.frame.width * tempImageRightHeight / imageViewFull.frame.height
        
        let realScale = tempImageRightHeight / CGFloat(_plantHeight)
        
        let tempImageLeftHeight = sizeOfCard_height * realScale
        let tempImageLeftWidth = sizeOfCard_width * realScale
        
        var tempImageRightFrame = CGRect(x: 0, y: 0, width: tempImageRightWidth, height: tempImageRightHeight)
        var tempImageLeftFrame = CGRect(x: 0, y: 0, width: tempImageLeftWidth, height: tempImageLeftHeight)
        
        let sumWidth: CGFloat = tempImageRightFrame.width + tempImageLeftFrame.width     // 두 이미지의 width 합
        let validWidth: CGFloat = _viewFrameSize.width - vPadding*2.0 - vWidthFigure     // 두 이미지가 배치되기 위한 유효 width
        
        // 두 이미지의 width의 합이 viewRuler의 width보다 클 때 -> 두 이미지의 scale 변경 후 배치
        if sumWidth > validWidth {
            // 두 이미지의 scale 변경
            let modScale = validWidth / sumWidth
            tempImageRightFrame.size = CGSize(width: tempImageRightFrame.width * modScale, height: tempImageRightFrame.height * modScale)
            tempImageLeftFrame.size = CGSize(width: tempImageLeftFrame.width * modScale, height: tempImageLeftFrame.height * modScale)
        }
        
        // 비교 이미지의 height가 viewRuler의 height보다 클 때 -> 비교 이미지의 scale 변경 후 배치
        if tempImageLeftFrame.height > _viewFrameSize.height {
            let modScale = (_viewFrameSize.height - imageRulerGround.frame.height) / tempImageLeftFrame.height
            tempImageLeftFrame.size = CGSize(width: tempImageLeftFrame.width * modScale, height: tempImageLeftFrame.height * modScale)
            tempImageRightFrame.size = CGSize(width: tempImageRightFrame.width * modScale, height: tempImageRightFrame.height * modScale)
        }
        
        // left image의 position
        tempImageLeftFrame.origin.x = vPadding
        tempImageLeftFrame.origin.y = imageHeightBaseLine - tempImageLeftFrame.height
        
        // right image의 y position
        tempImageRightFrame.origin.y = imageHeightBaseLine - tempImageRightFrame.height
        
        // figure(label+dash) view의 frame
        let viewFigureFrame = CGRect(x: _viewFrameSize.width - vWidthFigure, y: tempImageRightFrame.minY, width: vWidthFigure, height: tempImageRightFrame.height)
        
        // right image의 x position
        tempImageRightFrame.origin.x = viewFigureFrame.minX - tempImageRightFrame.width
        
        tempImageRight.frame = tempImageRightFrame
        tempImageLeft.frame = tempImageLeftFrame
        
        imageViewRulerCard = tempImageLeft
        
        self.view.addSubview(imageViewRulerCard)
        self.view.addSubview(imageViewFull)
        imageViewRulerCardPlantFrame = tempImageRightFrame
        
        // Cm Label - in viewFigureFrame
        labelFigureCM.frame = CGRect(x: viewFigureFrame.minX, y: viewFigureFrame.minY, width: viewFigureFrame.width, height: 30)
        labelFigureCM.text = String(Int(_plantHeight)) + " cm"
        labelFigureCM.textAlignment = .center
        labelFigureCM.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: CGFloat(14))
        labelFigureCM.minimumScaleFactor = 0.5
        labelFigureCM.adjustsFontSizeToFitWidth = true
        labelFigureCM.lineBreakMode = .byTruncatingTail

        // Dash 이미지 - in viewFigureFrame
        imageViewFigureDash.image = UIImage(named: "image_dashVertical")
        imageViewFigureDash.frame = CGRect(x: labelFigureCM.frame.minX, y: labelFigureCM.frame.maxY, width: viewFigureFrame.width, height: viewFigureFrame.height - labelFigureCM.frame.height)
        imageViewFigureDash.contentMode = .scaleAspectFit

        self.view.addSubview(labelFigureCM)
        self.view.addSubview(imageViewFigureDash)
        
        // 버튼 이미지 변경 및 버튼 활성 상태 변경
        _buttonRulerCard.setImage(UIImage(named: "button_card_on"), for: .normal)
        _buttonRulerCard.isEnabled = false

        // 각 버튼에 클릭 함수 적용
        _buttonRulerCard.addTarget(self, action: #selector(clickRulerCard), for: .touchUpInside)
        _buttonRulerBasketBall.addTarget(self, action: #selector(clickRulerBasketBall), for: .touchUpInside)
        _buttonRulerMan.addTarget(self, action: #selector(clickRulerMan), for: .touchUpInside)
            
        // make rotation button
        if imageViewRulerCard.frame.width > 20 {
            buttonRotation.setImage(UIImage(named:"button_rotation"), for: .normal)
            var buttonRotationFrame = CGRect()
            let fixedValue: CGFloat = 20
            let validPositionY: CGFloat = imageViewRulerCard.frame.width - imageViewRulerCard.frame.height
            buttonRotationFrame = CGRect(x: imageViewRulerCard.center.x-fixedValue/2.0, y: imageViewRulerCard.frame.origin.y-validPositionY-fixedValue, width: fixedValue, height: fixedValue)
            buttonRotation.frame = buttonRotationFrame
            buttonRotation.addTarget(self, action: #selector(clickRulerCardRotation), for: .touchUpInside)
            self.view.addSubview(buttonRotation)
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
        
        let tempImageRightHeight = _viewFrameSize.height - imageRulerGround.frame.height
        let tempImageRightWidth = imageViewFull.frame.width * tempImageRightHeight / imageViewFull.frame.height
        
        let realScale = tempImageRightHeight / _plantHeight
        
        let tempImageLeftHeight = compItem_height * realScale
        let tempImageLeftWidth = compItem_width * realScale
        
        var tempImageRightFrame = CGRect(x: 0, y: 0, width: tempImageRightWidth, height: tempImageRightHeight)
        var tempImageLeftFrame = CGRect(x: 0, y: 0, width: tempImageLeftWidth, height: tempImageLeftHeight)
        
        let sumWidth: CGFloat = tempImageRightFrame.width + tempImageLeftFrame.width     // 두 이미지의 width 합
        let validWidth: CGFloat = _viewFrameSize.width - vPadding*2.0 - vWidthFigure     // 두 이미지가 배치되기 위한 유효 width
        
        // 두 이미지의 width의 합이 viewRuler의 width보다 클 때 -> 두 이미지의 scale 변경 후 배치
        if sumWidth > validWidth {
            // 두 이미지의 scale 변경
            let modScale = validWidth / sumWidth
            tempImageRightFrame.size = CGSize(width: tempImageRightFrame.width * modScale, height: tempImageRightFrame.height * modScale)
            tempImageLeftFrame.size = CGSize(width: tempImageLeftFrame.width * modScale, height: tempImageLeftFrame.height * modScale)
        }
        
        // 비교 이미지의 height가 viewRuler의 height보다 클 때 -> 비교 이미지의 scale 변경 후 배치
        if tempImageLeftFrame.height > _viewFrameSize.height {
            let modScale = (_viewFrameSize.height - imageRulerGround.frame.height) / tempImageLeftFrame.height
            tempImageLeftFrame.size = CGSize(width: tempImageLeftFrame.width * modScale, height: tempImageLeftFrame.height * modScale)
            tempImageRightFrame.size = CGSize(width: tempImageRightFrame.width * modScale, height: tempImageRightFrame.height * modScale)
        }
        
        // left image의 position
        tempImageLeftFrame.origin.x = vPadding
        tempImageLeftFrame.origin.y = imageHeightBaseLine - tempImageLeftFrame.height
        
        // right image의 y position
        tempImageRightFrame.origin.y = imageHeightBaseLine - tempImageRightFrame.height
        
        // figure(label+dash) view의 frame
        let viewFigureFrame = CGRect(x: _viewFrameSize.width - vWidthFigure, y: tempImageRightFrame.minY, width: vWidthFigure, height: tempImageRightFrame.height)
        
        // right image의 x position
        tempImageRightFrame.origin.x = viewFigureFrame.minX - tempImageRightFrame.width
        
        return (left: tempImageLeftFrame, right: tempImageRightFrame)
    }
    
    func setoffImageViewRuler(_ exImageViewRuler: String) {
        if exImageViewRuler == "card" {
            _buttonRulerCard.setImage(UIImage(named: "button_card_off"), for: .normal)
            _buttonRulerCard.isEnabled = true
            
            buttonRotation.isHidden = true
            defaultCardRotation = false
            imageViewRulerCard.transform = CGAffineTransform(rotationAngle: 0)
            buttonRotation.transform = CGAffineTransform(rotationAngle: 0)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.imageViewRulerCard.transform = CGAffineTransform(translationX: -self.imageViewRulerCard.frame.maxX, y: 0)
            })
        }
        else if exImageViewRuler == "basketball" {
            _buttonRulerBasketBall.setImage(UIImage(named: "button_basketball_off"), for: .normal)
            _buttonRulerBasketBall.isEnabled = true
            UIView.animate(withDuration: 0.5, animations: {
                self.imageViewRulerBasketBall.transform = CGAffineTransform(translationX: -self.imageViewRulerBasketBall.frame.maxX, y: 0).rotated(by: 180)
            })
        }
        else if exImageViewRuler == "man" {
            _buttonRulerMan.setImage(UIImage(named: "button_man_off"), for: .normal)
            _buttonRulerMan.isEnabled = true
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
        _buttonRulerCard.setImage(UIImage(named: "button_card_on"), for: .disabled)
        _buttonRulerCard.isEnabled = false
        
        if imageViewRulerCard.image == nil {
            let rulerFrames = setRulerFrames(compItem: "card")
            
            imageViewRulerCard.image = UIImage(named: "image_card")
            imageViewRulerCard.frame = rulerFrames.left
            imageViewRulerCard.transform = CGAffineTransform(translationX: -imageViewRulerCard.frame.maxX, y: 0)
            self.view.addSubview(imageViewRulerCard)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.imageViewFull.frame = rulerFrames.right
                self.imageViewRulerCard.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            imageViewRulerCardPlantFrame = rulerFrames.right
            
            // make rotation button
            buttonRotation.setImage(UIImage(named:"button_rotation"), for: .normal)
            buttonRotation.frame = CGRect(x: imageViewRulerCard.frame.minX-25, y: imageViewRulerCard.frame.minY-50-30, width: 50, height: 50)
            buttonRotation.addTarget(self, action: #selector(clickRulerCardRotation), for: .touchUpInside)
            self.view.addSubview(buttonRotation)
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
        _buttonRulerBasketBall.setImage(UIImage(named: "button_basketball_on"), for: .disabled)
        _buttonRulerBasketBall.isEnabled = false
        
        if imageViewRulerBasketBall.image == nil {
            let rulerFrames = setRulerFrames(compItem: "basketball")
            
            imageViewRulerBasketBall.image = UIImage(named: "image_basketBall")
            imageViewRulerBasketBall.frame = rulerFrames.left
            imageViewRulerBasketBall.transform = CGAffineTransform(translationX: -imageViewRulerBasketBall.frame.maxX, y: 0).rotated(by: 180)
            self.view.addSubview(imageViewRulerBasketBall)
            
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
        _buttonRulerMan.setImage(UIImage(named: "button_man_on"), for: .disabled)
        _buttonRulerMan.isEnabled = false
        
        if imageViewRulerMan.image == nil {
            let rulerFrames = setRulerFrames(compItem: "man")
            
            imageViewRulerMan.image = UIImage(named: "image_man")
            imageViewRulerMan.frame = rulerFrames.left
            imageViewRulerMan.transform = CGAffineTransform(translationX: -imageViewRulerMan.frame.maxX, y: 0)
            self.view.addSubview(imageViewRulerMan)
            
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
            imageViewRulerDial.frame = CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: dialImageWidth, height: dialImageHeight)
            imageViewRulerDial.isUserInteractionEnabled = true
            self.view.addSubview(imageViewRulerDial)
            
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
    
    // 디렉토리 읽어서 이미지 파일 로드 및 변수 저장
    //
    func addImageToMainImageView(_ _plant: String) {
        let imageFileName = _plant + "_full"
        let imageViewToBeAdded: UIImageView = self.setEachImageView(viewSize: _viewFrameSize, imageFile: imageFileName)
        self.view.addSubview(imageViewToBeAdded)
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
        if !defaultViewTopLabelIsHidden {
            _viewTopLabel.isHidden = false
        }
        _viewRuler.isHidden = true
        _stackViewRuler.isHidden = true
        _buttonRuler.setImage(UIImage(named: "button_ruler_off"), for: .normal)
        _buttonRuler.removeTarget(nil, action: nil, for: .allEvents)
        _buttonRuler.addTarget(self, action: #selector(loadPrevBackFunction), for: .touchUpInside)
        
        UIView.animate(withDuration: 0.4, animations: {
            self.view.alpha = 0
        }) { finished in
            self.view.removeFromSuperview()
        }
    }
    
    // NotificationCenter에 저장한 _buttonBack의 이전 함수 Load
    //
    @objc func loadPrevBackFunction() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "clickRuler"), object: nil)
    }
}
