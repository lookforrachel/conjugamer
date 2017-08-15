//
//  GamePlayViewController.swift
//  CoreDataPreloadDemo
//
//  Created by Rachel Yee on 8/3/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class GamePlayViewController: UIViewController, UITextFieldDelegate {

    fileprivate var Verb:[Verb] = []
    var fetchResultController:NSFetchedResultsController<NSFetchRequestResult>!
    var randomiser:(()->Int)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                
        // Load menu items from database
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext {
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Verb")
            do {
                Verb = try managedObjectContext.fetch(fetchRequest) as! [Verb]
                randomiser = GamePlayViewController.randomSequenceGenerator(min: 1, max: Verb.count-1)
                self.userInput.delegate = self
            } catch {
                print("Failed to retrieve record")
                print(error)
            }
            
        }
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

    @IBOutlet weak var verbMoodLabel: UILabel!
    @IBOutlet weak var pronounLabel: UILabel!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tenseLabel: UILabel!
    @IBOutlet weak var verbLabel: UILabel!
    var currentRow: Int = 0
    var countTenseColumns = 6
    var currentColumn: Int = 0
    var columnNames = ["indPreJe",
                       "indPreTu",
                       "indPreIl",
                       "indPreNous",
                       "indPreVous",
                       "indPreIls"]
    var columnNameLong: String = ""
    var columnNamesArr: String = ""
    var answer: String = "x"

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func checkAnswer(_ sender: Any) {
        
    
        if userInput.text == answer {
            textView.text = "correct!"
            questionsPage()
            userInput.text = nil
        }
        
        else {
         textView.text = "you're a dumbass, the correct answer is \(answer)"
        
        }
    }
    
    
    static func randomSequenceGenerator(min: Int, max: Int) -> () -> Int {
        var numbers: [Int] = []
        return {
            if numbers.count == 0 {
                numbers = Array(min ... max)
            }
            
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            return numbers.remove(at: index)
        }
    }

    
    func randomNumberGeneratorColumn() -> Int {
        //generates random number from 2 to number of columns with tenses
        return Int(arc4random_uniform(UInt32(countTenseColumns)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        questionsPage()
    }
    
    func questionsPage () {
    
        guard let unwrappedRandomiser = randomiser else {
            fatalError()
        }
        
        currentRow = unwrappedRandomiser()
        currentColumn = self.randomNumberGeneratorColumn()
        let columnName = columnNames[currentColumn]
        print(columnName)
        
        let columnNameLong = Verb[0].value(forKey:columnName) as! String
        let columnNamesArr = columnNameLong.components(separatedBy: "|")
        print(columnNameLong,columnNamesArr.count)
        
        switch columnNamesArr.count {
        case 1:
            verbMoodLabel.text = columnNameLong
            tenseLabel.text = ""
            pronounLabel.text = ""
            
        case 2:
            answer = Verb[currentRow].value(forKey:columnName) as! String
            
            verbMoodLabel.text = columnNamesArr[0]
            tenseLabel.text = columnNamesArr[1]
            pronounLabel.text = ""
            
        default:
            verbMoodLabel.text = columnNamesArr[0]
            tenseLabel.text = columnNamesArr[1]
            pronounLabel.text = columnNamesArr[2]


        }
        
        answer = Verb[currentRow].value(forKey:columnName) as! String

        verbLabel.text = Verb[currentRow].inf
        
        print("row: \(currentRow)")
        print("col: \(currentColumn)")
        print("ans: \(answer)")
                
        
        //name = id
        //detail = infinitive
        //price = ind pre je
        //verb = ind pre tu
    }
    
}
