//
//  Options.swift
//  jsonToCoreData
//
//  Created by Rachel Yee on 9/10/17.
//  Copyright © 2017 Lookforrachel. All rights reserved.
//

import Foundation



private let optionKeys = [
    "isGroup1On",
    "isGroup2On",
    "isGroup3On"
]


enum OptionsMain:String {
    
    case Tenses = "tenseOptions"
    case Pronouns = "pronounOptions"
    case Verbs = "verbOptions"
}


class Options {
    
    var options = [Option]()
    //var innerArray = [Option]()
    
    var keys:[String]?
    
    var optionsMain: OptionsMain
    //    var name: String
    //    var isOn: Bool
    //    var defaultsKey: String
    var myOptionMain: String
    
    
    init(optionsMain: OptionsMain) {
        
        self.optionsMain = optionsMain
        
        myOptionMain = self.optionsMain.rawValue
        
        //        self.name = ""
        //        self.isOn = false
        //        self.defaultsKey = ""
        
        guard let optionsPlistDict = Bundle.main.url(forResource: "optionsDict", withExtension: "plist") else {
            fatalError()
        }
        guard let dictionary = NSDictionary(contentsOf: optionsPlistDict) else {
            fatalError()
        }
        
        
        if myOptionMain != OptionsMain.Tenses.rawValue {
            if let subOptions = dictionary.object(forKey: myOptionMain) as? NSArray{
                
                for thing in subOptions{
                    let dict = thing as! [String:String]
                    
                    if let title = dict["title"], let defaultsKey = dict["userDefaults"] {
                        print("title: \(title), defaultsKey: \(defaultsKey)")
                        //                        self.name = title
                        //                        self.isOn = UserDefaults.standard.bool(forKey: defaultsKey)
                        //                        self.defaultsKey = defaultsKey
                        let thisOption = Option(name: title, defaultsKey: defaultsKey,tensesSection: nil)
                        //innerArray.append(thisOption)
                        print(thisOption.name)
                        options.append(thisOption)
                    }
                }
                
                
            }
            
        } else {
            
            if let subOptionsSections = dictionary.object(forKey: myOptionMain) as? NSDictionary{
                
                let sections = subOptionsSections
                keys = sections.allKeys as? [String]
                
                
                for (section,stuff) in subOptionsSections{
                    print ("section: \(section)")
                    //innerArray = []
                    
                    
                    let array = stuff as? [[String:String]]
                    for arr in array! {
                        //                        print(arr["title"]!)
                        if let title = arr["title"], let defaultsKey = arr["userDefaults"] {
                            print("title: \(title), defaultsKey: \(defaultsKey)")
                            //                            self.name = title
                            //                            self.isOn = UserDefaults.standard.bool(forKey: defaultsKey)
                            //                            self.defaultsKey = defaultsKey
                            let thisOption = Option(name: title, defaultsKey: defaultsKey,tensesSection:section as? String)
                            //thisOption.tensesSection = section as? String
                            //                            print("X \(thisOption.name)")
                            //innerArray.append(thisOption)
                            options.append(thisOption)
                        }
                    }
                    
                    
                    
                    
                    
                }
            }
            
            
            
            
        }
        
    }
    
}


class Option {
    let name: String
    var isOn: Bool
    let defaultsKey: String
    
    let tensesSection:String?
    
    
    init(name: String, defaultsKey: String,tensesSection:String?) {
        self.name = name
        self.isOn = UserDefaults.standard.bool(forKey: defaultsKey)
        self.defaultsKey = defaultsKey
        self.tensesSection = tensesSection
    }
}
