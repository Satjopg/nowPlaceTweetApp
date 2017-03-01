//
//  place_controller.swift
//  nowPlaceTweetApp
//
//  Created by Satoru Murakami on 2017/02/28.
//  Copyright © 2017年 Satoru Murakami. All rights reserved.
//

import Foundation
import RealmSwift

// placeHistoryモデルの値を生成する.
func create(latitude:Double, longitude:Double) {
    let place_value = placehistory(value: ["id":Int(1), "latitude":latitude, "longitude":longitude])

}

func save() {
    
}

// idを割り振る.
private func create_id() {
    
}
