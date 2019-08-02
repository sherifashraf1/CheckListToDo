//
//  AddItemTableViewController.swift
//  CheckListToDo
//
//  Created by Sherif on 8/2/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController , UITextFieldDelegate{
    
    @IBOutlet weak var addItemTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        addItemTextField.delegate = self
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        // press on Done Key that dismiss the keyboard and remove the textField form its become first responder....
//        addItemTextField.resignFirstResponder()
//        return false
//
//        //resigning the first responder status is one way to close textfield keyboard...
//    }

    // we can substitue this above method by add a control events by add Did End On Exit event to the done method to make to same functionalty of add button when we press on return or Done key on keyboard
    
    
    override func viewWillAppear(_ animated: Bool) {
        addItemTextField.becomeFirstResponder()
        addItemTextField.returnKeyType = .done
        
    }
    
    @IBAction func cancel(){
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(){
        navigationController?.popViewController(animated: true)
        print("Contents of the textField is \(addItemTextField.text!)")
    }
    
    // this function to disable the selection of the cell
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
}
