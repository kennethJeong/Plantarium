//
//  aboutDistributionLandscapeMapVC.swift
//  newNotitle1
//
//  Created by 정은후 on 2021/01/07.
//  Copyright © 2021 정은후. All rights reserved.
//

import UIKit
import MapboxMaps

class aboutDistributionLandscapeMapVC: UIViewController, MGLMapViewDelegate {
    @IBOutlet var viewWrapper: UIView!
    
    var arrPointCoords = [CLLocationCoordinate2D]()
    var arrPolygonCoords = [[CLLocationCoordinate2D]]()
    var viewMap = MGLMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting for viewMap
        viewMap.frame = self.viewWrapper.bounds
        viewMap.styleURL = URL(string: "mapbox://styles/eunhujeong/ckjwnkp0z0mm519o3u4d30pn7")
        viewMap.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewMap.setCenter(CLLocationCoordinate2D(latitude: 0, longitude: 0), zoomLevel: 0.5, animated: false)
        viewMap.delegate = self
        viewMap.logoView.isHidden = true
        viewMap.attributionButton.isHidden = true
        viewMap.minimumZoomLevel = 0.5
        viewMap.maximumZoomLevel = 3
        viewWrapper.addSubview(viewMap)
        
        for i in 0..<arrPointCoords.count {
            DispatchQueue.main.async {
                let circle = MGLPointAnnotation()
                circle.coordinate = self.arrPointCoords[i]
                self.viewMap.addAnnotation(circle)
            }
        }
        
        for i in 0..<arrPolygonCoords.count {
            let polygonCoords = arrPolygonCoords[i]
            DispatchQueue.main.async {
                // add polygon inside
                let polygon = MGLPolygon(coordinates: polygonCoords, count: UInt(polygonCoords.count))
                self.viewMap.add(polygon)
                
                // add polygon outline
                let polygonBoundary = MGLPolyline(coordinates: polygonCoords, count: UInt(polygonCoords.count))
                self.viewMap.add(polygonBoundary)
            }
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
            annotationView!.bounds = CGRect(x: 0, y: 0, width: 10, height: 10)
            annotationView!.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.8)
        }
        
        return annotationView
    }
    
    override public var shouldAutorotate: Bool {
        return false
    }
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
    }
    
    @IBAction func dismissView(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
