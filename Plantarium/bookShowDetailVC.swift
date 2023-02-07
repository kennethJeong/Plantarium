//
//  bookShowDetailVC.swift
//  newNotitle1
//
//  Created by 정은후 on 16/10/2020.
//  Copyright © 2020 정은후. All rights reserved.
//

import UIKit
import RealmSwift

class bookShowDetailVC: UIViewController {
    @IBOutlet var viewLoading: UIView!
    
    @IBOutlet var swipeForClose: UISwipeGestureRecognizer!
    @IBOutlet var swipeForCloseOnLoading: UISwipeGestureRecognizer!
    @IBOutlet var lblTarget: UILabel!
    @IBOutlet var lblTag: UILabel!
    
    @IBOutlet var viewScroll: UIScrollView!
    @IBOutlet var viewMain: UIView!
    
    @IBOutlet var btnClose: UIButton!
    
    // loading indicator
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = false
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        activityIndicator.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    //
    
    var _plant = String()
    var tagSuperTitle = String()
    var tagMainTitle = String()
    
    var arrSelectButtons = [Int:String]()
    var tagSelectButtons = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLoading.addSubview(activityIndicator)
        viewLoading.isHidden = false
        
        swipeForClose.addTarget(self, action: #selector(swipeClose))
        swipeForCloseOnLoading.addTarget(self, action: #selector(swipeClose))
        btnClose.addTarget(self, action: #selector(swipeClose), for: .touchUpInside)
        
        lblTag.layer.addWaghaBorder(edge: .top, color: UIColor.white, thickness: 1)
        lblTag.layer.addWaghaBorder(edge: .bottom, color: UIColor.white, thickness: 1)
        
        tagSelectButtons = 0
        
        setLabel()  // 라벨 설정
        
        addIcons()  // 아이콘 배치 레이아웃 설정 및 배치
    }
    
    func setLabel() {
        lblTarget.text = _plant.trimmingCharacters(in: .whitespacesAndNewlines)
        lblTag.text = tagMainTitle.capitalized
    }
    
    // 아이콘 배치 레이아웃 설정 및 배치
    //
    func addIcons() {
        Realm.AT_remoteRealm(callback: { result in
            switch result {
            case .failure(let error):
                print("Failed to open realm: \(error.localizedDescription)")
            case .success(let realm):
                self.viewLoading.isHidden = true
                
                let data = realm.objects(Title.self).filter("_plant == '"+self._plant+"' && superTitle =='"+self.tagSuperTitle+"' && mainTitle =='"+self.tagMainTitle+"'")
                let alignmentSubTitle = Array(realm.objects(TitleAlignment.self)).map{$0.subTitle!}.filter({$0 != ""})
                
                // make Array from Realm Data
                //
                var arrSubTitles = [String : [[String : String]]]()
                for i in 0..<data.count {
                    let subTitle = data[i]["subTitle"] as! String
                    let iconTitle = data[i]["iconTitle"] as! String
                    let aData = data[i]["aData"] as! String
                    
                    let arrIconTitle: [String : String] = [iconTitle : aData]
                    
                    var tempArr = arrSubTitles[subTitle] ?? []
                    tempArr.append(arrIconTitle)
                    arrSubTitles[subTitle] = tempArr
                }
                //
                //
                
                let arrSubTitlesKeys = Array(arrSubTitles.keys)
                let arrSortedSubTitle = alignmentSubTitle.filter(arrSubTitlesKeys.contains)
                
                var sumHeight = CGFloat()
                var prevHeight = CGFloat()
                
                for i in 0..<arrSubTitles.count {
                    let arrSub = arrSubTitles[(arrSortedSubTitle[i])]!
                    let countArrSub = arrSub.count
                    
                    var countOuterStackView = Int()
                    var arrSubDivided = [[[String:String]]]()
                    arrSubDivided = arrSub.chunks(3)
                    
                    let limitInOneRow:Int = 3
                    if countArrSub > limitInOneRow {
                        countOuterStackView = arrSubDivided.count
                    } else {
                        countOuterStackView = 1
                    }
                    
                    let view: UIView = {
                        let newView = UIView()
                        let position_x: CGFloat = 20.0
                        let width: CGFloat = self.viewMain.frame.width - position_x*2.0
                        var newViewFrame = CGRect(x: position_x, y: prevHeight, width: width, height: CGFloat())
                        
                        let mainLabel: UILabel = {
                            let newLabel = UILabel()
                            newLabel.textColor = .white
                            newLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 25)
                            newLabel.textAlignment = .left
                            newLabel.text = arrSortedSubTitle[i].capitalized
                            
                            let newLabelWidth = newViewFrame.width
                            let newLabelHeight: CGFloat = 30.0
                            newLabel.frame = CGRect(x: 0, y: 0, width: newLabelWidth, height: newLabelHeight)
                            
                            return newLabel
                        }()
                        
                        newView.addSubview(mainLabel)
                        
                        mainLabel.translatesAutoresizingMaskIntoConstraints = false
                        NSLayoutConstraint.activate([
                            mainLabel.topAnchor.constraint(equalTo: newView.topAnchor),
                            mainLabel.leadingAnchor.constraint(equalTo: newView.leadingAnchor),
                            mainLabel.trailingAnchor.constraint(equalTo: newView.trailingAnchor),
                            mainLabel.heightAnchor.constraint(equalToConstant: mainLabel.frame.height)
                        ])
                        
                        var sumHeightOuterSVs: CGFloat = 0
                        for sv in 0..<countOuterStackView {
                            var arrSubDividedForEachSV = [[String:String]]()
                            for asd in arrSubDivided[sv] {
                                arrSubDividedForEachSV.append(asd)
                            }
                            
                            let outerStackView: UIStackView = {
                                let newSV = UIStackView()
                                newSV.axis = .horizontal
                                newSV.alignment = .fill
                                newSV.distribution = .fillEqually
                                newSV.spacing = 30.0
                                
                                let width4SV: CGFloat = newViewFrame.width
                                let height4SV: CGFloat = 135.0
                                let padding4SV_y: CGFloat = 20.0
                                let position4SV_y: CGFloat = mainLabel.frame.height + ((height4SV + padding4SV_y) * CGFloat(sv))
                                let newViewFrame4SV = CGRect(x: 0, y: position4SV_y, width: width4SV, height: height4SV)
                                
                                // add empty values for arrangement in innerStackView
                                if arrSubDividedForEachSV.count < 3 {
                                    for _ in 0..<limitInOneRow-arrSubDividedForEachSV.count {
                                        arrSubDividedForEachSV.append(["nonValue":"nonValue"])
                                    }
                                }
                                //
                                
                                for j in 0..<arrSubDividedForEachSV.count {
                                    let iconTitle: String = Array(arrSubDividedForEachSV[j].keys)[0]
                                    let aDataRaw: String = arrSubDividedForEachSV[j][iconTitle]!
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
                                    if iconTitle == "nonValue" {
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
                                            
                                            return emptySV
                                        }()
                                    } else {
                                        innerStackView = {
                                            let newSVSub = UIStackView()
                                            newSVSub.axis = .vertical
                                            newSVSub.alignment = .fill
                                            newSVSub.distribution = .fill
                                            
                                            let labelTop: UILabel = {
                                                let newLabel = UILabel()
                                                newLabel.textColor = .white
                                                newLabel.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 14)
                                                newLabel.textAlignment = .center
                                                newLabel.numberOfLines = 1
                                                newLabel.minimumScaleFactor = 0.5
                                                newLabel.adjustsFontSizeToFitWidth = true
                                                newLabel.text = iconTitle.camelCaseToWords()
                                                
                                                return newLabel
                                            }()
                                            labelTop.translatesAutoresizingMaskIntoConstraints = false
                                            labelTop.heightAnchor.constraint(equalToConstant: 15).isActive = true
                                            
                                            let button: UIButton = {
                                                let imageDir: String = Bundle.main.resourcePath! + "/morphology/"
                                                let imageDirToSubTitle: String = imageDir+self.tagSuperTitle+"/"+self.tagMainTitle+"/"+arrSortedSubTitle[i]
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
                                                    // 색상 반전 (= 흑백 반전) <- !작동안함!
//                                                    let imageOrigin = CIImage(image: UIImage(named: imageName)!)
//                                                    if let filter = CIFilter(name: "CIColorInvert") {
//                                                        filter.setValue(imageOrigin, forKey: kCIInputImageKey)
//                                                        let invertedImage = UIImage(ciImage: filter.outputImage!)
//
//                                                        newButton.setImage(invertedImage, for: .normal)
//                                                    }
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
                                            
                                            button.translatesAutoresizingMaskIntoConstraints = false
                                            button.heightAnchor.constraint(equalToConstant: 90).isActive = true
                                            
                                            let labelBottom: UILabel = {
                                                let newLabel = UILabel()
                                                newLabel.textColor = .white
                                                newLabel.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 18)
                                                newLabel.textAlignment = .center
                                                newLabel.numberOfLines = 1
                                                newLabel.minimumScaleFactor = 0.5
                                                newLabel.adjustsFontSizeToFitWidth = true
                                                newLabel.text = aData.camelCaseToWords()
                                                
                                                return newLabel
                                            }()
                                            
                                            newSVSub.addArrangedSubview(labelTop)
                                            newSVSub.addArrangedSubview(button)
                                            newSVSub.addArrangedSubview(labelBottom)
                                            
                                            return newSVSub
                                        }()
                                    }
                                    
                                    newSV.addArrangedSubview(innerStackView)
                                }
                                
                                newSV.frame = newViewFrame4SV
                                
                                sumHeightOuterSVs += height4SV + padding4SV_y
                                
                                return newSV
                            }()
                            
                            newView.addSubview(outerStackView)
                        }
                        
                        newViewFrame.size.height = mainLabel.frame.height + sumHeightOuterSVs
                        
                        newView.frame = newViewFrame
                        
                        prevHeight += newViewFrame.height
                        
                        return newView
                    }()
                    
                    self.viewMain.addSubview(view)
                    
                    sumHeight += view.frame.height
                }
                
                self.viewMain.translatesAutoresizingMaskIntoConstraints = false
                self.viewMain.frame.size.height = sumHeight
                NSLayoutConstraint.activate([
                    self.viewMain.heightAnchor.constraint(equalToConstant: sumHeight)
                ])
            }
        })
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
    
    @objc func swipeClose() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension CALayer {
    func addWaghaBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        let border = CALayer()
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 1)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: self.frame.height - 1, width: self.frame.width, height: 1)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: 1, height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x: self.frame.width - 1, y: 0, width: 1, height: self.frame.height)
            break
        default:
            break
        }
        border.backgroundColor = color.cgColor;
        self.addSublayer(border)
    }
}

extension Array {
    func chunks(_ chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
        }
    }
}

extension String {
    func camelCaseToWords() -> String {
        return unicodeScalars.reduce("") {
            if CharacterSet.uppercaseLetters.contains($1) {
                if $0.count > 0 {
                    return ($0 + " " + String($1))
                }
            }
            return $0.capitalized + String($1)
        }
    }
}
