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
    
    //    @IBAction func addRow(_ sender: Any) {
    //
    //        let newRowIndex = items.count
    //        let item = CheckListItem()
    //
    //        var titles = ["Sherif Ashraf Hassan" , "Osama Ahmed Osman" , "iOS Development" , "IDEA" , "Amr Diab"]
    //
    //        let randomNumber = arc4random_uniform(UInt32(titles.count))
    //        let title = titles[Int(randomNumber)]
    //        item.text = title
    //        item.checked = true
    //        items.append(item)
    //        let indexPath = IndexPath(row: newRowIndex, section: 0)
    //        let indexPathes = [indexPath]
    //        tableView.insertRows(at: indexPathes, with: .automatic)
    //
    //    }
    
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem" {
            let controller = segue.destination as! ItemDetailViewController
            controller.delegate = self
        } else if segue.identifier == "EditItem" {
            let controller = segue.destination as! ItemDetailViewController
            controller.delegate = self
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell){
            controller.itemToEdit = items[indexPath.row]
        }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Note We can Use A viewWithTag() to access a label in the cell and any other comtrols or view with give them a tag......
        // In this case and ordinary wes use the Outlet
        //
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItemCell", for: indexPath) as! CheckListItemCell
        //        let item = items[indexPath.row]
        //        cell.lblText.text = item.text
        //        configureCheckMark(for: cell, at: item)
        //        return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItemCell", for: indexPath)
        let item = items[indexPath.row]
        configureText(for: cell, at: item)
        configureCheckMark(for: cell, at: item)
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // first we remove from the model (update the model)
        items.remove(at: indexPath.row)
        // second show to user the row has been deleted (update the tableview)
        //        let indexPaths = [indexPath]
        //        tableView.deleteRows(at: indexPaths, with: .automatic)
        
        tableView.reloadData()
    }
    
    func configureText(for cell : UITableViewCell , at item : CheckListItem){
        
        let label = cell.viewWithTag(2) as! UILabel
        label.text = item.text
    }
    
    func configureCheckMark(for cell : UITableViewCell , at item : CheckListItem){
        
        let label = cell.viewWithTag(1) as! UILabel
        if item.checked{
            label.text = ""
        }else{
            label.text = "√"
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            let item = items[indexPath.row]
            item.toggleCheck()
            configureCheckMark(for: cell, at: item)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

extension CheckListViewController : ItemDetailViewControllerDelegate {
    func ItemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func ItemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: CheckListItem) {
        if let index = items.index(of: item){
        let indexPath = IndexPath(row: index, section: 0)
        if let cell = tableView.cellForRow(at: indexPath){
            configureText(for: cell, at: item)
        }
            navigationController?.popViewController(animated: true)
    }
    }
    //updates our tableViewController
    func ItemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: CheckListItem) {
        let newRowIndex = items.count
        items.append(item)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPathes = [indexPath]
        tableView.insertRows(at: indexPathes, with: .automatic)
        navigationController?.popViewController(animated: true)
        
    }
    
}
