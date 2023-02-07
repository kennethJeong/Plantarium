//
//  bookPartsFlowerMapVC.swift
//  newNotitle1
//
//  Created by 정은후 on 2021/02/17.
//  Copyright © 2021 정은후. All rights reserved.
//

import UIKit

class bookPartsFlowerMapVC: UIViewController {
    @IBOutlet var stackViewFlowerMap: UIStackView!
    @IBOutlet var viewFlowerMap: UIView!
    @IBOutlet var buttonFlowerMap: UIButton!
    @IBOutlet var buttonFlowerMapPetal: UIButton!
    @IBOutlet var buttonFlowerMapSepal: UIButton!
    @IBOutlet var buttonFlowerMapStamen: UIButton!
    @IBOutlet var buttonFlowerMapPistil: UIButton!
    @IBOutlet var buttonShowDetail: UIButton!
    
    // 전달받은 변수들
    var _plant = String()
    var _labelMain = UILabel()
    var _viewSwitch = UIView()
    var _buttonShowStalk = UIButton()
    var _buttonBack = UIButton()
    var _buttonGoFirst = UIButton()
    
    var imageViewFlowerMap = UIImageView()
    var imageViewFlowerMapPetal = UIImageView()
    var imageViewFlowerMapSepal = UIImageView()
    var imageViewFlowerMapStamen = UIImageView()
    var imageViewFlowerMapPistil = UIImageView()
    
    var dicActiveImageView = [String : UIImageView]()
    var tagFlowerMap = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // labelMain 설정
        bookPartsFunctions().setLabelMain(_labelMain, "Flower Map")
        
        _buttonShowStalk.alpha = 0
        _viewSwitch.isHidden = true
        
        DispatchQueue.main.async {
            self.addImageToMainImageView(self._plant)     // 이미지 파일 로드
        }
        
