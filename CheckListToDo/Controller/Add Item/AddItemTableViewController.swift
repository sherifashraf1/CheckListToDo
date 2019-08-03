//
//  AddItemTableViewController.swift
//  CheckListToDo
//
//  Created by Sherif on 8/2/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate : class {
    func addItemViewControllerDidCancel(_ controller : AddItemTableViewController)
    func addItemViewController(_ controller :  AddItemTableViewController , didFinishAdding item : CheckListItem)
    func addItemViewController(_ controller :  AddItemTableViewController , didFinishEditing item : CheckListItem)
    
}
class AddItemTableViewController: UITableViewController , UITextFieldDelegate{
    
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var addItemTextField: UITextField!
    weak var delegate : AddItemViewControllerDelegate?
    var itemToEdit : CheckListItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        addItemTextField.delegate = self
        
        if let itemToEdit = itemToEdit{
            title = "Edit Item"
            addItemTextField.text = itemToEdit.text
            doneBarButton.isEnabled = true
        }
        
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
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done(){
        if let itemToEdit = itemToEdit {
            itemToEdit.text = addItemTextField.text!
            delegate?.addItemViewController(self, didFinishEditing: itemToEdit)
        } else {
            let item = CheckListItem()
            item.text = addItemTextField.text!
            item.checked = true
            delegate?.addItemViewController(self, didFinishAdding: item)
        }
    }
    // this function to disable the selection of the cell
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    
    // this below function allows us to copy and paste and update the textfield
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = addItemTextField.text
        let textRange = Range(range, in: oldText!)
        let newText = oldText?.replacingCharacters(in: textRange!, with: string)
        
        if newText!.isEmpty{
            doneBarButton.isEnabled = false
        }else {
            doneBarButton.isEnabled = true
        }
        
        return true
    }
    
    
}
