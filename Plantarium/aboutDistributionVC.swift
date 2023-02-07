//
//  aboutDistributionVC.swift
//  newNotitle1
//
//  Created by 정은후 on 2020. 6. 18..
//  Copyright © 2020년 정은후. All rights reserved.
//

import UIKit
import RealmSwift
//import MapboxMaps

class aboutDistributionVC: UIViewController, MGLMapViewDelegate {
    @IBOutlet var viewLoading: UIView!
    @IBOutlet var viewScroll: UIScrollView!
    @IBOutlet var viewWrapper: UIView!
    @IBOutlet var labelDistribution: UIView!
    @IBOutlet var viewMapWrapper: UIView!
    @IBOutlet var viewRegionButtons: UIView!
    
    @IBOutlet var heightViewRegionButtons: NSLayoutConstraint!
    
    var viewMap = MGLMapView()
    var _plant = String()
    
    var arrPointCoords = [CLLocationCoordinate2D]()    // Point 좌표 배열
    var arrPolygonCoords = [[CLLocationCoordinate2D]]()    // Polygon 좌표 배열
    
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
    
    var heightViewWrapper: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        viewLoading.addSubview(activityIndicator)
        
        // setting for viewMap
        viewMap.frame = self.viewMapWrapper.bounds
        viewMap.styleURL = URL(string: "mapbox://styles/eunhujeong/ckjwnkp0z0mm519o3u4d30pn7")
        viewMap.setCenter(CLLocationCoordinate2D(latitude: 0, longitude: 0), zoomLevel: 0, animated: false)
        viewMap.delegate = self
        viewMap.logoView.isHidden = true
        viewMap.attributionButton.isHidden = true
        viewMap.isUserInteractionEnabled = false
        
        let maxDimension = max(viewMap.frame.width, viewMap.frame.height)
        let mapDimension = max(maxDimension, 550)
        let mapviewBounds = CGRect(x: 0, y: 0, width: mapDimension, height: mapDimension)
        let transform = CGAffineTransform(scaleX: maxDimension / mapDimension, y: maxDimension / mapDimension)
        let transformedBounds = mapviewBounds.applying(transform)
        viewMap.bounds = mapviewBounds
        viewMap.transform = transform
        viewMap.center = CGPoint(x: viewMap.center.x, y: transformedBounds.maxY/2.0 * 0.9)
        
        viewMapWrapper.addSubview(viewMap)
        viewMapWrapper.clipsToBounds = true
        
        connForDistribution()
        
