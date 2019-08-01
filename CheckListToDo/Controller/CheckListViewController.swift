//
//  ViewController.swift
//  CheckListToDo
//
//  Created by Sherif on 7/31/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {

    var row0Item : CheckListItem
    var row1Item : CheckListItem
    var row2Item : CheckListItem
    var row3Item : CheckListItem
    var row4Item : CheckListItem
    
    
    required init?(coder aDecoder: NSCoder) {
        row0Item = CheckListItem()
        row0Item.text = "Walk the dog"
        row0Item.checked = true
        
        row1Item = CheckListItem()
        row1Item.text = "Brush teeth"
        row1Item.checked = true
        
        row2Item = CheckListItem()
        row2Item.text = "Learn iOS development"
        row2Item.checked = true
        
        row3Item = CheckListItem()
        row3Item.text = "Soccer practice"
        row3Item.checked = true
        
        row4Item = CheckListItem()
        row4Item.text = "Eat ice cream"
        row4Item.checked = true
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

        if (indexPath.row  == 0){
            cell.lblText.text = row0Item.text
        }else if (indexPath.row  == 1){
            cell.lblText.text = row1Item.text
        }else if (indexPath.row  == 2){
            cell.lblText.text = row2Item.text
        }else if (indexPath.row  == 3){
            cell.lblText.text = row3Item.text
        }else if (indexPath.row  == 4){
            cell.lblText.text = row4Item.text
        }
        
        configureCheckMark(for: cell, at: indexPath)
        return cell
    }
    
    func configureCheckMark(for cell : UITableViewCell , at indexpath : IndexPath){
        var isChecked = false
        
        if indexpath.row == 0{
            row0Item.checked = !row0Item.checked
            isChecked = row0Item.checked
        }else if indexpath.row == 1{
            row1Item.checked = !row1Item.checked
            isChecked = row1Item.checked
        }else if indexpath.row == 2{
            row2Item.checked = !row2Item.checked
            isChecked = row2Item.checked
        }else if indexpath.row == 3{
            row3Item.checked = !row3Item.checked
            isChecked = row3Item.checked
        }else if indexpath.row == 4{
            row4Item.checked = !row4Item.checked
            isChecked = row4Item.checked
        }
        
        if isChecked{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        configureCheckMark(for: cell!, at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        //tableView.reloadData()
    }
    
    
}
