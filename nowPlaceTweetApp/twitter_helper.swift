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
        keep = false
        if !granted {
            print("error: Not granted.")
            return
        }
        if error != nil {
            print("error: \(error)")
            return
        }
        accounts = accountStore.accounts(with: accountType) as! [ACAccount]
    }
    
    let runloop = RunLoop.current
    while keep && runloop.run(mode: RunLoopMode.defaultRunLoopMode, before: NSDate(timeIntervalSinceNow: 0.1) as Date) {
        //        0.1秒ごとに変数チェック
        //        response処理待ち
    }
    get_twitter_account_info(user:accounts[0])
    return accounts
}

// アカウントの情報を取得する
func get_twitter_account_info(user:ACAccount) {
    let URL = NSURL(string:"https://api.twitter.com/1.1/users/show.json")
    let params = ["screen_name":user.username]
    
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
        let data = JSON(responsedata!)
        print(data)
    })
}