        let viewHeightInit = viewRegionButtons.frame.maxY
        heightViewWrapper = viewWrapper.heightAnchor.constraint(equalToConstant: viewHeightInit)
        heightViewWrapper?.isActive = true
    }
    
    func connForDistribution() {
        Realm.AT_remoteRealm(callback: { result in
            switch result {
            case .failure(let error):
                print("Failed to open realm: \(error.localizedDescription)")
            case .success(let realm):
                let data = realm.objects(Distribution.self).filter("_plant == '"+self._plant+"'")
                var arrRegions = [String : [String]]()
                for i in 0..<data.count {
                    let country = data[i]["country"] as! String
                    let region = data[i]["region"] as! String
                    
                    if region != "" {
                        var tempArr = arrRegions[country] ?? []
                        tempArr.append(region)
                        arrRegions[country] = tempArr
                    }
                    
                    var searchText = String()
                    if region.isEmpty == true || region == "" {
                        searchText = country
                    } else {
                        searchText = region + "," + country
                    }
                    self.mkPolygonInMap(searchText)   // 맵 오브젝트(point circle, polygon) 생성 함수
                }
                self.mkButtonForRegions(arrRegions)   // 맵 아래 [버튼] 생성 함수
            }
        })
    }
    
    func mkButtonForRegions(_ arrRegions: [String : [String]]) {
        var prevHeight4View: CGFloat = 0
        
        let arrKeys = arrRegions.keys.sorted()
        for i in 0..<arrKeys.count {
            let country: String = arrKeys[i]
            let regions: Array = arrRegions[country] ?? []
            let limitButtonsInRow: Int = 5
            let countRowInView: Int = ((regions.count + 1) / limitButtonsInRow) + 1
            let height4EachViewRow: CGFloat = 35.0
            
            // 각 Country마다의 전체 View
            let viewCountry: UIView = {
                let view = UIView()
                let padding4ViewXY: CGFloat = viewRegionButtons.frame.width * 0.05
                let padding4ViewTop: CGFloat = 15.0
                let width4View: CGFloat = viewRegionButtons.frame.width - padding4ViewXY * 2
                let height4View: CGFloat = height4EachViewRow * CGFloat(countRowInView)
                let position4ViewCountry: CGFloat = prevHeight4View
                prevHeight4View += height4View + padding4ViewTop
                let frame4View = CGRect(x: padding4ViewXY, y: position4ViewCountry, width: width4View, height: height4View)
                view.frame = frame4View
                
                let width4EachDottedLine: CGFloat = width4View * 0.03
                let width4EachButton: CGFloat = (width4View - width4EachDottedLine * (CGFloat(limitButtonsInRow) - 1)) / CGFloat(limitButtonsInRow)
                // Country 버튼+Label
                let buttonCountry: UIButton = {
                    let button = UIButton()
                    let height4Button: CGFloat = height4EachViewRow
                    let frame4Button = CGRect(x: 0, y: 0, width: width4EachButton, height: height4Button)
                    button.frame = frame4Button
                    
                    let label4Button: UILabel = {
                        let label = UILabel()
                        let width4Label: CGFloat = frame4Button.width
                        let height4Label: CGFloat = frame4Button.height
                        label.frame = CGRect(x: 0, y: 0, width: width4Label, height: height4Label)
                        label.text = country.capitalized
                        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 12)
                        label.textColor = .white
                        label.textAlignment = .center
                        label.adjustsFontSizeToFitWidth = true
                        label.minimumScaleFactor = 0.5
                        label.backgroundColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
                        label.clipsToBounds = true
                        label.layer.cornerRadius = height4Label / 3.0
                        label.layer.borderWidth = 0
                        
                        return label
                    }()
                    button.addSubview(label4Button)
                    
                    return button
                }()
                let buttonCountryPointFrom = CGPoint(x: buttonCountry.frame.maxX, y: buttonCountry.frame.midY)
                let buttonCountryPointTo = CGPoint(x: buttonCountry.frame.maxX+width4EachDottedLine, y: buttonCountry.frame.midY)
                let dashedLineColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
                view.createDashedLine(from: buttonCountryPointFrom, to: buttonCountryPointTo, color: dashedLineColor, strokeLength: 1, gapLength: 1, width: 1)
                
                // Country에 속하는 모든 Region들의 버튼+Label
                for j in 0..<regions.count {
                    let buttonRegion: UIButton = {
                        let button = UIButton()
                        let width4Button: CGFloat = width4EachButton
                        let height4Button: CGFloat = height4EachViewRow
                        let whichRowIsThisButton: Int = Int((j+1) / limitButtonsInRow) + 1
                        let buttonPositionY: CGFloat = height4EachViewRow * CGFloat(whichRowIsThisButton - 1)
                        var buttonPositionX: CGFloat = 0
                        // 2번째 줄 부터, 각 줄에서 각 Region Button들의 Frame X 값 도출을 위한 수식
                        let buttionPositionX_Positive: CGFloat = CGFloat(j - (limitButtonsInRow * (whichRowIsThisButton - 1) - 1))    // whichRowIsThisButton == [홀수]일 때, -> 정방향으로 배치
                        let buttionPositionX_Negative: CGFloat = CGFloat(limitButtonsInRow) - buttionPositionX_Positive - 1   // whichRowIsThisButton == [짝수]일 때, -> 역방향으로 배치
                        //
                        
                        if whichRowIsThisButton % 2 == 1 {  // 홀수번째 Row일때 -> 왼쪽에서 오른쪽으로 배치
                            if whichRowIsThisButton == 1 {  // 1번째 줄 -> Country Button 이후에 Region Button들을 배치함
                                buttonPositionX = (width4Button + width4EachDottedLine) * CGFloat(j / whichRowIsThisButton + 1)
                            } else {
                                buttonPositionX = (width4Button + width4EachDottedLine) * buttionPositionX_Positive   // 정방향(왼쪽에서부터 배치하는)
                            }
                            
                            // create dashed line
                            if j != regions.count - 1 {     // 마지막으로 배치된 버튼이 아닐 때
                                var buttonRegionPointFrom = CGPoint(x: buttonPositionX + width4Button, y: buttonPositionY + height4Button / 2)
                                var buttonRegionPointTo = CGPoint(x: buttonPositionX + width4Button + width4EachDottedLine, y: buttonPositionY + height4Button / 2)
                                if buttonRegionPointFrom.x == view.bounds.maxX {    // dashed line -> 위에서 아래로
                                    buttonRegionPointFrom = CGPoint(x: buttonPositionX + width4Button / 2, y: buttonPositionY + height4Button / 2)
                                    buttonRegionPointTo = CGPoint(x: buttonPositionX + width4Button / 2, y: buttonPositionY + height4Button / 2 + height4Button)
                                }
                                view.createDashedLine(from: buttonRegionPointFrom, to: buttonRegionPointTo, color: dashedLineColor, strokeLength: 1, gapLength: 1, width: 1)
                            }
                        } else {  // 짝수번째 Row일때 -> 오른쪽에서 왼쪽으로 배치
                            buttonPositionX = (width4Button + width4EachDottedLine) * buttionPositionX_Negative   // 역방향(오른쪽에서부터 배치하는)
                            
                            // create dashed line
                            if j != regions.count - 1 {
                                var buttonRegionPointFrom = CGPoint(x: buttonPositionX, y: buttonPositionY + height4Button / 2)
                                var buttonRegionPointTo = CGPoint(x: buttonPositionX - width4EachDottedLine, y: buttonPositionY + height4Button / 2)
                                if buttonRegionPointFrom.x == view.bounds.minX {    // dashed line -> 위에서 아래로
                                    buttonRegionPointFrom = CGPoint(x: buttonPositionX + width4Button / 2, y: buttonPositionY + height4Button / 2)
                                    buttonRegionPointTo = CGPoint(x: buttonPositionX + width4Button / 2, y: buttonPositionY + height4Button / 2 + height4Button)
                                }
                                view.createDashedLine(from: buttonRegionPointFrom, to: buttonRegionPointTo, color: dashedLineColor, strokeLength: 1, gapLength: 1, width: 1)
                            }
                        }
                        let frame4Button = CGRect(x: buttonPositionX, y: buttonPositionY, width: width4Button, height: height4Button)
                        button.frame = frame4Button
                        
                        let label4Button: UILabel = {
                            let label = UILabel()
                            let width4Label: CGFloat = frame4Button.width
                            let padding4LabelTopAndBottom: CGFloat = frame4Button.height * 0.15
                            let height4Label: CGFloat = frame4Button.height - padding4LabelTopAndBottom * 2
                            label.frame = CGRect(x: 0, y: padding4LabelTopAndBottom, width: width4Label, height: height4Label)
                            label.text = regions[j].capitalized
                            label.font = UIFont(name: "AppleSDGothicNeo-Light", size: 12)
                            label.textColor = .white
                            label.textAlignment = .center
                            label.adjustsFontSizeToFitWidth = true
                            label.minimumScaleFactor = 0.5
                            label.backgroundColor = UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1.0)
                            label.clipsToBounds = true
                            label.layer.cornerRadius = height4Label / 3.0
                            label.layer.borderWidth = 0
                            
                            return label
                        }()
                        button.addSubview(label4Button)
                        
                        return button
                    }()
                    view.addSubview(buttonRegion)
                }
                view.addSubview(buttonCountry)
                
                return view
            }()
            viewRegionButtons.addSubview(viewCountry)
            
            if i == arrKeys.count - 1 {
                viewRegionButtons.frame.size.height = prevHeight4View
                heightViewRegionButtons?.constant = prevHeight4View
                viewRegionButtons.layoutIfNeeded()
                
                let resultViewHeight = viewRegionButtons.frame.maxY
                heightViewWrapper?.constant = resultViewHeight
                viewWrapper.layoutIfNeeded()
            }
        }
    }
    
    func mkPolygonInMap(_ searchText: String) {
        let url = "https://nominatim.openstreetmap.org/search.php?q="+searchText+"&polygon_geojson=1&format=jsonv2"
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let responseString = String(data: data, encoding: .utf8)!
                    let json = responseString.parseJSONString
                    let jsonObject = json?.object(at: 0) as! [String : AnyObject]
                    let coordCenterLat = Double(jsonObject["lat"] as! String)!
                    let coordCenterLon = Double(jsonObject["lon"] as! String)!
                    let coordCenter = CLLocationCoordinate2DMake(coordCenterLat, coordCenterLon)
                    let coordinatesType = (jsonObject["geojson"]!["type"]!)! as! NSString
                    let coordinatesSet = (jsonObject["geojson"]!["coordinates"]!)! as! NSArray
                    
                    if coordinatesType == "Point" {     // 범위가 너무 작을 때 -> 원으로 표시
                        DispatchQueue.main.async {
                            let circle = MGLPointAnnotation()
                            circle.coordinate = coordCenter
                            self.viewMap.addAnnotation(circle)
                        }
                        self.arrPointCoords.append(coordCenter)
                    } else {
                        let coordinates = coordinatesSet[0] as! NSArray
                        if coordinates.count < 1000 {   // 범위가 너무 작을 때 -> 원으로 표시
                            DispatchQueue.main.async {
                                let circle = MGLPointAnnotation()
                                circle.coordinate = coordCenter
                                self.viewMap.addAnnotation(circle)
                            }
                            self.arrPointCoords.append(coordCenter)
                        } else {
                            var arrClCoords = [CLLocationCoordinate2D]()
                            for i in 0..<coordinates.count {
                                let eachCoords = coordinates[i] as! [Double]
                                let lon = eachCoords[0]
                                let lat = eachCoords[1]
                                let clCoords = CLLocationCoordinate2DMake(lat, lon)
                                arrClCoords.append(clCoords)
                            }
                            self.arrPolygonCoords.append(arrClCoords)
                            
                            DispatchQueue.main.async {
                                let polygon = MGLPolygon(coordinates: &arrClCoords, count: UInt(arrClCoords.count))
                                self.viewMap.add(polygon)
                                
                                let polygonBoundary = MGLPolyline(coordinates: &arrClCoords, count: UInt(arrClCoords.count))
                                self.viewMap.add(polygonBoundary)
                            }
                            
//                            self.viewLoading.isHidden = true
                        }
                    }
                }
            }.resume()
        }
    }
    
    func mapView(_ mapView: MGLMapView, alphaForShapeAnnotation annotation: MGLShape) -> CGFloat {
        return 1.0
    }
    func mapView(_ mapView: MGLMapView, strokeColorForShapeAnnotation annotation: MGLShape) -> UIColor {
        return .white
    }
    func mapView(_ mapView: MGLMapView, lineWidthForPolylineAnnotation annotation: MGLPolyline) -> CGFloat {
        return 1.0
    }
    func mapView(_ mapView: MGLMapView, fillColorForPolygonAnnotation annotation: MGLPolygon) -> UIColor {
        return .red
    }
    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        guard annotation is MGLPointAnnotation else {
            return nil
        }
        let reuseIdentifier = "\(annotation.coordinate.latitude)+\(annotation.coordinate.longitude)"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
        if annotationView == nil {
            annotationView = CustomAnnotationView(reuseIdentifier: reuseIdentifier)
            annotationView!.bounds = CGRect(x: 0, y: 0, width: 5, height: 5)
            annotationView!.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1.0)
        }
        
        return annotationView
    }
    
    @IBAction func showMapLandscape(_ sender: UIButton) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "aboutDistributionLandscapeMapVC") as? aboutDistributionLandscapeMapVC else {
            return
        }
        
        rvc.arrPointCoords = arrPointCoords
        rvc.arrPolygonCoords = arrPolygonCoords
        
        rvc.modalPresentationStyle = .fullScreen
        rvc.modalTransitionStyle = .crossDissolve
        
        if var topController = UIApplication.shared.windows.filter({$0.isKeyWindow}).first!.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.present(rvc, animated: true, completion: nil)
        }
    }
}

extension String {
    var parseJSONString: AnyObject? {
        let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false)
        if let jsonData = data {
            // Will return an object or nil if JSON decoding fails
            do {
                let message = try JSONSerialization.jsonObject(with: jsonData, options:.mutableContainers)
                if let jsonResult = message as? NSMutableArray {
                    return jsonResult //Will return the json array output
                } else {
                    return nil
                }
            }
            catch let error as NSError {
                print("An error occurred: \(error)")
                return nil
            }
        } else {
            // Lossless conversion of the string was not possible
            return nil
        }
    }
}


//
// MGLAnnotationView subclass
class CustomAnnotationView: MGLAnnotationView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.width / 2
        layer.borderWidth = 0
    }
}


extension UIView {
    func createDashedLine(from point1: CGPoint, to point2: CGPoint, color: UIColor, strokeLength: NSNumber, gapLength: NSNumber, width: CGFloat) {
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = width
        shapeLayer.lineDashPattern = [strokeLength, gapLength]
        
        let path = CGMutablePath()
        path.addLines(between: [point1, point2])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
}
