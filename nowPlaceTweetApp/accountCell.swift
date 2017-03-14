//
//  accountCell.swift
//  nowPlaceTweetApp
//
//  Created by Satoru Murakami on 2017/03/14.
//  Copyright © 2017年 Satoru Murakami. All rights reserved.
//

import UIKit
import Material
import AlamofireImage

class accountCell: UITableViewCell {

    @IBOutlet weak var profile_image: UIImageView!
    @IBOutlet weak var name_label: UILabel!
    @IBOutlet weak var screenname_Label: UILabel!
    
    func setup(name:String, screenname:String, profile_icon_url:URL) {
        name_label.textColor = Color.indigo.darken3
        name_label.text = name
        screenname_Label.text = "@"+screenname
        profile_image.af_setImage(withURL: profile_icon_url)
        profile_image.layer.cornerRadius = 10.0
        profile_image.layer.masksToBounds = true
        self.backgroundColor = Color.amber.lighten5
    }
}
