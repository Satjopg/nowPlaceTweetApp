//
//  userformViewController.swift
//  nowPlaceTweetApp
//
//  Created by Satoru Murakami on 2017/03/03.
//  Copyright © 2017年 Satoru Murakami. All rights reserved.
//

import UIKit
import Material
import TwitterKit

/// 初回起動時のみ表示される
class userformViewController: UIViewController {
    
    // 画面に表示される部品
    @IBOutlet weak var nameField: TextField!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var doneButton: FlatButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup_backgroundcolor(viewcontroller: self)
        startLabel_setup()
        namefieled_setup()
        doneButton_setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func startLabel_setup() {
        startLabel.font = RobotoFont.bold(with: 35)
        startLabel.textColor = Color.indigo.darken3
    }
    
    private func doneButton_setup() {
        doneButton.titleLabel?.font = RobotoFont.bold(with: 20)
        doneButton.layer.cornerRadius = 50.0
        doneButton.layer.masksToBounds = true
    }
    
    private func namefieled_setup() {
        nameField.isClearIconButtonEnabled = true
        let left = UIImageView()
        left.image = Icon.cm.pen
        nameField.leftView = left
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
