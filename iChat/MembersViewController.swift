//
//  MembersViewController.swift
//  iChat
//
//  Created by Aleksandar Popovic on 1/23/19.
//  Copyright © 2019 Aleksandar Popovic. All rights reserved.
//

import UIKit

class MembersViewController: UITableViewController {

    var members: [Member] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(membersChanged), name: .MembersChanged, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func membersChanged(notification: Notification) {
        
        guard let newMembers = notification.object as? [Member] else { return }
        
        self.members = newMembers
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return members.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = members[indexPath.row].name
        return cell
    }

}
