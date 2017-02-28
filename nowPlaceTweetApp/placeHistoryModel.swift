//
//  placeHistoryModel.swift
//  nowPlaceTweetApp
//
//  Created by Satoru Murakami on 2017/02/22.
//  Copyright © 2017年 Satoru Murakami. All rights reserved.
//

import Foundation
import RealmSwift

// 位置情報を保存するモデル.
class placehistory:Object {
    dynamic var id:Int = 0
    dynamic var latitude:Double = 0.0
    dynamic var longitude:Double = 0.0
    dynamic var time_stamp:String = ""
}
