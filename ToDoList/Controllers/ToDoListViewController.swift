//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by Brandan Kalsow on 8/12/20.
//  Copyright © 2020 Virgin Pulse. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let newItem = Item()
        newItem.title = "Buy 2020 Mega Tin"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Summmon Dragun of Red-Eyes"

        /** if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
            itemArray = items
        } */
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
       
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        //load whether item is done or not
        
        if item.done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       //toggle done property of current item
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        //reload changes to dadta
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
       
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What happens once user clicks add item
            //Creates a new Item object & appends it to the array
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            //Updates the array in persisted memory
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            //reloads the UI with the new element
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}

