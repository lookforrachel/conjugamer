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
    
    var optionsMain: OptionsMain
    var name: String
    var isOn: Bool
    var defaultsKey: String
    var myOptionMain: String

    
    init(optionsMain: OptionsMain) {
        
        self.optionsMain = optionsMain
        
        myOptionMain = self.optionsMain.rawValue
        
        self.name = ""
        self.isOn = false
        self.defaultsKey = ""
        
        guard let optionsPlistDict = Bundle.main.url(forResource: "optionsDict", withExtension: "plist") else {
            fatalError()
        }
        guard let dictionary = NSDictionary(contentsOf: optionsPlistDict) else {
            fatalError()
        }
        
        if myOptionMain != "tenseOptions"{
            if let subOptions = dictionary.object(forKey: myOptionMain) as? NSArray{
                
                for thing in subOptions{
                    let dict = thing as! NSDictionary
                    
                    if let title = dict.object(forKey: "title") as? String, let defaultsKey = dict.object(forKey: "userDefaults") as? String {
                        print(title,defaultsKey)
                        self.name = title
                        self.isOn = UserDefaults.standard.bool(forKey: defaultsKey)
                        self.defaultsKey = defaultsKey
                        let thisOption = Option(name: title, defaultsKey: defaultsKey)
                        options.append(thisOption)
                    }
                }
            }
        } else {
            if let subOptions = dictionary.object(forKey: "verbOptions") as? NSArray{
                
                for thing in subOptions{
                    let dict = thing as! NSDictionary
                    
                    if let title = dict.object(forKey: "title") as? String, let defaultsKey = dict.object(forKey: "userDefaults") as? String {
                        print(title,defaultsKey)
                        self.name = title
                        self.isOn = UserDefaults.standard.bool(forKey: defaultsKey)
                        self.defaultsKey = defaultsKey
                        let thisOption = Option(name: title, defaultsKey: defaultsKey)
                        options.append(thisOption)
                    }
                }
            }
        }
    
    }
    
}

class Option {
    var name: String
    var isOn: Bool
    var defaultsKey: String
    
    init(name: String, defaultsKey: String) {
        self.name = name
        self.isOn = UserDefaults.standard.bool(forKey: defaultsKey)
        self.defaultsKey = defaultsKey
    }
}
