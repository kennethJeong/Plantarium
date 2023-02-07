//
//  searchNameVC.swift
//  newNotitle1
//
//  Created by 정은후 on 2020. 7. 20..
//  Copyright © 2020년 정은후. All rights reserved.
//

import UIKit
import RealmSwift

class TableCell: UITableViewCell {
    @IBOutlet var cellView: UIView!
    @IBOutlet var cellViewForImage: UIView!
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var cellLabelMain: UILabel!
    @IBOutlet var cellLabelSub: UILabel!
    @IBOutlet var cellLabelHashtag: UILabel!
    @IBOutlet var cellButtonMore: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // each cell's setting
        cellView.layer.cornerRadius = 8.0
        cellView.layer.borderWidth = 0
        cellView.layer.borderColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0).cgColor
        cellView.layer.shadowColor = UIColor(red: 212/255, green: 212/255, blue: 212/255, alpha: 1.0).cgColor
        cellView.layer.shadowOpacity = 1.0
        cellView.layer.shadowRadius = 3.0
        cellView.layer.shadowOffset = CGSize(width: 0, height: 5.0)
        
        cellViewForImage.clipsToBounds = true
        cellViewForImage.roundCorners(corners: [.topLeft, .bottomLeft], radius: 8.0)
        cellImage.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
    }
}

class searchNameVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    @IBOutlet var viewLoading: UIView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var searchTable: UITableView!
    @IBOutlet var viewButtonFilter: UIView!
    @IBOutlet var viewFilter: UIView!
    
    // loading indicator
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        activityIndicator.center = CGPoint(x: self.view.center.x, y: self.view.center.y-70)
        activityIndicator.hidesWhenStopped = false
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        activityIndicator.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    //
    
    var arrPlants = [[String : String]]()
    var arrPlantsOrigin = [[String : String]]()
    var searching = false
    var searchedPlants = [String]()
    var searchedPlantsForTable = [[String : String]]()
    
    var defaultFilter = false
    let viewFilterWidth:CGFloat = 300
    
    var selectionFilter = [[String : [String]]]()
    
    override func viewDidAppear(_ animated: Bool) {
        // set option for searchbar
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = .white
            textField.layer.cornerRadius = textField.frame.height / 2
            textField.layer.borderWidth = 1.0
            textField.layer.borderColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 0.5).cgColor
            
            if let backgroundView = textField.subviews.first {
                backgroundView.removeFromSuperview()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLoading.addSubview(activityIndicator)
        
        viewFilter.roundCorners(corners: [.bottomLeft], radius: 15.0)
        
        searchTable.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1.0)
        searchTable.rowHeight = 100
        
        plantListUpFromDB()
    }
    
    // DB로부터 Nomenclature 및 PlantName 가져와서, arrPlants 배열 생성
    //
    func plantListUpFromDB() {
        Realm.AT_remoteRealm(callback: { result in
            switch result {
            case .failure(let error):
                print("Failed to open realm: \(error.localizedDescription)")
            case .success(let realm):
                let dataNomenclature = realm.objects(Nomenclature.self)
                
                for i in 0..<dataNomenclature.count {
                    let _plant = dataNomenclature[i]["_plant"] as! String
                    let sName = _plant.trimmingCharacters(in: .whitespacesAndNewlines)
                    let family = dataNomenclature[i]["family"] as! String
                    let order = dataNomenclature[i]["order"] as! String
                    let genus = dataNomenclature[i]["genus"] as! String
                    
                    let dataPlantName = realm.objects(PlantName.self).filter("_plant == '"+_plant+"' && isMain == true")
                    let cName = dataPlantName[i]["name"] as! String
                    
                    var tempArr = [String : String]()
                    tempArr["_plant"] = _plant
                    tempArr["sName"] = sName
                    tempArr["cName"] = cName
                    tempArr["family"] = family
                    tempArr["order"] = order
                    tempArr["genus"] = genus
                    
                    self.arrPlants.insert(tempArr, at: i)
                    self.arrPlantsOrigin = self.arrPlants
                    
                    self.searchTable.reloadData()
                    
                    self.viewLoading.isHidden = true
                }
            }
        })
    }
    
    // buttonFilter (in viewFilter) 작동 함수
    //
    @IBAction func clickFilter(_ sender: UIButton) {
        if !defaultFilter {
            defaultFilter = true
            
            searchBar.isUserInteractionEnabled = false
            searchTable.isScrollEnabled = false
            searchTable.allowsSelection = false
            
            viewFilter.frame.origin.x = self.view.frame.size.width
            viewFilter.alpha = 1.0
            viewFilter.isHidden = false
            UIView.animate(withDuration: 0.3, animations: {
                self.viewButtonFilter.transform = CGAffineTransform(translationX: -self.viewFilterWidth, y: 0)
                self.viewFilter.transform = CGAffineTransform(translationX: -self.viewFilterWidth, y: 0)
            })
        } else {
            defaultFilter = false
            
            searchBar.isUserInteractionEnabled = true
            searchTable.isScrollEnabled = true
            searchTable.allowsSelection = true
            
            UIView.animate(withDuration: 0.3, animations: {
                self.viewButtonFilter.transform = .identity
                self.viewFilter.transform = .identity
            }, completion: { (finished: Bool) in
                self.viewFilter.alpha = 0
                self.viewFilter.isHidden = true
            })
        }
    }
    
    // searchNameFilterVC에서 들어온 filter selection 데이터 수신 함수
    //
    func getFilterSelection(_ selection: [[String : [String]]]) {
        // 5개의 order의 value가 각각 존재하는지 체크 -> 5개 이상일 경우(filter에서 선택한 항목이 없을 경우) / 5개 미만일 경우(filter에서 선택한 항목이 있을 경우)
        var checkEmpty = 0
        for values in selection {
            if (values["order"]?.isEmpty)! {
                checkEmpty += 1
            }
        }
        
        // filter에서 선택한 항목이 있을 경우 -> filtering된 searchTable 보여줌
        if checkEmpty < 5 {
            var tempArrPlants = [[String : String]]()
            for eachSelection in selection {
                let order:[String] = eachSelection["order"]!
                //let family:[String] = eachSelection["family"]!
                let genus:[String] = eachSelection["genus"]!
                
                if order.count > 0 {
                    for i in 0..<arrPlants.count {
                        for (k, v) in arrPlants[i] {
                            for g in genus {
                                if k == "genus" && v == g {
                                    if !tempArrPlants.contains(arrPlants[i]) {
                                        tempArrPlants.append(arrPlants[i])
                                    }
                                }
                            }
                        }
                    }
                }
            }
            arrPlants = tempArrPlants
        }
        // filter에서 선택한 항목이 없을 경우 -> 기본 searchTable 보여줌
        else {
            arrPlants = arrPlantsOrigin
        }
        
        searchTable.reloadData()
    }
    
    //
    // set tableview
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchedPlants.count
        } else {
            return arrPlants.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! TableCell
        
        if searching {
            cell.cellImage.image = UIImage(named: searchedPlantsForTable[indexPath.row]["_plant"]! + "_full.png")
            cell.cellLabelMain.text = searchedPlantsForTable[indexPath.row]["sName"]!
            cell.cellLabelSub.text = searchedPlantsForTable[indexPath.row]["cName"]!
            cell.cellLabelHashtag.text = "#"+searchedPlantsForTable[indexPath.row]["family"]!+" #"+searchedPlantsForTable[indexPath.row]["order"]!
        } else {
            cell.cellImage.image = UIImage(named: arrPlants[indexPath.row]["_plant"]! + "_full.png")
            cell.cellLabelMain.text = arrPlants[indexPath.row]["sName"]!
            cell.cellLabelSub.text = arrPlants[indexPath.row]["cName"]!
            cell.cellLabelHashtag.text = "#"+arrPlants[indexPath.row]["family"]!+" #"+arrPlants[indexPath.row]["order"]!
        }
        
        return cell
    }
    // 하나의 plant 선택(클릭) 시, BookVC로 데이터 전달 및 뷰 전환 함수
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let arrSelectedPlant = arrPlants[indexPath.row]
        
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "bookVC") as? bookVC else {
            return
        }
        
        rvc._plant = arrSelectedPlant["_plant"]!
        rvc._plantCName = arrSelectedPlant["cName"]!
        rvc._plantFamily = arrSelectedPlant["family"]!
        rvc._plantOrder = arrSelectedPlant["order"]!
        rvc._plantGenus = arrSelectedPlant["genus"]!
        
        rvc.modalPresentationStyle = .overCurrentContext
        rvc.modalTransitionStyle = .crossDissolve
        
        if var topController = UIApplication.shared.windows.filter({$0.isKeyWindow}).first!.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.present(rvc, animated: true, completion: nil)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell  = tableView.cellForRow(at: indexPath)
        let cellView = cell?.contentView.subviews.first
        let cellViewForImage = cellView?.subviews.filter({$0.isKind(of: UIView.self)}).first
        cellView?.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
        cellViewForImage?.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell  = tableView.cellForRow(at: indexPath)
        let cellView = cell?.contentView.subviews.first
        let cellViewForImage = cellView?.subviews.filter({$0.isKind(of: UIView.self)}).first
        cellView?.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1.0)
        cellViewForImage?.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
    }
    
    //
    // set searchBar
    //
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            searching = true
            searchedPlants = [String]()
            searchedPlantsForTable = [[String : String]]()
        } else {
            searching = false
        }
        
        // searchedPlants (searchBar에 입력된 searchText로 검색) -> value 설정
        //
        for i in 0..<arrPlants.count {
            if let tempSearchedPlants = arrPlants[i]["sName"], tempSearchedPlants.prefix(searchText.count) == searchText {
                if !searchedPlants.contains(tempSearchedPlants) {
                    searchedPlants.append(tempSearchedPlants)
                }
            }
            else if let tempSearchedPlants = arrPlants[i]["cName"], tempSearchedPlants.prefix(searchText.count) == searchText {
                if !searchedPlants.contains(tempSearchedPlants) {
                    searchedPlants.append(tempSearchedPlants)
                }
            } else {
                //
            }
        }
        
        // searchedPlantsForTable (tableview의 cell에 표시할 데이터를 위한 Dictionary) -> value 설정
        //
        for i in 0..<arrPlants.count {
            for v in searchedPlants {
                if v == arrPlants[i]["sName"] || v == arrPlants[i]["cName"] {
                    if !searchedPlantsForTable.contains(arrPlants[i]) {
                        searchedPlantsForTable.append(arrPlants[i])
                    }
                } else {
                    
                }
            }
        }
        
        searchTable.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
