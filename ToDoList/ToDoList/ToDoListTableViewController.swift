//
//  ToDoListTableViewController.swift
//  ToDoList
//
//  Created by zachary radtka on 25/09/14.
//  Copyright (c) 2014 Zachary Radtka. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {

    /// An array of ToDoItem to display in the table
    var toDoItems: [ToDoItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

        // Load some data
        self.loadInitialData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: (UITableView!)) -> Int {

        // Return 1 sections to only display a single selection
        return 1
    }

    override func tableView(tableView: (UITableView!), numberOfRowsInSection section: Int) -> Int {

        // Return the number of items in the toDoItems Array
        return self.toDoItems.count
    }


    // Load the rows into the table
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("ListPrototypeCell", forIndexPath: indexPath) as UITableViewCell

        let toDoItem = toDoItems[indexPath.row]

        cell.textLabel?.text = toDoItem.itemName

        // Decide to place a checkmark in the cell
        if toDoItem.isCompleted {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }

        return cell
    }

    /*
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        // Configure the cell...

        return cell
    }
    */


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: (UITableView!), canEditRowAtIndexPath indexPath: (NSIndexPath!)) -> Bool {


        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */





    /// This method does things.
    /// Here are the steps you should follow to use this method
    ///
    /// 1. Prepare your thing
    /// 2. Tell all your friends about the thing.
    /// 3. Call this method to do the thing.
    ///
    /// Here are some bullet points to remember
    ///
    /// * Do it right
    /// * Do it now
    /// * Don't run with scissors (unless it's tuesday)
    ///
    /// :param: name The name of the thing you want to do
    /// :returns: a message telling you we did the thing
    func loadInitialData() {

        // Fake Data
        toDoItems.append(ToDoItem(name: "Grocery"))
        toDoItems.append(ToDoItem(name: "Foo"))
        toDoItems.append(ToDoItem(name: "Bar"))
        toDoItems.append(ToDoItem(name: "Baz"))
    }


    // Handle the event when a row is selected
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        // Deselect the row immediately
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        // Determine which cell was selected
        let tappedItem = self.toDoItems[indexPath.row]

        // Set the item state to the opposite of what it was set before
        tappedItem.isCompleted = !tappedItem.isCompleted

        // Ensure the row is reloaded into the table
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)

    }

    // Handle the unwind from the AddToDoItem view
    @IBAction func unwindToList(segue: UIStoryboardSegue) {

        // Get the source controller
        let source: AddToDoItemViewController  = segue.sourceViewController as AddToDoItemViewController

        // If the sources toDoItem is not nil, add it to the list
        if let item = source.toDoItem {
            self.toDoItems.append(item)
            self.tableView.reloadData()
        }
    }

}
