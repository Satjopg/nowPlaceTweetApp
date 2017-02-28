//
//  user_helper.swift
//  nowPlaceTweetApp
//
//  Created by Satoru Murakami on 2017/02/27.
//  Copyright © 2017年 Satoru Murakami. All rights reserved.
//

import Foundation

func create_id() -> String {
    // UUIDをハッシュ化(ハッシュ化と短縮を兼ねている)
    let hashids = Hashids(salt: NSUUID().uuidString)
    return hashids.encode(1,2,3)! as String
}
