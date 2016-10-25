//
//  AddViewController.swift
//  ToDo_2
//
//  Created by Debleena Sengupta on 10/16/16.
//  Copyright © 2016 Debleena Sengupta. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField! = UITextField()
    @IBOutlet weak var notesTextView: UITextView! = UITextView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTapped(_ sender: AnyObject) {
        let userDefaults:UserDefaults = UserDefaults.standard
//        userDefaults.removeObject(forKey: "itemList")
        
        var itemList:NSMutableArray? = (userDefaults.object(forKey: "itemList") as? NSMutableArray?)!
        let dataSet:NSMutableDictionary = NSMutableDictionary()
        
        dataSet.setValue(titleTextField.text, forKey: "ItemTitle")
        dataSet.setValue(notesTextView.text, forKey: "ItemNote")
        
        if((itemList) != nil){
            print ("in if")
            let newMutableList:NSMutableArray = NSMutableArray()
            newMutableList.add(dataSet)
            for dict in itemList! {
                newMutableList.add(dict as! NSDictionary)
            }
            userDefaults.removeObject(forKey: "itemList")
            userDefaults.setValue(newMutableList, forKey: "itemList")
        }else{
            print ("in else")
            userDefaults.removeObject(forKey: "itemList")
            itemList = NSMutableArray()
            itemList!.add(dataSet)
            userDefaults.setValue(itemList, forKey: "itemList")
        }
        userDefaults.synchronize()
        self.navigationController?.popToRootViewController(animated: true)
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
