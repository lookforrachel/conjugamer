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

class Options {
    
    //var name: String
    var verbOptions = [VerbOption]()
    //var isOn: Bool
    
    init() {
        
        for value in optionKeys{
            guard let thisverbgroup = VerbGroup(rawValue:value) else {
                fatalError()
            }
            let thisVerbOption = VerbOption(group: thisverbgroup)
            verbOptions.append(thisVerbOption)
            
        }
        
        for val in verbOptions{
            print(val.group)
        }
        
        print(verbOptions.count)
        
    }
    
}

enum VerbGroup:String {
    
    case VerbGroup1 = "isGroup1On"
    case VerbGroup2 = "isGroup2On"
    case VerbGroup3 = "isGroup3On"
    
}

class VerbOption {
    var isOn: Bool
    var group: VerbGroup
    
    init(group: VerbGroup){
        self.group = group
        print(self.group.rawValue)
        
        self.isOn = UserDefaults.standard.bool(forKey: self.group.rawValue)
        
        
    }
    
}
