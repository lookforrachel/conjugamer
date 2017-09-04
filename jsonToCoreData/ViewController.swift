//
//  ViewController.swift
//  jsonToCoreData
//
//  Created by Rachel Yee on 8/24/17.
//  Copyright © 2017 Lookforrachel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    var Questions = []
//    var QNumber = Int()
    
    @IBAction func optionsBtn(_ sender: Any) {
        performSegue(withIdentifier: "optionsSegue", sender: self)
    }
    @IBAction func playBtn(_ sender: Any) {
        performSegue(withIdentifier: "gamePlaySegue", sender: self)
    }
    
    var selectedConjugations = ["this", "that"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
//    func PickQuestion() {
//
//        if Questions.count > 0 {
//            QNumber = arc4random() % Questions.count
//
//            Questions.remove(at: QNumber)
//            
//        }
//    
//
//    
//    }

    

}

