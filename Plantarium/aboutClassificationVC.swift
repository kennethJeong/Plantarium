//
//  aboutClassificationVC.swift
//  newNotitle1
//
//  Created by 정은후 on 2020. 6. 18..
//  Copyright © 2020년 정은후. All rights reserved.
//

import UIKit
import RealmSwift

class TableCellSName: UITableViewCell {
    @IBOutlet var cellView: UIView!
    @IBOutlet var cellLabel1: UILabel!
    @IBOutlet var cellLabel2: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

class TableCellCName: UITableViewCell {
    @IBOutlet var cellView: UIView!
    @IBOutlet var cellLabel1: UILabel!
    @IBOutlet var cellLabel2: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

class aboutClassificationVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var viewLoading: UIView!
    @IBOutlet var viewWrapper: UIView!
    @IBOutlet var viewLabelClassification: UIView!
    @IBOutlet var viewLabelScientificName: UIView!
    @IBOutlet var viewLabelCommonName: UIView!
    @IBOutlet var viewLabelPhylogeny: UIView!
    
    @IBOutlet var viewScientificName: UIView!
    @IBOutlet var tableScientificName: UITableView!
    
    @IBOutlet var viewCommonName: UIView!
    @IBOutlet var tableCommonName: UITableView!
    
    @IBOutlet var heightViewSName: NSLayoutConstraint!
    @IBOutlet var heightViewCName: NSLayoutConstraint!
    
    @IBOutlet var viewPhylogeny: UIView!
    @IBOutlet var heightViewPhylogeny: NSLayoutConstraint!
    
    var heightViewWrapper: NSLayoutConstraint?
    
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
    
    var cellCountSName: Int = 1
    var cellCountCName: Int = 1
    
    var _plant = String()
    var dataCName = [Int : [String : String]]()
    
    let rowHeight: CGFloat = 35
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLoading.addSubview(activityIndicator)
        
        viewScientificName.isHidden = true
        viewCommonName.isHidden = true
        
