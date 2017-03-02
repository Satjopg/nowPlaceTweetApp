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
    
    private let realm = try! Realm()
    
    func create() -> user {
        let user_value:[String:Any] = ["id":get_id(), "login_count":Int(1), "login_date":get_date()]
        return user(value: user_value)
    }
    
    func save(user_value:user) {
        do {
            try! realm.write {
                realm.add(user_value, update: true)
            }
        }
    }
    
    /**
     
     指定したIDのuserがログインした日時を更新する
     
     - parameters:
        - id: userに割り振ったID(UUID->Hashids)
     
     */
    func update_date(id:String) {
        if let user_value = realm.object(ofType: user.self, forPrimaryKey: id) {
            user_value.login_date = get_date()
            do{
                try! realm.write {
                    realm.add(user_value, update: true)
                }
            }
        }else{
            return
        }
    }
    
    /**
     
    指定したIDのuserが登録されているかを返すメソッド
     
    - parameters:
        - id: userに割り振ったID(UUID)
    - returns: 存在 -> T いない -> F
    */
    func exist_user() -> Bool {
        if realm.object(ofType: user.self, forPrimaryKey: get_id()) != nil {
            return true
        }else{
            return false
        }
    }
    
    // IDの取得(作り出しているわけではないのでgetと命名)
    private func get_id() -> String {
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
