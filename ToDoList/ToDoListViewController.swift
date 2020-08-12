//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by Brandan Kalsow on 8/12/20.
//  Copyright © 2020 Virgin Pulse. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    let itemArray = ["Buy 2020 Megatin", "Win Locals", "Ban Block Dragon", "Ban Eldlich the Golden Lord"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }

}

