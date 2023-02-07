//
//  conn.swift
//  newNotitle1
//
//  Created by 정은후 on 2020/11/26.
//  Copyright © 2020 정은후. All rights reserved.
//

import Foundation
import RealmSwift

fileprivate struct connConstants {
    fileprivate static let app = App(id: "plantarium_0-ehqdt")
    fileprivate static let email = "kennethj@naver.com"
    fileprivate static let password = "dmsgn7eh"
    fileprivate static let partition = "plantarium"
    fileprivate static let syncCredentials = Credentials.emailPassword(email: email, password: password)
}

extension Realm {
    static func AT_remoteRealm(callback: @escaping (Result<Realm, Swift.Error>) -> Void) {
        connConstants.app.login(credentials: connConstants.syncCredentials) { (result) in
            switch result {
            case .failure(let error):
                print("Login failed: \(error.localizedDescription)")
            case .success(let user):
                Realm.Configuration.defaultConfiguration = user.configuration(partitionValue: connConstants.partition)
                Realm.asyncOpen(callback: callback)
                print(Realm.Configuration.defaultConfiguration.fileURL!)
            }
        }
    }
}
