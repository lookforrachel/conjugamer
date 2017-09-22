//
//  OptionsTensesTableViewController.swift
//  jsonToCoreData
//
//  Created by Rachel Yee on 8/31/17.
//  Copyright © 2017 Lookforrachel. All rights reserved.
//

import UIKit

class OptionsTensesTableViewController: UITableViewController {

    // MARK: Properties
    
    let numberOfRowsAtSection: [Int] = [8, 4, 3, 2, 2, 2, 2]

    
    // MARK: Outlet
    
    //switches
    @IBOutlet weak var indPreSwitch: UISwitch!
    @IBOutlet weak var indPCSwitch: UISwitch!
    @IBOutlet weak var indImp: UISwitch!
    @IBOutlet weak var indPQP: UISwitch!
    @IBOutlet weak var indPS: UISwitch!
    @IBOutlet weak var indPA: UISwitch!
    @IBOutlet weak var indFS: UISwitch!
    @IBOutlet weak var indFA: UISwitch!
    @IBOutlet weak var subPre: UISwitch!
    @IBOutlet weak var subPas: UISwitch!
    @IBOutlet weak var subImp: UISwitch!
    @IBOutlet weak var subPQP: UISwitch!
    @IBOutlet weak var conPre: UISwitch!
    @IBOutlet weak var conPas1: UISwitch!
    @IBOutlet weak var conPas2: UISwitch!
    @IBOutlet weak var impPre: UISwitch!
    @IBOutlet weak var impPas: UISwitch!
    @IBOutlet weak var partPre: UISwitch!
    @IBOutlet weak var partPas: UISwitch!
    @IBOutlet weak var infPre: UISwitch!
    @IBOutlet weak var infPas: UISwitch!
    @IBOutlet weak var gerPre: UISwitch!
    @IBOutlet weak var gerPas: UISwitch!
    
    //actions
    @IBAction func indPreSwitch(_ sender: UISwitch) {
    }
    @IBAction func indPCSwitch(_ sender: UISwitch) {
    }
    @IBAction func indImp(_ sender: UISwitch) {
    }
    @IBAction func indPQP(_ sender: UISwitch) {
    }
    @IBAction func indPS(_ sender: UISwitch) {
    }
    @IBAction func indPA(_ sender: UISwitch) {
    }
    @IBAction func indFS(_ sender: UISwitch) {
    }
    @IBAction func indFA(_ sender: UISwitch) {
    }
    @IBAction func subPre(_ sender: UISwitch) {
    }
    @IBAction func subPas(_ sender: UISwitch) {
    }
    @IBAction func subImp(_ sender: UISwitch) {
    }
    @IBAction func subPQP(_ sender: UISwitch) {
    }
    @IBAction func conPre(_ sender: UISwitch) {
    }
    @IBAction func conPas1(_ sender: UISwitch) {
    }
    @IBAction func conPas2(_ sender: UISwitch) {
    }
    @IBAction func impPre(_ sender: UISwitch) {
    }
    @IBAction func impPas(_ sender: UISwitch) {
    }
    @IBAction func partPre(_ sender: UISwitch) {
    }
    @IBAction func partPas(_ sender: UISwitch) {
    }
    @IBAction func infPre(_ sender: UISwitch) {
    }
    @IBAction func infPas(_ sender: UISwitch) {
    }
    @IBAction func gerPre(_ sender: UISwitch) {
    }
    @IBAction func gerPas(_ sender: UISwitch) {
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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return numberOfRowsAtSection.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var rows: Int = 0
        
        if section < numberOfRowsAtSection.count {
            rows = numberOfRowsAtSection[section]
        }
        return rows
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
