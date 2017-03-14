//
//  accountViewController.swift
//  nowPlaceTweetApp
//
//  Created by Satoru Murakami on 2017/03/14.
//  Copyright © 2017年 Satoru Murakami. All rights reserved.
//

import UIKit
import Accounts
import Material

class accountViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var accountTable: UITableView!
    var twitter_accounts:[ACAccount]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accountTable.backgroundColor = Color.amber.lighten5
        twitter_accounts = get_twitter_account()
        setup_table()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 生成するcellの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return twitter_accounts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = accountTable.dequeueReusableCell(withIdentifier: "accountCell", for: indexPath) as! accountCell
        let account_data = twitter_accounts[indexPath.row]
        cell.setup(name: account_data.userFullName, screenname: account_data.username, profile_icon_url: get_twitter_profile_icon(user: account_data))
        return cell
    }
    
    private func setup_table() {
        accountTable.estimatedRowHeight = 10000
        accountTable.rowHeight = UITableViewAutomaticDimension
        accountTable.register(accountCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TotabviewSegue" {
            let select_index = accountTable.indexPathForSelectedRow?.item
            let account:ACAccount = twitter_accounts[select_index!]
        }
    }

}
