//
//  CheckListItem.swift
//  CheckListToDo
//
//  Created by Sherif on 8/1/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import Foundation
class CheckListItem : NSObject{
    var text = ""
    var checked = false
    
    func toggleCheck() {
        checked = !checked
    }
    
}
