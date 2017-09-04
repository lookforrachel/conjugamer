//
//  OptionsVerbsTableViewController.swift
//  jsonToCoreData
//
//  Created by Rachel Yee on 8/31/17.
//  Copyright © 2017 Lookforrachel. All rights reserved.
//

import UIKit

protocol FilterVerbsDelegate: class {
    func updateGamePlayList(filterby: NSPredicate?)
}

class OptionsVerbsTableViewController: UITableViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var group1Label: UILabel!
    @IBOutlet weak var group2Label: UILabel!
    @IBOutlet weak var group3Label: UILabel!
    
    @IBOutlet weak var group1Switch: UISwitch!
    @IBOutlet weak var group2Switch: UISwitch!
    @IBOutlet weak var group3Switch: UISwitch!
    
    
    @IBAction func group1Switch(_ sender: UISwitch) {
        if (sender.isOn == true){
            print("group1 on")
            UserDefaults.standard.set(true, forKey: "group1")
            if let booleanValue = UserDefaults.standard.object(forKey: "group1") {
                print(booleanValue)
                }
            isGroup1On = UserDefaults.standard.bool(forKey: "group1")
            isGroup2On = UserDefaults.standard.bool(forKey: "group2")
            isGroup3On = UserDefaults.standard.bool(forKey: "group3")
            print("group1: \(isGroup1On)")
            print("group2: \(isGroup2On)")
            print("group3: \(isGroup3On)")
            ShowBackButton()
        }
        else {
            UserDefaults.standard.set(false, forKey: "group1")
            print("group1 off")
            if let booleanValue = UserDefaults.standard.object(forKey: "group1") {
                print(booleanValue)
            }
            isGroup1On = UserDefaults.standard.bool(forKey: "group1")
            isGroup2On = UserDefaults.standard.bool(forKey: "group2")
            isGroup3On = UserDefaults.standard.bool(forKey: "group3")
            print("group1: \(isGroup1On)")
            print("group2: \(isGroup2On)")
            print("group3: \(isGroup3On)")
            HideBackButton()
        }
    }
    @IBAction func group2Switch(_ sender: UISwitch) {
        if (sender.isOn == true){
            print("group2 on")
            UserDefaults.standard.set(true, forKey: "group2")
            if let booleanValue = UserDefaults.standard.object(forKey: "group2") {
                print(booleanValue)
            }
            isGroup1On = UserDefaults.standard.bool(forKey: "group1")
            isGroup2On = UserDefaults.standard.bool(forKey: "group2")
            isGroup3On = UserDefaults.standard.bool(forKey: "group3")
            print("group1: \(isGroup1On)")
            print("group2: \(isGroup2On)")
            print("group3: \(isGroup3On)")
            ShowBackButton()
        }
        else {
            print("group1 off")
            UserDefaults.standard.set(false, forKey: "group2")
            if let booleanValue = UserDefaults.standard.object(forKey: "group2") {
                print(booleanValue)
            }
            isGroup1On = UserDefaults.standard.bool(forKey: "group1")
            isGroup2On = UserDefaults.standard.bool(forKey: "group2")
            isGroup3On = UserDefaults.standard.bool(forKey: "group3")
            print("group1: \(isGroup1On)")
            print("group2: \(isGroup2On)")
            print("group3: \(isGroup3On)")
            HideBackButton()
        }
    }

    @IBAction func group3Switch(_ sender: UISwitch) {
        if (sender.isOn == true){
            print("group3 on")
            UserDefaults.standard.set(true, forKey: "group3")
            if let booleanValue = UserDefaults.standard.object(forKey: "group3") {
                print(booleanValue)
            }
            isGroup1On = UserDefaults.standard.bool(forKey: "group1")
            isGroup2On = UserDefaults.standard.bool(forKey: "group2")
            isGroup3On = UserDefaults.standard.bool(forKey: "group3")
            print("group1: \(isGroup1On)")
            print("group2: \(isGroup2On)")
            print("group3: \(isGroup3On)")
            ShowBackButton()
        }
        else {
            print("group3 off")
            UserDefaults.standard.set(false, forKey: "group3")
            if let booleanValue = UserDefaults.standard.object(forKey: "group3") {
                print(booleanValue)
            }
            isGroup1On = UserDefaults.standard.bool(forKey: "group1")
            isGroup2On = UserDefaults.standard.bool(forKey: "group2")
            isGroup3On = UserDefaults.standard.bool(forKey: "group3")
            print("group1: \(isGroup1On)")
            print("group2: \(isGroup2On)")
            print("group3: \(isGroup3On)")
            HideBackButton()
        }
    }
    
    //MARK: Properties
    
    var verbGroup = ["Group 1","Group 2","Group 3"]
    private var selectedCell = 0

    var isGroup1On = UserDefaults.standard.bool(forKey: "group1")
    var isGroup2On = UserDefaults.standard.bool(forKey: "group2")
    var isGroup3On = UserDefaults.standard.bool(forKey: "group3")
    
    var searchPredicate: NSPredicate?
    var delegate: FilterVerbsDelegate? = nil
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
     
        //get userDefaults flag
        let beenHere = UserDefaults.standard.bool(forKey: "beenHere")
        print((beenHere) ? "user has been here before" : "loading defaults")
        
        //if unset, setup initial settings
        if(!beenHere){
            
            //setup initial settings
            initialSetup()
                    
             //set beenHere flag to true
             UserDefaults.standard.set(true, forKey: "beenHere")
        }
        else {
            
            //get userDefaults & setup viewController
            //group1
            if isGroup1On {
                group1Switch.setOn(true, animated: true)
            }
            else {
            group1Switch.setOn(false, animated: true)
            }
            //group2
            if isGroup2On {
                group2Switch.setOn(true, animated: true)
            }
            else {
                group2Switch.setOn(false, animated: true)
            }
            //group3
            if isGroup3On {
                group3Switch.setOn(true, animated: true)
            }
            else {
                group3Switch.setOn(false, animated: true)
            }
        
        }
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return verbGroup.count
    }
    
    

    // MARK: Private Function

    func initialSetup(){
        UserDefaults.standard.set(true, forKey: "group1")
        UserDefaults.standard.set(true, forKey: "group2")
        UserDefaults.standard.set(true, forKey: "group3")
    }
    
    func HideBackButton(){
        if isGroup1On || isGroup2On || isGroup3On {
            navigationItem.hidesBackButton = false
            print("at least one switch on")
        }
        else {
            navigationItem.hidesBackButton = true
            print("all switches are off")
        }
    }
    
    func ShowBackButton(){
        if isGroup1On || isGroup2On || isGroup3On {
            navigationItem.hidesBackButton = false
            print("at least one switch on")
        }
        else {
            navigationItem.hidesBackButton = true
            print("all switches are off")
        }
    }

//
//    func setSearchPredicate(filterby: Int) {
//        searchPredicate = NSPredicate(format: "verbGroup = %@", filterby)
//    }

    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    

}
