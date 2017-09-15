//
//  OptionsViewController.swift
//  jsonToCoreData
//
//  Created by Rachel Yee on 8/31/17.
//  Copyright © 2017 Lookforrachel. All rights reserved.
//

import UIKit




class OptionsViewController: UITableViewController {

    //MARK: Properties
    var options = ["tenses", "pronouns", "verbs"]
    private var selectedCell = 0
    var segueOptions:OptionsMain = .Verbs
    //MARK: Outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        let isGroup1On = UserDefaults.standard.bool(forKey: "isGroup1On")
//        print((isGroup1On) ? "GROUP ONE ON" : "GROUP ONE OFF")
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
        return options.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "optionsCell", for: indexPath)
        
        cell.textLabel?.text = options[indexPath.row]

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCell = indexPath.row
        
        switch selectedCell {
        case 0:
            segueOptions = .Tenses
            performSegue(withIdentifier: "tensesSegue" , sender: self)
        case 1:
            segueOptions = .Pronouns
            performSegue(withIdentifier: "verbsSegue" , sender: self)
        case 2:
            segueOptions = .Tenses
            performSegue(withIdentifier: "verbsSegue" , sender: self)
        default:
            print("no row selected")
        }
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
        // Pass the selected object to the new view controller.
        
        let options = OptionsViewModel(optionKeys: segueOptions)
        
        if segue.identifier == "verbsSegue" {
            let optionsVerbsTableViewController: OptionsVerbsTableViewController = segue.destination as! OptionsVerbsTableViewController
            
            optionsVerbsTableViewController.optionsVM = options
            }
    }
}
