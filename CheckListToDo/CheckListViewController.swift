//
//  ViewController.swift
//  CheckListToDo
//
//  Created by Sherif on 7/31/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {

    let row0Text = "Walk the dog"
    let row1Text = "Brush teeth"
    let row2Text = "Learn iOS development"
    let row3Text = "Soccer practice"
    let row4Text = "Eat ice cream"
    
    var row0Checked = true
    var row1Checked = true
    var row2Checked = true
    var row3Checked = true
    var row4Checked = true
    
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
            cell.lblText.text = row0Text
        }else if (indexPath.row  == 1){
            cell.lblText.text = row1Text
        }else if (indexPath.row  == 2){
            cell.lblText.text = row2Text
        }else if (indexPath.row  == 3){
            cell.lblText.text = row3Text
        }else if (indexPath.row  == 4){
            cell.lblText.text = row4Text
        }
        
        configureCheckMark(for: cell, at: indexPath)
        return cell
    }
    
    func configureCheckMark(for cell : UITableViewCell , at indexpath : IndexPath){
        var isChecked = false
        
        if indexpath.row == 0{
            row0Checked = !row0Checked
            isChecked = row0Checked
        }
        if indexpath.row == 1{
            row1Checked = !row1Checked
            isChecked = row1Checked
        }
        if indexpath.row == 2{
            row2Checked = !row2Checked
            isChecked = row2Checked
        }
        if indexpath.row == 3{
            row3Checked = !row3Checked
            isChecked = row3Checked
        }
        if indexpath.row == 4{
            row4Checked = !row4Checked
            isChecked = row4Checked
        }
        
        if isChecked{
            cell.accessoryType = .none
        }else{
            cell.accessoryType = .checkmark
        }
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        configureCheckMark(for: cell!, at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        //tableView.reloadData()
    }
    
    
}
