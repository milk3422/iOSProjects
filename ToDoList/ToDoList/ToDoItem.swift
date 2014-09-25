//
//  ToDoItem.swift
//  ToDoList
//
//  Created by zachary radtka on 25/09/14.
//  Copyright (c) 2014 Zachary Radtka. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    var itemName: String
    var isCompleted: Bool = false

//    var creationDate: NSDate

    init(name: String) {
        self.itemName = name

    }
   
}
