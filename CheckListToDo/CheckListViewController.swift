//
//  ViewController.swift
//  CheckListToDo
//
//  Created by Sherif on 7/31/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItemCell", for: indexPath) as! CheckListItemCell
        //Note We can Use A viewWithTag() to access a label in the cell and any other comtrols or view with give them a tag......
        // In this case and ordinary wes use the Outlet

        if (indexPath.row % 5 == 0){
            cell.lblText.text = "Sherif"
        } else if(indexPath.row % 5 == 1){
            cell.lblText.text = "Ashraf"
        }else if(indexPath.row % 5 == 2){
            cell.lblText.text = "Hassan"
        }else if(indexPath.row % 5 == 3){
            cell.lblText.text = "Alsayed"
        }else if(indexPath.row % 5 == 4){
            cell.lblText.text = "Alaswad"
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        }else {
            cell?.accessoryType = .checkmark
        }
        tableView.reloadData()
    }
    
    
}
