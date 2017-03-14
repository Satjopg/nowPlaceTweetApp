//
//  twitter_helper.swift
//  nowPlaceTweetApp
//
//  Created by Satoru Murakami on 2017/03/13.
//  Copyright © 2017年 Satoru Murakami. All rights reserved.
//

import Foundation
import Accounts
import Social
import SwiftyJSON


// Twitterのアカウントを取得するよ(デバイス内に登録されたもののみ)
func get_twitter_account() -> [ACAccount] {
    
    //　変数などの宣言
    let accountStore = ACAccountStore()
    let accountType = accountStore.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierTwitter)
    var accounts:[ACAccount]!
    var keep:Bool = true
    
    // アカウント取得
    accountStore.requestAccessToAccounts(with: accountType, options: nil) { granted, error in
        if !granted {
            print("error: Not granted.")
            return
        }
        if error != nil {
            print("error: \(error)")
            return
        }
        accounts = accountStore.accounts(with: accountType) as! [ACAccount]
        keep = false
    }
    
    let runloop = RunLoop.current
    while keep && runloop.run(mode: RunLoopMode.defaultRunLoopMode, before: NSDate(timeIntervalSinceNow: 0.1) as Date) {
        //        0.1秒ごとに変数チェック
        //        response処理待ち
    }
    return accounts
}

/**
- parameters:
    - user: アイコンを手に入れたいユーザ情報(Accountsフレームワークで定義されたACAccount型)
- returns: アイコンのURL(URL型)

AlamofireImageを用いて表示するためのURLを取得する
*/
func get_twitter_profile_icon(user:ACAccount) -> URL {
    let URL = NSURL(string:"https://api.twitter.com/1.1/users/show.json")
    let params = ["screen_name":user.username]
    var keep:Bool = true
    var profile_url:URL!

    let request = SLRequest(forServiceType: SLServiceTypeTwitter,
                            requestMethod: .GET,
                            url: URL as URL!,
                            parameters: params)
    request?.account = user
    
    request?.perform(handler: { (responsedata, urlresponse, error) in
        if error != nil {
            print("error:\(error)")
            return
        }
        // 取得したデータからアイコン画像のURLを取得する.
        let original_url = String(describing:JSON(responsedata!)["profile_image_url_https"])
        let bigger_url = original_url.replacingOccurrences(of: "_normal", with: "_bigger")
        profile_url = NSURL(string: bigger_url) as! URL
        keep = false
    })
    
    let runloop = RunLoop.current
    while keep && runloop.run(mode: RunLoopMode.defaultRunLoopMode, before: NSDate(timeIntervalSinceNow: 0.1) as Date) {
        //        0.1秒ごとに変数チェック
        //        response処理待ち
    }

    return profile_url
}

func tweet(user:ACAccount, tweet:String) {
    let (tweet_url, params) = (URL(string: "https://api.twitter.com/1.1/statuses/update.json"), ["status":tweet])
    let tweet_request = SLRequest(forServiceType: SLServiceTypeTwitter,
                                  requestMethod: .POST,
                                  url: tweet_url,
                                  parameters: params)
    tweet_request?.account = user
    
    tweet_request?.perform(handler: { (responsedata, urlresponse, error) in
        if error != nil {
            print("error:\(error)")
            return
        }
        print(JSON(responsedata!))
    })
}
