//
//  application_helper.swift
//  nowPlaceTweetApp
//
//  Created by Satoru Murakami on 2017/03/07.
//  Copyright © 2017年 Satoru Murakami. All rights reserved.
//

import UIKit
import Material

func setup_backgroundcolor(viewcontroller:UIViewController) {
    viewcontroller.view.backgroundColor = Color.amber.lighten5
}

func setup_tabbar_views() -> [UIViewController] {
    var views:[UIViewController] = []
    let (locationview, musicview) = (ViewController(), musicViewController())
    
    (locationview.tabBarItem, musicview.tabBarItem) = (UITabBarItem(title: "Location", image: Icon.place, tag: 0), UITabBarItem(title: "Music", image: Icon.audio, tag: 1))
    
    views.append(contentsOf: [locationview, musicview])
    
    return views
}

func setup_navigationbar(viewcontroller:UIViewController) {
    viewcontroller.navigationController?.navigationBar.barTintColor = Color.grey.lighten3
    viewcontroller.navigationItem.leftBarButtonItem = UIBarButtonItem(image: Icon.menu, style: .plain, target: nil, action: nil)
}
