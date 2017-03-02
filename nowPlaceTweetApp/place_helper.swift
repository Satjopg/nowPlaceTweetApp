//
//  place_helper.swift
//  nowPlaceTweetApp
//
//  Created by Satoru Murakami on 2017/02/28.
//  Copyright © 2017年 Satoru Murakami. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

// YOLPの場所情報APIを使って現在地付近のランドマークを調べて返す.
func get_place_info(latitude:Double, longitude:Double) {
    
    // APIKEYとパラメータの設定
    let env = ProcessInfo.processInfo.environment
    let MY_API_KEY:String = env["YAHOO_API_KEY"]! as String
    let parameters:Parameters = [
        "appid":MY_API_KEY,
        "lat":Float(latitude),
        "lon":Float(longitude)
    ]
    
    //　リクエスト送信とレスポンスの値からスコアが最も高いもののみ抽出
    Alamofire.request("https://map.yahooapis.jp/placeinfo/V1/get", parameters:parameters, encoding:URLEncoding.default)
        .responseJSON { response in
            guard let object = response.result.value else {
                return
            }
            
            let response_json = JSON(object)["ResultSet"]["Result"]
            print(response_json)
            
    }
}
