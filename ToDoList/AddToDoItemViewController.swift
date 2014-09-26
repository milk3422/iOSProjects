//
//  AddToDoItemViewController.swift
//  ToDoList
//
//  Created by zachary radtka on 25/09/14.
//  Copyright (c) 2014 Zachary Radtka. All rights reserved.
//

import UIKit

class AddToDoItemViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!

    var toDoItem: ToDoItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Prepare for the segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        // If the done button was not pressed, do nothing
        if sender as? UIBarButtonItem != self.doneButton { return }


        // If the text field has text create a ToDoItem to get added to the list
        if !self.textField.text.isEmpty {
            self.toDoItem = ToDoItem(name: self.textField.text)
        }
    }

}
