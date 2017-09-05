//
//  OptionsVerbsTableViewController.swift
//  jsonToCoreData
//
//  Created by Rachel Yee on 8/31/17.
//  Copyright © 2017 Lookforrachel. All rights reserved.
//

import UIKit

class OptionsVerbsTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var verbGroup = ["Group1","Group2","Group3"]
    private var selectedCell = 0
    
    var isGroup1On = UserDefaults.standard.bool(forKey: "isGroup1On")
    var isGroup2On = UserDefaults.standard.bool(forKey: "isGroup2On")
    var isGroup3On = UserDefaults.standard.bool(forKey: "isGroup3On")
    
    //MARK: Outlets
    //Labels
    @IBOutlet weak var group1Label: UILabel!
    @IBOutlet weak var group2Label: UILabel!
    @IBOutlet weak var group3Label: UILabel!
    
    //Switches
    @IBOutlet weak var group1Switch: UISwitch!
    @IBOutlet weak var group2Switch: UISwitch!
    @IBOutlet weak var group3Switch: UISwitch!
    
    // MARK: Initialisation
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

    
    
    //Actions
    @IBAction func group1Switch(_ sender: UISwitch) {
        if (sender.isOn == true){
            UserDefaults.standard.set(true, forKey: "isGroup1On")
            print("group1 on")
            isGroup1On = UserDefaults.standard.bool(forKey: "isGroup1On")
            isGroup2On = UserDefaults.standard.bool(forKey: "isGroup2On")
            isGroup3On = UserDefaults.standard.bool(forKey: "isGroup3On")
            
//            ShowBackButton()
//            print("group1: \(isGroup1On)")
//            print("group2: \(isGroup2On)")
//            print("group3: \(isGroup3On)")
//            if let booleanValue = UserDefaults.standard.object(forKey: "isGroup1On") {
//                print(booleanValue)
//            }
        }
        else if (isGroup2On || isGroup3On){
            UserDefaults.standard.set(false, forKey: "isGroup1On")
            print("group1 off")
            isGroup1On = UserDefaults.standard.bool(forKey: "isGroup1On")
            isGroup2On = UserDefaults.standard.bool(forKey: "isGroup2On")
            isGroup3On = UserDefaults.standard.bool(forKey: "isGroup3On")
//            HideBackButton()
//            print("group1: \(isGroup1On)")
//            print("group2: \(isGroup2On)")
//            print("group3: \(isGroup3On)")
//            if let booleanValue = UserDefaults.standard.object(forKey: "isGroup1On") {
//                print(booleanValue)
//            }
        }
        else {
            group1Switch.setOn(true, animated: true)
            createAlert(title: "!", message: "user must select at least one option")
        }
    }
    @IBAction func group2Switch(_ sender: UISwitch) {
        if (sender.isOn == true){
            UserDefaults.standard.set(true, forKey: "isGroup2On")
            print("group2 on")
            isGroup1On = UserDefaults.standard.bool(forKey: "isGroup1On")
            isGroup2On = UserDefaults.standard.bool(forKey: "isGroup2On")
            isGroup3On = UserDefaults.standard.bool(forKey: "isGroup3On")
//            ShowBackButton()
//            print("group1: \(isGroup1On)")
//            print("group2: \(isGroup2On)")
//            print("group3: \(isGroup3On)")
//            if let booleanValue = UserDefaults.standard.object(forKey: "isGroup2On") {
//                print(booleanValue)
//            }
        }
        else if (isGroup1On || isGroup3On){
            UserDefaults.standard.set(false, forKey: "isGroup2On")
            print("group2 off")
            isGroup1On = UserDefaults.standard.bool(forKey: "isGroup1On")
            isGroup2On = UserDefaults.standard.bool(forKey: "isGroup2On")
            isGroup3On = UserDefaults.standard.bool(forKey: "isGroup3On")
//            HideBackButton()
//            print("group1: \(isGroup1On)")
//            print("group2: \(isGroup2On)")
//            print("group3: \(isGroup3On)")
//            if let booleanValue = UserDefaults.standard.object(forKey: "isGroup2On") {
//                print(booleanValue)
//            }
        }
        else {
            group2Switch.setOn(true, animated: true)
            createAlert(title: "!", message: "user must select at least one option")
        }
    }

    @IBAction func group3Switch(_ sender: UISwitch) {
        if (sender.isOn == true){
            UserDefaults.standard.set(true, forKey: "isGroup3On")
            print("group3 on")
            isGroup1On = UserDefaults.standard.bool(forKey: "isGroup1On")
            isGroup2On = UserDefaults.standard.bool(forKey: "isGroup2On")
            isGroup3On = UserDefaults.standard.bool(forKey: "isGroup3On")
//            ShowBackButton()
//            print("group1: \(isGroup1On)")
//            print("group2: \(isGroup2On)")
//            print("group3: \(isGroup3On)")
//            if let booleanValue = UserDefaults.standard.object(forKey: "isGroup3On") {
//                print(booleanValue)
//            }
        }
        else if (isGroup1On || isGroup2On){
            UserDefaults.standard.set(false, forKey: "isGroup3On")
            print("group3 off")
            isGroup1On = UserDefaults.standard.bool(forKey: "isGroup1On")
            isGroup2On = UserDefaults.standard.bool(forKey: "isGroup2On")
            isGroup3On = UserDefaults.standard.bool(forKey: "isGroup3On")
//            HideBackButton()
//            print("group1: \(isGroup1On)")
//            print("group2: \(isGroup2On)")
//            print("group3: \(isGroup3On)")
//            if let booleanValue = UserDefaults.standard.object(forKey: "isGroup3On") {
//                print(booleanValue)
//            }
        }
        else {
            group3Switch.setOn(true, animated: true)
            createAlert(title: "!", message: "user must select at least one option")
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
        UserDefaults.standard.set(true, forKey: "isGroup1On")
        UserDefaults.standard.set(true, forKey: "isGroup2On")
        UserDefaults.standard.set(true, forKey: "isGroup3On")
    }
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message , preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
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
