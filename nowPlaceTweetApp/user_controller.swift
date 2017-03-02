//
//  user_helper.swift
//  nowPlaceTweetApp
//
//  Created by Satoru Murakami on 2017/02/27.
//  Copyright © 2017年 Satoru Murakami. All rights reserved.
//

import Foundation
import RealmSwift

class user_Controller {
    
    static func create() -> user {
        let controller = user_Controller()
        let user_value:[String:Any] = ["id":create_id(controller)(), "login_count":Int(1), "login_date":get_date(controller)()]
        return user(value: user_value)
    }
    
    static func save(user_value:user) {
        do {
            let realm = try! Realm()
            try! realm.write {
                realm.add(user_value, update: true)
            }
        }
    }
    
    static func update_date(id:String) {
        let realm = try! Realm()
        let controller = user_Controller()
        if let user_value = realm.object(ofType: user.self, forPrimaryKey: id) {
            user_value.login_date = get_date(controller)()
            do{
                try! realm.write {
                    realm.add(user_value, update: true)
                }
            }
        }else{
            return
        }
    }
    
    // IDを割り振る(UUIDの利用)
    private func create_id() -> String {
        let hashids = Hashids(salt: NSUUID().uuidString)
        return hashids.encode(1,2,3)! as String
    }
    
    // 2017/02/28 11:22:05 のように返る
    // staticに対応するためにクラス内で定義
    private func get_date() -> String {
        let (now, formatter) = (NSDate(), DateFormatter())
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return formatter.string(from: now as Date)
    }
}
