//
//  musicViewController.swift
//  nowPlaceTweetApp
//
//  Created by Satoru Murakami on 2017/03/07.
//  Copyright © 2017年 Satoru Murakami. All rights reserved.
//

import UIKit
import Material
import Accounts
import AlamofireImage

class musicViewController: UIViewController {

    @IBOutlet weak var twitter_icon: UIImageView!
    @IBOutlet weak var tweet_label: UILabel!
    @IBOutlet weak var tweet_edit_view: UITextView!
    
    var account:ACAccount!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup_navigationbar(viewcontroller: self)
        setup_backgroundcolor(viewcontroller: self)
        self.tabBarItem = UITabBarItem(title: "Music", image: Icon.audio, tag: 1)
        
        tweet_edit_view.text = "now playing music: The Day #nowplaying"
        tweet_edit_view.layer.borderColor = Color.indigo.darken3.cgColor
        tweet_edit_view.layer.borderWidth = 2.0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
