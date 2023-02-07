//
//  connObjects.swift
//  newNotitle1
//
//  Created by 정은후 on 2020/12/28.
//Copyright © 2020 정은후. All rights reserved.
//

import Foundation
import RealmSwift

class TitleAlignment: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var superTitle: String? = ""
    @objc dynamic var mainTitle: String? = ""
    @objc dynamic var subTitle: String? = ""
    @objc dynamic var iconTitle: String? = ""
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}

class Title: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var _plant: String? = ""
    @objc dynamic var superTitle: String? = ""
    @objc dynamic var mainTitle: String? = ""
    @objc dynamic var subTitle: String? = ""
    @objc dynamic var iconTitle: String? = ""
    @objc dynamic var aData: String? = ""
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}

class Nomenclature: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var _plant: String = ""
    @objc dynamic var order: String? = ""
    @objc dynamic var family: String? = ""
    @objc dynamic var sub_family: String? = ""
    @objc dynamic var tribe: String? = ""
    @objc dynamic var genus: String? = ""
    @objc dynamic var sub_genus: String? = ""
    @objc dynamic var section: String? = ""
    @objc dynamic var hybrid_1st: String? = ""
    @objc dynamic var hybrid_2nd: String? = ""
    @objc dynamic var hybrid_fin: String? = ""
    @objc dynamic var species: String? = ""
    @objc dynamic var sub_species: String? = ""
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}

class PlantName: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var _plant: String = ""
    @objc dynamic var language: String? = ""
    @objc dynamic var name: String? = ""
    let isMain = RealmOptional<Bool>()
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}

class IUCN: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var _plant: String = ""
    @objc dynamic var IUCN: String = ""
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}

class Distribution: Object {
    @objc dynamic var _id: Int = 0
    @objc dynamic var _plant: String = ""
    @objc dynamic var country: String = ""
    @objc dynamic var region: String? = ""
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}

//    override static func primaryKey() -> String? {
//        return "id"
//    }

//func setDateKST() -> String {
//    let date = Date()
//    let dateFormatter = DateFormatter()
//    dateFormatter.locale = Locale(identifier: "ko_kr")
//    dateFormatter.timeZone = TimeZone(abbreviation: "KST")
//    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//    let dateString = dateFormatter.string(from: date)
//    return dateString
//}
