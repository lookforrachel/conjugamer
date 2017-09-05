//
//  OptionsPronounsTableViewController.swift
//  jsonToCoreData
//
//  Created by Rachel Yee on 8/31/17.
//  Copyright © 2017 Lookforrachel. All rights reserved.
//

import UIKit

class OptionsPronounsTableViewController: UITableViewController {

    //MARK: Properties
    
    var pronouns = ["je", "tu", "il", "elle", "nous", "vous", "ils", "elles"]
    private var selectedCell = 0
    
    var isJeOn = UserDefaults.standard.bool(forKey: "isJeOn")
    var isTuOn = UserDefaults.standard.bool(forKey: "isTuOn")
    var isIlOn = UserDefaults.standard.bool(forKey: "isIlOn")
    var isElleOn = UserDefaults.standard.bool(forKey: "isElleOn")
    var isNousOn = UserDefaults.standard.bool(forKey: "isNousOn")
    var isVousOn = UserDefaults.standard.bool(forKey: "isVousOn")
    var isIlsOn = UserDefaults.standard.bool(forKey: "isIlsOn")
    var isEllesOn = UserDefaults.standard.bool(forKey: "isEllesOn")

    //MARK: Outlets
    
    //Labels
    @IBOutlet weak var jeLabel: UILabel!
    @IBOutlet weak var tuLabel: UILabel!
    @IBOutlet weak var ilLabel: UILabel!
    @IBOutlet weak var elleLabel: UILabel!
    @IBOutlet weak var nousLabel: UILabel!
    @IBOutlet weak var vousLabel: UILabel!
    @IBOutlet weak var ilsLabel: UILabel!
    @IBOutlet weak var ellesLabel: UILabel!
    
    //Switches
    @IBOutlet weak var jeSwitch: UISwitch!
    @IBOutlet weak var tuSwitch: UISwitch!
    @IBOutlet weak var ilSwitch: UISwitch!
    @IBOutlet weak var elleSwitch: UISwitch!
    @IBOutlet weak var nousSwitch: UISwitch!
    @IBOutlet weak var vousSwitch: UISwitch!
    @IBOutlet weak var ilsSwitch: UISwitch!
    @IBOutlet weak var ellesSwitch: UISwitch!
    
    //isJeOn||isTuOn||isIlOn||isElleOn||isNousOn||isVousOn||isIlsOn||isEllesOn
    
    
    // MARK: Initialisation
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let beenToPronouns = UserDefaults.standard.bool(forKey: "beenToPronouns")
        print((beenToPronouns) ? "user has been here before" : "loading defaults")
        
