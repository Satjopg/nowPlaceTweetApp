//
//  place_controller.swift
//  nowPlaceTweetApp
//
//  Created by Satoru Murakami on 2017/02/28.
//  Copyright © 2017年 Satoru Murakami. All rights reserved.
//

import Foundation
import RealmSwift

// place_historyモデルの値の変更などを取り扱う
class place_Controller{
    
    private let realm = try! Realm()

    func create(latitude:Double, longitude:Double) -> placehistory {
        let place_value:[String:Any] = ["id":create_id(), "latitude":latitude, "longitude":longitude, "time_stamp":get_date()]
        return placehistory(value: place_value)
    }

    func save(place_value:placehistory) {
        do {
            try! realm.write {
                realm.add(place_value, update: true)
            }
        }
    }
    
    /**
    - parameters:
        - column: 調べたいカラムを入力(id, latitude, longitude, time_stamp)
        - value: カラムに対する値(time_stampとかなら日付とか)
    - returns: valueが含まれたデータ全部(型がResult[placehistory])
    */
    func filter(column:String, value:Any) -> Results<placehistory> {
        return realm.objects(placehistory.self).filter(column, value).sorted(byKeyPath: column, ascending: true)
    }

    // idを割り振る.
    private func create_id() -> Int {
        return realm.objects(placehistory.self).count + 1
    }
    
    // 2017/02/28 11:22:05 のように返る
    // staticに対応するためにクラス内で定義
    private func get_date() -> String {
        let (now, formatter) = (NSDate(), DateFormatter())
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return formatter.string(from: now as Date)
    }
}
