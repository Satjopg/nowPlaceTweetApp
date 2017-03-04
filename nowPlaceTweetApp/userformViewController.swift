//
//  userformViewController.swift
//  nowPlaceTweetApp
//
//  Created by Satoru Murakami on 2017/03/03.
//  Copyright © 2017年 Satoru Murakami. All rights reserved.
//

import UIKit
import Material

class userformViewController: UIViewController {
    
    @IBOutlet weak var nameField: TextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.isClearIconButtonEnabled = true
        
        let left = UIImageView()
        left.image = Icon.cm.pen
        nameField.leftView = left

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
