//
//  color_helper.swift
//  nowPlaceTweetApp
//
//  Created by Satoru Murakami on 2017/02/17.
//  Copyright © 2017年 Satoru Murakami. All rights reserved.
//

import UIKit

/**
 カラーコードをUIColorの値に変換する.
 
 - parameter hex: カラーコード(例:#000000)
 
 - returns: UIColorへの変換値
 */
func rgb_change_uicolor(_ hex:String) -> UIColor {
    
    let cString = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
    
    if ((cString as String).characters.count != 6) {
        return UIColor.gray
    }
    
    let rString = (cString as NSString).substring(with: NSRange(location: 0, length: 2))
    let gString = (cString as NSString).substring(with: NSRange(location: 2, length: 2))
    let bString = (cString as NSString).substring(with: NSRange(location: 4, length: 2))
    
    var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
    Scanner(string: rString).scanHexInt32(&r)
    Scanner(string: gString).scanHexInt32(&g)
    Scanner(string: bString).scanHexInt32(&b)
    
    return UIColor(
        red: CGFloat(Float(r) / 255.0),
        green: CGFloat(Float(g) / 255.0),
        blue: CGFloat(Float(b) / 255.0),
        alpha: CGFloat(Float(1.0))
    )
    
}
