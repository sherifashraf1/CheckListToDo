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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addItemTextField.resignFirstResponder()
        return false
    }
    
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