        //if unset, setup initial settings
        if(!beenToPronouns){
            
            //setup initial settings
            initialSetup()
            
            //set beenToPronouns flag to true
            UserDefaults.standard.set(true, forKey: "beenToPronouns")
        }
        else {
            
            //get userDefaults & setup viewController
            //je
            if isJeOn {
                jeSwitch.setOn(true, animated: true)
            }
            else {
                jeSwitch.setOn(false, animated: true)
            }
            //tu
            if isTuOn {
                tuSwitch.setOn(true, animated: true)
            }
            else {
                tuSwitch.setOn(false, animated: true)
            }
            //il
            if isIlOn {
                ilSwitch.setOn(true, animated: true)
            }
            else {
                ilSwitch.setOn(false, animated: true)
            }
            //elle
            if isElleOn {
                elleSwitch.setOn(true, animated: true)
            }
            else {
                elleSwitch.setOn(false, animated: true)
            }
            //nous
            if isNousOn {
                nousSwitch.setOn(true, animated: true)
            }
            else {
                nousSwitch.setOn(false, animated: true)
            }
            //vous
            if isVousOn {
                vousSwitch.setOn(true, animated: true)
            }
            else {
                vousSwitch.setOn(false, animated: true)
            }
            //ils
            if isIlsOn {
                ilsSwitch.setOn(true, animated: true)
            }
            else {
                ilsSwitch.setOn(false, animated: true)
            }
            //elles
            if isEllesOn {
                ellesSwitch.setOn(true, animated: true)
            }
            else {
                ellesSwitch.setOn(false, animated: true)
            }
        }
    }
    
    //Actions
    
    @IBAction func btn(_ sender: Any) {
            isJeOn = UserDefaults.standard.bool(forKey: "isJeOn")
            isTuOn = UserDefaults.standard.bool(forKey: "isTuOn")
            isIlOn = UserDefaults.standard.bool(forKey: "isIlOn")
            print("je: \(isJeOn)")
            print("tu: \(isTuOn)")
            print("il: \(isIlOn)")
    }
    
    
    @IBAction func jeSwitch(_ sender: UISwitch) {
        if (sender.isOn == true){
            UserDefaults.standard.set(true, forKey: "isJeOn")
            
            isJeOn = UserDefaults.standard.bool(forKey: "isJeOn")
//            isTuOn = UserDefaults.standard.bool(forKey: "isTuOn")
//            isIlOn = UserDefaults.standard.bool(forKey: "isIlOn")
//            isElleOn = UserDefaults.standard.bool(forKey: "isElleOn")
//            isNousOn = UserDefaults.standard.bool(forKey: "isNousOn")
//            isVousOn = UserDefaults.standard.bool(forKey: "isVousOn")
//            isIlsOn = UserDefaults.standard.bool(forKey: "isIlsOn")
//            isEllesOn = UserDefaults.standard.bool(forKey: "isEllesOn")
            
//            print("je: \(isJeOn)")
//            print("tu: \(isTuOn)")
//            print("il: \(isIlOn)")
//            print("elle: \(isElleOn)")
//            print("nous: \(isNousOn)")
//            print("vous: \(isVousOn)")
//            print("ils: \(isIlsOn)")
//            print("elles: \(isEllesOn)")
            
            let booleanValue = UserDefaults.standard.bool(forKey: "isJeOn")
            print((booleanValue) ? "Je iz on" : "Je iz off")
        }
        else if (isTuOn||isIlOn||isElleOn||isNousOn||isVousOn||isIlsOn||isEllesOn){
            UserDefaults.standard.set(false, forKey: "isJeOn")
            isJeOn = UserDefaults.standard.bool(forKey: "isJeOn")
            
            let booleanValue = UserDefaults.standard.bool(forKey: "isJeOn")
            print((booleanValue) ? "Je is on" : "Je is off")
        }
        else {
            jeSwitch.setOn(true, animated: true)
            createAlert(title: "!", message: "user must select at least one option")
        }
    }
    @IBAction func tuSwitch(_ sender: UISwitch) {
        if (sender.isOn == true){
            UserDefaults.standard.set(true, forKey: "isTuOn")
            
            //            isJeOn = UserDefaults.standard.bool(forKey: "isJeOn")
            isTuOn = UserDefaults.standard.bool(forKey: "isTuOn")
            //            isIlOn = UserDefaults.standard.bool(forKey: "isIlOn")
            //            isElleOn = UserDefaults.standard.bool(forKey: "isElleOn")
            //            isNousOn = UserDefaults.standard.bool(forKey: "isNousOn")
            //            isVousOn = UserDefaults.standard.bool(forKey: "isVousOn")
            //            isIlsOn = UserDefaults.standard.bool(forKey: "isIlsOn")
            //            isEllesOn = UserDefaults.standard.bool(forKey: "isEllesOn")
            
            //            print("je: \(isJeOn)")
            //            print("tu: \(isTuOn)")
            //            print("il: \(isIlOn)")
            //            print("elle: \(isElleOn)")
            //            print("nous: \(isNousOn)")
            //            print("vous: \(isVousOn)")
            //            print("ils: \(isIlsOn)")
            //            print("elles: \(isEllesOn)")
            
            let booleanValue = UserDefaults.standard.bool(forKey: "isTuOn")
            print((booleanValue) ? "Tu iz on" : "Tu iz off")
        }
        else if (isJeOn||isIlOn||isElleOn||isNousOn||isVousOn||isIlsOn||isEllesOn){
            UserDefaults.standard.set(false, forKey: "isTuOn")
            isTuOn = UserDefaults.standard.bool(forKey: "isTuOn")
            
            let booleanValue = UserDefaults.standard.bool(forKey: "isTuOn")
            print((booleanValue) ? "Tu is on" : "Tu is off")
        }
        else {
            tuSwitch.setOn(true, animated: true)
            createAlert(title: "!", message: "user must select at least one option")
        }
    }
    @IBAction func ilSwitch(_ sender: UISwitch) {
        if (sender.isOn == true){
            UserDefaults.standard.set(true, forKey: "isIlOn")
            
            //            isJeOn = UserDefaults.standard.bool(forKey: "isJeOn")
            //            isTuOn = UserDefaults.standard.bool(forKey: "isTuOn")
            isIlOn = UserDefaults.standard.bool(forKey: "isIlOn")
            //            isElleOn = UserDefaults.standard.bool(forKey: "isElleOn")
            //            isNousOn = UserDefaults.standard.bool(forKey: "isNousOn")
            //            isVousOn = UserDefaults.standard.bool(forKey: "isVousOn")
            //            isIlsOn = UserDefaults.standard.bool(forKey: "isIlsOn")
            //            isEllesOn = UserDefaults.standard.bool(forKey: "isEllesOn")
            
            //            print("je: \(isJeOn)")
            //            print("tu: \(isTuOn)")
            //            print("il: \(isIlOn)")
            //            print("elle: \(isElleOn)")
            //            print("nous: \(isNousOn)")
            //            print("vous: \(isVousOn)")
            //            print("ils: \(isIlsOn)")
            //            print("elles: \(isEllesOn)")
            
            let booleanValue = UserDefaults.standard.bool(forKey: "isIlOn")
            print((booleanValue) ? "il iz on" : "il iz off")
        }
        else if (isJeOn||isTuOn||isElleOn||isNousOn||isVousOn||isIlsOn||isEllesOn){
            UserDefaults.standard.set(false, forKey: "isIlOn")
            isIlOn = UserDefaults.standard.bool(forKey: "isIlOn")
            
            let booleanValue = UserDefaults.standard.bool(forKey: "isIlOn")
            print((booleanValue) ? "il is on" : "il is off")
        }
        else {
            ilSwitch.setOn(true, animated: true)
            createAlert(title: "!", message: "user must select at least one option")
        }
    }
    @IBAction func elleSwitch(_ sender: UISwitch) {
        if (sender.isOn == true){
            UserDefaults.standard.set(true, forKey: "isElleOn")
            
            //            isJeOn = UserDefaults.standard.bool(forKey: "isElleOn")
            //            isTuOn = UserDefaults.standard.bool(forKey: "isTuOn")
            //            isIlOn = UserDefaults.standard.bool(forKey: "isIlOn")
            isElleOn = UserDefaults.standard.bool(forKey: "isElleOn")
            //            isNousOn = UserDefaults.standard.bool(forKey: "isNousOn")
            //            isVousOn = UserDefaults.standard.bool(forKey: "isVousOn")
            //            isIlsOn = UserDefaults.standard.bool(forKey: "isIlsOn")
            //            isEllesOn = UserDefaults.standard.bool(forKey: "isEllesOn")
            
            //            print("je: \(isJeOn)")
            //            print("tu: \(isTuOn)")
            //            print("il: \(isIlOn)")
            //            print("elle: \(isElleOn)")
            //            print("nous: \(isNousOn)")
            //            print("vous: \(isVousOn)")
            //            print("ils: \(isIlsOn)")
            //            print("elles: \(isEllesOn)")
            
            let booleanValue = UserDefaults.standard.bool(forKey: "isElleOn")
            print((booleanValue) ? "Elle iz on" : "Elle iz off")
        }
        else if (isJeOn||isTuOn||isIlOn||isNousOn||isVousOn||isIlsOn||isEllesOn){
            UserDefaults.standard.set(false, forKey: "isElleOn")
            isElleOn = UserDefaults.standard.bool(forKey: "isElleOn")
            
            let booleanValue = UserDefaults.standard.bool(forKey: "isElleOn")
            print((booleanValue) ? "Elle is on" : "Elle is off")
        }
        else {
            elleSwitch.setOn(true, animated: true)
            createAlert(title: "!", message: "user must select at least one option")
        }
    }
    @IBAction func nousSwitch(_ sender: UISwitch) {
        if (sender.isOn == true){
            UserDefaults.standard.set(true, forKey: "isNousOn")
            
            //            isJeOn = UserDefaults.standard.bool(forKey: "isElleOn")
            //            isTuOn = UserDefaults.standard.bool(forKey: "isTuOn")
            //            isIlOn = UserDefaults.standard.bool(forKey: "isIlOn")
            //            isElleOn = UserDefaults.standard.bool(forKey: "isElleOn")
            isNousOn = UserDefaults.standard.bool(forKey: "isNousOn")
            //            isVousOn = UserDefaults.standard.bool(forKey: "isVousOn")
            //            isIlsOn = UserDefaults.standard.bool(forKey: "isIlsOn")
            //            isEllesOn = UserDefaults.standard.bool(forKey: "isEllesOn")
            
            //            print("je: \(isJeOn)")
            //            print("tu: \(isTuOn)")
            //            print("il: \(isIlOn)")
            //            print("elle: \(isElleOn)")
            //            print("nous: \(isNousOn)")
            //            print("vous: \(isVousOn)")
            //            print("ils: \(isIlsOn)")
            //            print("elles: \(isEllesOn)")
            
            let booleanValue = UserDefaults.standard.bool(forKey: "isNousOn")
            print((booleanValue) ? "Nous iz on" : "Nous iz off")
        }
        else if (isJeOn||isTuOn||isIlOn||isElleOn||isVousOn||isIlsOn||isEllesOn){
            UserDefaults.standard.set(false, forKey: "isNousOn")
            isNousOn = UserDefaults.standard.bool(forKey: "isNousOn")
            
            let booleanValue = UserDefaults.standard.bool(forKey: "isNousOn")
            print((booleanValue) ? "Nous is on" : "Nous is off")
        }
        else {
            nousSwitch.setOn(true, animated: true)
            createAlert(title: "!", message: "user must select at least one option")
        }
    }
    @IBAction func vousSwitch(_ sender: UISwitch) {
        if (sender.isOn == true){
            UserDefaults.standard.set(true, forKey: "isVousOn")
            
            //            isJeOn = UserDefaults.standard.bool(forKey: "isElleOn")
            //            isTuOn = UserDefaults.standard.bool(forKey: "isTuOn")
            //            isIlOn = UserDefaults.standard.bool(forKey: "isIlOn")
            //            isElleOn = UserDefaults.standard.bool(forKey: "isElleOn")
            //            isNousOn = UserDefaults.standard.bool(forKey: "isNousOn")
            isVousOn = UserDefaults.standard.bool(forKey: "isVousOn")
            //            isIlsOn = UserDefaults.standard.bool(forKey: "isIlsOn")
            //            isEllesOn = UserDefaults.standard.bool(forKey: "isEllesOn")
            
            //            print("je: \(isJeOn)")
            //            print("tu: \(isTuOn)")
            //            print("il: \(isIlOn)")
            //            print("elle: \(isElleOn)")
            //            print("nous: \(isNousOn)")
            //            print("vous: \(isVousOn)")
            //            print("ils: \(isIlsOn)")
            //            print("elles: \(isEllesOn)")
            
            let booleanValue = UserDefaults.standard.bool(forKey: "isVousOn")
            print((booleanValue) ? "Vous iz on" : "Vous iz off")
        }
        else if (isJeOn||isTuOn||isIlOn||isElleOn||isNousOn||isIlsOn||isEllesOn){
            UserDefaults.standard.set(false, forKey: "isVousOn")
            isVousOn = UserDefaults.standard.bool(forKey: "isVousOn")
            
            let booleanValue = UserDefaults.standard.bool(forKey: "isVousOn")
            print((booleanValue) ? "Vous is on" : "Vous is off")
        }
        else {
            vousSwitch.setOn(true, animated: true)
            createAlert(title: "!", message: "user must select at least one option")
        }
    }
    @IBAction func ilsSwitch(_ sender: UISwitch) {
        if (sender.isOn == true){
            UserDefaults.standard.set(true, forKey: "isIlsOn")
            
            //            isJeOn = UserDefaults.standard.bool(forKey: "isJeOn")
            //            isTuOn = UserDefaults.standard.bool(forKey: "isTuOn")
            //            isIlOn = UserDefaults.standard.bool(forKey: "isIlOn")
            //            isElleOn = UserDefaults.standard.bool(forKey: "isElleOn")
            //            isNousOn = UserDefaults.standard.bool(forKey: "isNousOn")
            //            isVousOn = UserDefaults.standard.bool(forKey: "isVousOn")
            isIlsOn = UserDefaults.standard.bool(forKey: "isIlsOn")
            //            isEllesOn = UserDefaults.standard.bool(forKey: "isEllesOn")
            
            //            print("je: \(isJeOn)")
            //            print("tu: \(isTuOn)")
            //            print("il: \(isIlOn)")
            //            print("elle: \(isElleOn)")
            //            print("nous: \(isNousOn)")
            //            print("vous: \(isVousOn)")
            //            print("ils: \(isIlsOn)")
            //            print("elles: \(isEllesOn)")
            
            let booleanValue = UserDefaults.standard.bool(forKey: "isIlsOn")
            print((booleanValue) ? "ils iz on" : "ils iz off")
        }
        else if (isJeOn||isTuOn||isIlOn||isElleOn||isNousOn||isVousOn||isEllesOn){
            UserDefaults.standard.set(false, forKey: "isIlsOn")
            isIlsOn = UserDefaults.standard.bool(forKey: "isIlsOn")
            
            let booleanValue = UserDefaults.standard.bool(forKey: "isIlsOn")
            print((booleanValue) ? "ils is on" : "ils is off")
        }
        else {
            ilsSwitch.setOn(true, animated: true)
            createAlert(title: "!", message: "user must select at least one option")
        }
    }
    @IBAction func ellesSwitch(_ sender: UISwitch) {
        if (sender.isOn == true){
            UserDefaults.standard.set(true, forKey: "isEllesOn")
            
            //            isJeOn = UserDefaults.standard.bool(forKey: "isElleOn")
            //            isTuOn = UserDefaults.standard.bool(forKey: "isTuOn")
            //            isIlOn = UserDefaults.standard.bool(forKey: "isIlOn")
//            isElleOn = UserDefaults.standard.bool(forKey: "isElleOn")
            //            isNousOn = UserDefaults.standard.bool(forKey: "isNousOn")
            //            isVousOn = UserDefaults.standard.bool(forKey: "isVousOn")
            //            isIlsOn = UserDefaults.standard.bool(forKey: "isIlsOn")
            isEllesOn = UserDefaults.standard.bool(forKey: "isEllesOn")
            
            //            print("je: \(isJeOn)")
            //            print("tu: \(isTuOn)")
            //            print("il: \(isIlOn)")
            //            print("elle: \(isElleOn)")
            //            print("nous: \(isNousOn)")
            //            print("vous: \(isVousOn)")
            //            print("ils: \(isIlsOn)")
            //            print("elles: \(isEllesOn)")
            
            let booleanValue = UserDefaults.standard.bool(forKey: "isEllesOn")
            print((booleanValue) ? "Elles iz on" : "Elles iz off")
        }
        else if (isJeOn||isTuOn||isIlOn||isElleOn||isNousOn||isVousOn||isIlsOn){
            UserDefaults.standard.set(false, forKey: "isEllesOn")
            isEllesOn = UserDefaults.standard.bool(forKey: "isEllesOn")
            
            let booleanValue = UserDefaults.standard.bool(forKey: "isEllesOn")
            print((booleanValue) ? "Elles is on" : "Elles is off")
        }
        else {
            ellesSwitch.setOn(true, animated: true)
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
        return pronouns.count
    }
    
    
    // MARK: Private Function
    
    func initialSetup(){
        
        UserDefaults.standard.set(true, forKey: "isJeOn")
        UserDefaults.standard.set(true, forKey: "isTuOn")
        UserDefaults.standard.set(true, forKey: "isIlOn")
        UserDefaults.standard.set(true, forKey: "isElleOn")
        UserDefaults.standard.set(true, forKey: "isNousOn")
        UserDefaults.standard.set(true, forKey: "isVousOn")
        UserDefaults.standard.set(true, forKey: "isIlsOn")
        UserDefaults.standard.set(true, forKey: "isEllesOn")
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
