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
    
    //MARK: Properties
    
    var verbGroup = ["Group 1","Group 2","Group 3"]
    private var selectedCell = 0
    var group1 = true
    var group2 = true
    var group3 = true
    
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
                    print("set group 1 to...")
                    
                    //set beenHere flag to true
                    UserDefaults.standard.set(true, forKey: "beenHere")
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "verbsCell", for: indexPath)
        
        cell.textLabel?.text = verbGroup[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath)!
        
        if selectedCell.accessoryType == .checkmark {
            selectedCell.accessoryType = .none
            //remove selected predicate from NSUserDefaults
            UserDefaults.standard.set(false, forKey: "group\(indexPath.row)")
            if let booleanValue = UserDefaults.standard.object(forKey: "group\(indexPath.row)") {
                print(booleanValue)
            }
            print("not Group \(indexPath.row)")
        }
        else {
            selectedCell.accessoryType = .checkmark
            //add selected predicate to NSUserDefaults
//            setSearchPredicate(filterby: indexPath.row)
//            delegate?.updateGamePlayList(filterby: searchPredicate)
            UserDefaults.standard.set(true, forKey: "group\(indexPath.row)")
            if let booleanValue = UserDefaults.standard.object(forKey: "group\(indexPath.row)") {
                print(booleanValue)
            }
        }
    }
    
//    func SetCheckmarks(){
//        if  == true {
//          tableView.cellForRow(at: indexPath
//        }
//    }
    
//    func HideBackButton(){
//        if no cells have been selected {
//            navigationItem.hidesBackButton = true}
//        else {
//            navigationItem.hidesBackButton = false
//        }
//    }
    
    // MARK: Private Function
    
    func setSearchPredicate(filterby: Int) {
        searchPredicate = NSPredicate(format: "verbGroup = %@", filterby)
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
