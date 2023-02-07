//
//  csvConverter.swift
//  newNotitle1
//
//  Created by 정은후 on 2020/11/27.
//  Copyright © 2020 정은후. All rights reserved.
//

import UIKit
import RealmSwift

class csvConverter: UIViewController {
    override func viewDidLoad() {
//        let csv = getArrayFromCSV(csvFileName: "Title")
//        let csv2 = getArrayFromCSV(csvFileName: "TitleAlignment")
        
        Realm.AT_remoteRealm(callback: { result in
            switch result {
            case .failure(let error):
                print("Failed to open realm: \(error.localizedDescription)")
            case .success(let realm):
                print("Successfully opened realm: \(realm)")
//                for i in 0..<csv.count {
//                    let row = csv[i]
//
//                    let data = Title()
//                    data._id = i
//                    data._plant = row[0]
//                    data.superTitle = row[1]
//                    data.mainTitle = row[2]
//                    data.subTitle = row[3]
//                    data.iconTitle = row[4]
//                    data.aData = row[5]
//
//                    try! realm.write {
//                        realm.add(data)
//                    }
//                }
//
//                for i in 0..<csv2.count {
//                    let row = csv2[i]
//
//                    let data = TitleAlignment()
//                    data._id = i
//                    data.superTitle = row[0]
//                    data.mainTitle = row[1]
//                    data.subTitle = row[2]
//                    data.iconTitle = row[3]
//
//                    try! realm.write {
//                        realm.add(data)
//                    }
//                }
            }
        })
    }
    
    // * read CSV file and return [[String]]
    //
    // origin: system,life,basic,life cycle \n leaf,pitcher,shape,origin \n ...
    // return: [["system", "life", "basic", "life cycle"], ["leaf", "pitcher", "shape", "origin"], ...]
    //
    func getArrayFromCSV(csvFileName: String) -> [[String]] {
        var dataArray = [[String]]()
        if  let path = Bundle.main.path(forResource: csvFileName, ofType: "csv")
        {
            dataArray = []
            let url = URL(fileURLWithPath: path)
            do {
                let data = try Data(contentsOf: url)
                let dataEncoded = String(data: data, encoding: .utf8)
                if  let dataArr = dataEncoded?.components(separatedBy: "\r\n").map({ $0.components(separatedBy: ",") })
                {
                    for line in dataArr
                    {
                        dataArray.append(line)
                    }
                }
            }
            catch let jsonErr {
                print("\n Error read CSV file: \n ", jsonErr)
            }
        }
        return dataArray
    }
}