        // addTarget to all button (buttonFlowerMap, buttonFlowerMapPetal, buttonFlowerMapSepal, buttonFlowerMapStamen, buttonFlowerMapPistil)
        for buttons in stackViewFlowerMap.subviews {
            if let button = buttons as? UIButton {
                button.removeTarget(nil, action: nil, for: .allEvents)
                button.addTarget(self, action: #selector(checkButtonFlowerMap), for: .touchUpInside)
            }
        }
        
        tagFlowerMap = "flowerMap"
        buttonFlowerMap.isUserInteractionEnabled = false
        buttonShowDetail.isHidden = true
        
        DispatchQueue.main.async {
            self.imageViewFlowerMapPetal.transform = CGAffineTransform(translationX: self.viewFlowerMap.frame.width, y: 0)
            self.imageViewFlowerMapSepal.transform = CGAffineTransform(translationX: self.viewFlowerMap.frame.width, y: 0)
            self.imageViewFlowerMapStamen.transform = CGAffineTransform(translationX: self.viewFlowerMap.frame.width, y: 0)
            self.imageViewFlowerMapPistil.transform = CGAffineTransform(translationX: self.viewFlowerMap.frame.width, y: 0)
        }
        
        // 기존의 buttonBack 작동 함수 재설정
        _buttonBack.removeTarget(nil, action: nil, for: .allEvents)
        _buttonBack.addTarget(self, action: #selector(clickButtonBack), for: .touchUpInside)
        
        _buttonGoFirst.addTarget(self, action: #selector(clickButtonBack), for: .touchUpInside)
    }
 
    @objc func checkButtonFlowerMap(sender: UIButton) {
        // tagFlowerMap(현재 활성화되어있는 버튼의 tag값) 확인 후 -> 버튼 비활성화 + 이미지 off로 변경
        //
        if tagFlowerMap == "flowerMap" {
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonFlowerMap.setImage(UIImage(named: "button_flowerMap_off"), for: .normal)
                self.imageViewFlowerMap.transform = CGAffineTransform(translationX: self.viewFlowerMap.frame.width, y: 0)
            })
            buttonFlowerMap.isUserInteractionEnabled = true
        }
        else if tagFlowerMap == "petal" {
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonFlowerMapPetal.setImage(UIImage(named: "button_petal_off"), for: .normal)
                self.imageViewFlowerMapPetal.transform = CGAffineTransform(translationX: self.viewFlowerMap.frame.width, y: 0)
            })
            buttonFlowerMapPetal.isUserInteractionEnabled = true
        }
        else if tagFlowerMap == "sepal" {
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonFlowerMapSepal.setImage(UIImage(named: "button_sepal_off"), for: .normal)
                self.imageViewFlowerMapSepal.transform = CGAffineTransform(translationX: self.viewFlowerMap.frame.width, y: 0)
            })
            buttonFlowerMapSepal.isUserInteractionEnabled = true
        }
        else if tagFlowerMap == "stamen" {
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonFlowerMapStamen.setImage(UIImage(named: "button_stamen_off"), for: .normal)
                self.imageViewFlowerMapStamen.transform = CGAffineTransform(translationX: self.viewFlowerMap.frame.width, y: 0)
            })
            buttonFlowerMapStamen.isUserInteractionEnabled = true
        }
        else if tagFlowerMap == "pistil" {
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonFlowerMapPistil.setImage(UIImage(named: "button_pistil_off"), for: .normal)
                self.imageViewFlowerMapPistil.transform = CGAffineTransform(translationX: self.viewFlowerMap.frame.width, y: 0)
            })
            buttonFlowerMapPistil.isUserInteractionEnabled = true
        }
        
        var newLabelMainText = String()
        
        // 새로이 활성화할 버튼 및 tag값 설정
        //
        if sender == buttonFlowerMap {
            buttonShowDetail.isHidden = true
            tagFlowerMap = "flowerMap"
            
            newLabelMainText = "Flower Map"
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonFlowerMap.setImage(UIImage(named: "button_flowerMap_on"), for: .normal)
                self.imageViewFlowerMap.transform = .identity
            })
            buttonFlowerMap.isUserInteractionEnabled = false
        }
        else if sender == buttonFlowerMapPetal {
            buttonShowDetail.isHidden = false
            tagFlowerMap = "petal"
            
            newLabelMainText = "Petal"
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonFlowerMapPetal.setImage(UIImage(named: "button_petal_on"), for: .normal)
                self.imageViewFlowerMapPetal.transform = .identity
            })
            buttonFlowerMapPetal.isUserInteractionEnabled = false
        }
        else if sender == buttonFlowerMapSepal {
            buttonShowDetail.isHidden = false
            tagFlowerMap = "sepal"
            
            newLabelMainText = "Sepal"
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonFlowerMapSepal.setImage(UIImage(named: "button_sepal_on"), for: .normal)
                self.imageViewFlowerMapSepal.transform = .identity
            })
            buttonFlowerMapSepal.isUserInteractionEnabled = false
        }
        else if sender == buttonFlowerMapStamen {
            buttonShowDetail.isHidden = false
            tagFlowerMap = "stamen"
            
            newLabelMainText = "Stamen"
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonFlowerMapStamen.setImage(UIImage(named: "button_stamen_on"), for: .normal)
                self.imageViewFlowerMapStamen.transform = .identity
            })
            buttonFlowerMapStamen.isUserInteractionEnabled = false
        }
        else if sender == buttonFlowerMapPistil {
            buttonShowDetail.isHidden = false
            tagFlowerMap = "pistil"
            
            newLabelMainText = "Pistil"
            UIView.animate(withDuration: 0.4, animations: {
                self.buttonFlowerMapPistil.setImage(UIImage(named: "button_pistil_on"), for: .normal)
                self.imageViewFlowerMapPistil.transform = .identity
            })
            buttonFlowerMapPistil.isUserInteractionEnabled = false
        }
        
        // labelMain 설정
        bookPartsFunctions().setLabelMain(_labelMain, newLabelMainText)
    }
    
    
    // 디렉토리 읽어서 이미지 파일 로드 및 변수 저장
    //
    func addImageToMainImageView(_ _plant: String) {
        let arrPartsForInit = ["flowerMap", "petal", "sepal", "stamen", "pistil"]  // viewFlowerMap에 넣을 초기 이미지 -> 순서대로 배치해야함.
        
        for i in 0..<arrPartsForInit.count {
            let partsForInit = arrPartsForInit[i]
            let imageFileName = _plant + "_" + partsForInit
            
            let imageViewToBeAdded: UIImageView = self.setEachImageView(viewSize: viewFlowerMap.frame.size, imageFile: imageFileName)
            viewFlowerMap.addSubview(imageViewToBeAdded)
            
            dicActiveImageView[partsForInit] = imageViewToBeAdded
        }
        
        // 각 parts에 맞는 imageView 변수 생성
        mkVariableForParts(dicActiveImageView)
    }
    
    // 각 parts에 맞는 imageView 변수 생성
    //
    func mkVariableForParts(_ dicActiveImageView: [String : UIImageView]) {
        for (parts, partsImageView) in dicActiveImageView {
            if parts == "flowerMap" {
                imageViewFlowerMap = partsImageView
            }
            else if parts == "petal" {
                imageViewFlowerMapPetal = partsImageView
            }
            else if parts == "sepal" {
                imageViewFlowerMapSepal = partsImageView
            }
            else if parts == "stamen" {
                imageViewFlowerMapStamen = partsImageView
            }
            else if parts == "pistil" {
                imageViewFlowerMapPistil = partsImageView
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
        _buttonShowStalk.alpha = 1.0
        _viewSwitch.isHidden = false
        
        bookPartsFunctions().setLabelMain(_labelMain, "Flower Type")
        
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
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "clickBackInInflorescence"), object: nil)
    }
}