        Realm.AT_remoteRealm(callback: { result in
            switch result {
            case .failure(let error):
                print("Failed to open realm: \(error.localizedDescription)")
            case .success(let realm):
                self.viewLoading.isHidden = true
                self.viewScientificName.isHidden = false
                self.viewCommonName.isHidden = false
                
                // set name table
                //
                let dataName = realm.objects(PlantName.self).filter("_plant == '"+self._plant+"'").sorted(byKeyPath: "language", ascending: true)
                self.cellCountSName += 1
                self.cellCountCName = dataName.count + 1
                
                for i in 0..<dataName.count {
                    let language = dataName[i]["language"] as! String
                    let name = dataName[i]["name"] as! String
                    
                    var tempArr = self.dataCName[i] ?? [:]
                    tempArr["language"] = language
                    tempArr["name"] = name
                    
                    self.dataCName[i] = tempArr
                }
                
                let heightTableSName: CGFloat = self.rowHeight * CGFloat(self.cellCountSName)
                let heightTableCName: CGFloat = self.rowHeight * CGFloat(self.cellCountCName)
                
                self.tableScientificName.frame.size.height = heightTableSName
                self.tableCommonName.frame.size.height = heightTableCName
                
                self.heightViewSName.constant = heightTableSName
                self.heightViewCName.constant = heightTableCName
                
                self.viewScientificName.layoutIfNeeded()
                self.viewCommonName.layoutIfNeeded()
                
                self.tableScientificName.reloadData()
                self.tableCommonName.reloadData()
                
                // set phylogeny
                //
                let dataPhylogeny = realm.objects(Nomenclature.self).filter("_plant == '"+self._plant+"'").first!
                let dicPhylogeny: NSDictionary = dataPhylogeny.toDictionary()   // <Dictionary> phylogeny 데이터
                let dataPhylogenyProperties = dataPhylogeny.objectSchema.properties.enumerated()
                var arrPhylogenyProperties = [String]()   // <Array> phylogeny property 순서 맞추기 위한 배열
                for p in dataPhylogenyProperties {
                    let phylogenyName = p.element.name
                    if phylogenyName != "_id" && phylogenyName != "_plant" && dicPhylogeny.object(forKey: phylogenyName) != nil {
                        arrPhylogenyProperties.append(phylogenyName)
                    }
                }
                
                var phylogenyHeight: CGFloat = 0
                let pRowHeight: CGFloat = 25.0
                let pPropertyWidth: CGFloat = 100.0
                let fontPhylogenyProperty = UIFont(name: "AppleSDGothicNeo-Light", size: 15)
                let fontPhylogenyData = UIFont(name: "AppleSDGothicNeo-Light", size: 20)
                let fontColorPhylogenyData = UIColor(red: 159/255, green: 159/255, blue: 159/255, alpha: 1.0)
                for i in 0..<arrPhylogenyProperties.count {
                    let phylogeny: String = arrPhylogenyProperties[i]
                    let phylogenyKey = dicPhylogeny[phylogeny]
                    if phylogenyKey != nil {
                        let phylogenyData = dicPhylogeny.object(forKey: phylogeny) as! String   // Type ==> [phylogeny : phylogenyData]
                        
                        // phylogeny view
                        let viewRow: UIView = {
                            let view = UIView()
                            view.frame = CGRect(x: 0, y: phylogenyHeight, width: self.viewPhylogeny.frame.width, height: pRowHeight)
                            
                            let labelPhylogenyProperty: UILabel = {
                                let label = UILabel()
                                label.frame = CGRect(x: 0, y: 0, width: pPropertyWidth, height: pRowHeight)
                                label.backgroundColor = UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1.0)
                                label.clipsToBounds = true
                                label.layer.cornerRadius = 5
                                if phylogeny.contains("_") {
                                    let modPhylogeny = phylogeny.replacingOccurrences(of: "_", with: " ")
                                    label.text = modPhylogeny.uppercased()
                                } else {
                                    label.text = phylogeny.uppercased()
                                }
                                label.textAlignment = .center
                                label.font = fontPhylogenyProperty
                                label.textColor = .white
                                
                                return label
                            }()
                            let labelPhylogenyData: UILabel = {
                                let label = UILabel()
                                let labelPaddingLeft: CGFloat = 10.0
                                label.frame = CGRect(x: pPropertyWidth+labelPaddingLeft, y: 0, width: view.frame.width-pPropertyWidth-labelPaddingLeft, height: pRowHeight)
                                label.text = phylogenyData
                                label.textAlignment = .left
                                label.font = fontPhylogenyData
                                label.textColor = fontColorPhylogenyData
                                label.minimumScaleFactor = 0.5
                                
                                return label
                            }()
                            view.addSubview(labelPhylogenyProperty)
                            view.addSubview(labelPhylogenyData)
                            
                            return view
                        }()
                        phylogenyHeight += pRowHeight
                        self.viewPhylogeny.addSubview(viewRow)
                        
                        // downward arrow image view
                        if i != arrPhylogenyProperties.count-1 {
                            let viewRowDownwardArrow: UIView = {
                                let view = UIView()
                                view.frame = CGRect(x: 0, y: phylogenyHeight, width: self.viewPhylogeny.frame.width, height: pRowHeight)
                                
                                let imageDownwardArrow: UIImageView = {
                                    let imageView = UIImageView()
                                    let imageViewPadding: CGFloat = 3.0
                                    imageView.frame = CGRect(x: 0, y: imageViewPadding, width: pPropertyWidth, height: pRowHeight-imageViewPadding*2.0)
                                    imageView.image = UIImage(named: "image_downwardArrow")
                                    imageView.contentMode = .scaleAspectFit
                                    
                                    return imageView
                                }()
                                view.addSubview(imageDownwardArrow)
                                
                                return view
                            }()
                            phylogenyHeight += pRowHeight
                            self.viewPhylogeny.addSubview(viewRowDownwardArrow)
                        }
                    }
                }
                self.viewPhylogeny.frame.size.height = phylogenyHeight
                self.heightViewPhylogeny.constant = phylogenyHeight
                self.viewPhylogeny.layoutIfNeeded()
                
                let resultViewHeight = self.viewPhylogeny.frame.maxY
                self.heightViewWrapper = self.viewWrapper.heightAnchor.constraint(equalToConstant: resultViewHeight)
                self.heightViewWrapper?.isActive = true
            }
        })
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == tableScientificName ? cellCountSName: cellCountCName
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fontHeader = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        let fontBody = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 17)
        let fontColor = UIColor(red: 159/255, green: 159/255, blue: 159/255, alpha: 1.0)
        
        var returnCell = UITableViewCell()
        if tableView == tableScientificName {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell_sName", for: indexPath) as! TableCellSName
            if indexPath.row == 0 {
                cell.cellLabel1.text = "Statue"
                cell.cellLabel2.text = "Name"
                cell.cellLabel1.font = fontHeader
                cell.cellLabel2.font = fontHeader
            } else {
                if indexPath.row == 1 {
                    cell.cellLabel1.text = "Correct"
                    cell.cellLabel2.text = _plant.trimmingCharacters(in: .whitespacesAndNewlines)
                    cell.cellLabel1.font = fontBody
                    cell.cellLabel2.font = fontBody
                }
            }
            cell.cellLabel1.textColor = fontColor
            cell.cellLabel2.textColor = fontColor
            
            returnCell = cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell_cName", for: indexPath) as! TableCellCName
            if indexPath.row == 0 {
                cell.cellLabel1.text = "Language"
                cell.cellLabel2.text = "Name"
                cell.cellLabel1.font = fontHeader
                cell.cellLabel2.font = fontHeader
            } else {
                cell.cellLabel1.text = dataCName[indexPath.row-1]!["language"]?.camelCaseToWords()
                cell.cellLabel2.text = dataCName[indexPath.row-1]!["name"]
                cell.cellLabel1.font = fontBody
                cell.cellLabel2.font = fontBody
            }
            cell.cellLabel1.textColor = fontColor
            cell.cellLabel2.textColor = fontColor
            
            returnCell = cell
        }
        
        returnCell.preservesSuperviewLayoutMargins = false
        returnCell.separatorInset = UIEdgeInsets.zero
        returnCell.layoutMargins = UIEdgeInsets.zero
        
        return returnCell
    }
}

extension Object {
    func toDictionary() -> NSDictionary {
        let properties = self.objectSchema.properties.map { $0.name }
        let dictionary = self.dictionaryWithValues(forKeys: properties)
        
        let mutabledic = NSMutableDictionary()
        mutabledic.setValuesForKeys(dictionary)
        
        for prop in self.objectSchema.properties as [Property] {
            // find lists
            if let nestedObject = self[prop.name] as? Object {
                mutabledic.setValue(nestedObject.toDictionary(), forKey: prop.name)
            } else if let nestedListObject = self[prop.name] as? ListBase {
                var objects = [AnyObject]()
                for index in 0..<nestedListObject._rlmArray.count  {
                    let object = nestedListObject._rlmArray[index] as AnyObject
                    objects.append(object)
                }
                mutabledic.setObject(objects, forKey: prop.name as NSCopying)
            }
            
        }
        return mutabledic
    }
}
