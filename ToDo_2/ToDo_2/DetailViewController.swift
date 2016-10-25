//
//  DetailViewController.swift
//  To-Do List
//
//  Created by Hope Ludwinski on 10/16/16.
//  Copyright © 2016 Hope Ludwinski. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    
    var toDoData:NSDictionary = NSDictionary()
    var countComplete = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField?.isUserInteractionEnabled = false
        notesTextView?.isUserInteractionEnabled = false
        
        titleTextField?.text = toDoData.object(forKey: "ItemTitle") as! String?
        notesTextView?.text = toDoData.object(forKey: "ItemNote") as! String?
        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteItem(_ sender: AnyObject) {
        print("in delete")
        //retrieve values
        let userDefaults:UserDefaults = UserDefaults.standard
        let itemListArray:NSMutableArray? = userDefaults.object(forKey: "itemList") as? NSMutableArray
        let mutableItemList:NSMutableArray = NSMutableArray()
        
        //need to do this so we can edit the global list since user defaults not mutible
        if ((itemListArray) != nil){
            for dict:Any in itemListArray! {
                mutableItemList.add(dict as! NSDictionary)
            }
        }
        //remove item we just opened
        mutableItemList.remove(toDoData)
        //remove from global list
        userDefaults.removeObject(forKey: "itemList")
        //reset global list to this new edited list
        userDefaults.set(mutableItemList, forKey: "itemList")
        userDefaults.synchronize()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func markComplete(_ sender: AnyObject) {
        let userDefaults:UserDefaults = UserDefaults.standard
        let itemListArray:NSMutableArray? = userDefaults.object(forKey: "itemList") as? NSMutableArray
        let mutableItemList:NSMutableArray = NSMutableArray()
        
        //need to do this so we can edit the global list since user defaults not mutible
        if ((itemListArray) != nil){
            for dict:Any in itemListArray! {
                mutableItemList.add(dict as! NSDictionary)
            }
        }
        //remove item we just opened
        mutableItemList.remove(toDoData)
        //remove from global list
        userDefaults.removeObject(forKey: "itemList")
        //reset global list to this new edited list
        userDefaults.set(mutableItemList, forKey: "itemList")
        userDefaults.synchronize()
        self.navigationController?.popToRootViewController(animated: true)
        
        countComplete = countComplete + 1
        print(countComplete)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

