//
//  ViewController.swift
//  nowPlaceTweetApp
//
//  Created by Satoru Murakami on 2017/02/17.
//  Copyright © 2017年 Satoru Murakami. All rights reserved.
//

import UIKit
import CoreLocation
import RealmSwift
import Material

class ViewController: UIViewController, CLLocationManagerDelegate{
    
    var myLocationManager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup_navigationbar(viewcontroller: self)
        setup_backgroundcolor(viewcontroller: self)
        
        // Realmのファイルが保存される場所を表示しておかないと大変ですぜ
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        self.tabBarItem = UITabBarItem(title: "Location", image: Icon.place, tag: 0)

        /*
        // 位置情報取得の許可が取れているかを確認
        let status = CLLocationManager.authorizationStatus()
        if status == CLAuthorizationStatus.restricted || status == CLAuthorizationStatus.denied {
            return
        }
        
        myLocationManager = CLLocationManager()
        myLocationManager.delegate = self
        
        if status == CLAuthorizationStatus.notDetermined {
            myLocationManager.requestAlwaysAuthorization()
        }
        
        if !CLLocationManager.locationServicesEnabled() {
            return
        }
        
        myLocationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        myLocationManager.distanceFilter = 100
        
        myLocationManager.startUpdatingLocation()
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 位置情報取得成功時に呼ばれます
    func locationManager(_ manager: CLLocationManager,didUpdateLocations locations: [CLLocation]){
        let lat:Double = (manager.location?.coordinate.latitude)!
        let log:Double = (manager.location?.coordinate.longitude)!
        print("緯度：\(lat)")
        print("経度：\(log)")
        myLocationManager.stopUpdatingLocation()
        get_place_info(latitude: lat, longitude: log)
    }
    
    // 位置情報取得失敗時に呼ばれます
    func locationManager(_ manager: CLLocationManager,didFailWithError error: Error){
        print("error")
    }


}
