//
//  File.swift
//  nowPlaceTweetApp
//
//  Created by Satoru Murakami on 2017/02/27.
//  Copyright © 2017年 Satoru Murakami. All rights reserved.
//

import Foundation
import RealmSwift

class user:Object {
    dynamic var id = 0
    dynamic var name:String? = ""
    dynamic var login:Int = 1
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
