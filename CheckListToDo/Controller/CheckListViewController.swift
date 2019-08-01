//
//  ViewController.swift
//  CheckListToDo
//
//  Created by Sherif on 7/31/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {

    var items : [CheckListItem]
    
    
    
    required init?(coder aDecoder: NSCoder) {
        items = [CheckListItem]()
        
        let row0Item = CheckListItem()
        row0Item.text = "Walk the dog"
        row0Item.checked = true
        items.append(row0Item)
        
        let row1Item = CheckListItem()
        row1Item.text = "Brush teeth"
        row1Item.checked = true
        items.append(row1Item)
        
        let row2Item = CheckListItem()
        row2Item.text = "Learn iOS development"
        row2Item.checked = true
        items.append(row2Item)
        
        let row3Item = CheckListItem()
        row3Item.text = "Soccer practice"
        row3Item.checked = true
        items.append(row3Item)
        
        let row4Item = CheckListItem()
        row4Item.text = "Eat ice cream"
        row4Item.checked = true
        items.append(row4Item)
        
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItemCell", for: indexPath) as! CheckListItemCell
        //Note We can Use A viewWithTag() to access a label in the cell and any other comtrols or view with give them a tag......
        // In this case and ordinary wes use the Outlet

        let item = items[indexPath.row]
        cell.lblText.text = item.text
        configureCheckMark(for: cell, at: indexPath)
        return cell
    }
    
    func configureCheckMark(for cell : UITableViewCell , at indexpath : IndexPath){
        
        var item = items[indexpath.row]
        if item.checked{
            cell.accessoryType = .none
        }else{
            cell.accessoryType = .checkmark
        }
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
        let item = items[indexPath.row]
        item.checked = !item.checked
        configureCheckMark(for: cell, at: indexPath)

        tableView.deselectRow(at: indexPath, animated: true)
        //tableView.reloadData()
    }
    }
    
}
