//
//  MasterTableViewController.swift
//  ToDo_2
//
//  Created by Debleena Sengupta on 10/16/16.
//  Copyright © 2016 Debleena Sengupta. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {

    var toDoItems:NSMutableArray = NSMutableArray()
    
    
    override func viewDidAppear(_ animated: Bool) {
        print ("in viewdidAppear")
        var userDefaults: UserDefaults = UserDefaults.standard
        var itemListFromUserDefaults: NSMutableArray? = userDefaults.object(forKey: "itemList") as? NSMutableArray
        if((itemListFromUserDefaults) != nil){
            print ("in if cond")
            toDoItems = itemListFromUserDefaults!
        }
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
//        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView?) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoItems.count
    }

    override func tableView(_ tableView: UITableView?, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView?.dequeueReusableCell(withIdentifier: "Cell", for: indexPath))! as UITableViewCell

        var toDoItem:NSDictionary = toDoItems.object(at: indexPath.row) as! NSDictionary
        cell.textLabel?.text = toDoItem.value(forKey: "ItemTitle") as? String
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        if ((segue != nil) && (segue.identifier == "showDetail")) {
            let detailViewController: DetailViewController = segue.destination as! DetailViewController
            let selectedIndexPath:NSIndexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
            detailViewController.toDoData = toDoItems.object(at:selectedIndexPath.row) as! NSDictionary
        }
        // Pass the selected object to the new view controller.
    }
    

}
