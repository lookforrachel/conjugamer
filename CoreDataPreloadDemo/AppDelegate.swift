//
//  AppDelegate.swift
//  CoreDataPreloadDemo
//
//  Created by Simon Ng on 13/5/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //get defaults csv loaded flag
        let coreIsLoaded = UserDefaults.standard.bool(forKey: "coreIsLoaded")
        print((coreIsLoaded) ? "core already loaded, proceeding to view" : "preloading data")
        
        //if unset, preload data
        if(!coreIsLoaded){
            preloadData()
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // MARK: - Core Data stack
    
    lazy var applicationDocumentsDirectory: URL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.appcoda.CoreDataDemo" in the application's documents Application Support directory.
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count-1]
        }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = Bundle.main.url(forResource: "CoreDataDemo", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
        }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.appendingPathComponent("CoreDataDemo.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            let options = [ NSInferMappingModelAutomaticallyOption : true,
                            NSMigratePersistentStoresAutomaticallyOption : true]
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: options)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject
            dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
        }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
        }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
    // MARK: - CSV Parser Methods
    func parseCSV (_ contentsOfURL: URL, encoding: String.Encoding) -> [(
        id: String,
        inf: String,
        ger: String,
        partPre: String,
        partPas: String,
        aux: String,
        indPreJe: String,
        indPreTu: String,
        indPreIl: String,
        indPreNous: String,
        indPreVous: String,
        indPreIls: String,
        indImpJe: String,
        indImpTu: String,
        indImpIl: String,
        indImpNous: String,
        indImpVous: String,
        indImpIls: String,
        indPSJe: String,
        indPSTu: String,
        indPSIl: String,
        indPSNous: String,
        indPSVous: String,
        indPSIls: String,
        indFSJe: String,
        indFSTu: String,
        indFSIl: String,
        indFSNous: String,
        indFSVous: String,
        indFSIls: String,
        indConJe: String,
        indConTu: String,
        indConIl: String,
        indConNous: String,
        indConVous: String,
        indConIls: String,
        subPreJe: String,
        subPreTu: String,
        subPreIl: String,
        subPreNous: String,
        subPreVous: String,
        subPreIls: String,
        subImpJe: String,
        subImpTu: String,
        subImpIl: String,
        subImpNous: String,
        subImpVous: String,
        subImpIls: String,
        impTu: String,
        impNous: String,
        impVous: String,
        indPCJe: String,
        indPCTu: String,
        indPCIl: String,
        indPCNous: String,
        indPCVous: String,
        indPCIls: String)]? {
        
        // Load the CSV file and parse it
        let delimiter = ","
            var items:[(
            id: String,
            inf: String,
            ger: String,
            partPre: String,
            partPas: String,
            aux: String,
            indPreJe: String,
            indPreTu: String,
            indPreIl: String,
            indPreNous: String,
            indPreVous: String,
            indPreIls: String,
            indImpJe: String,
            indImpTu: String,
            indImpIl: String,
            indImpNous: String,
            indImpVous: String,
            indImpIls: String,
            indPSJe: String,
            indPSTu: String,
            indPSIl: String,
            indPSNous: String,
            indPSVous: String,
            indPSIls: String,
            indFSJe: String,
            indFSTu: String,
            indFSIl: String,
            indFSNous: String,
            indFSVous: String,
            indFSIls: String,
            indConJe: String,
            indConTu: String,
            indConIl: String,
            indConNous: String,
            indConVous: String,
            indConIls: String,
            subPreJe: String,
            subPreTu: String,
            subPreIl: String,
            subPreNous: String,
            subPreVous: String,
            subPreIls: String,
            subImpJe: String,
            subImpTu: String,
            subImpIl: String,
            subImpNous: String,
            subImpVous: String,
            subImpIls: String,
            impTu: String,
            impNous: String,
            impVous: String,
            indPCJe: String,
            indPCTu: String,
            indPCIl: String,
            indPCNous: String,
            indPCVous: String,
            indPCIls: String)]?
        
        do {
            let content = try String(contentsOf: contentsOfURL, encoding: encoding)
            //print(content)
            items = []
            let lines:[String] = content.components(separatedBy: CharacterSet.newlines) as [String]
            
            for line in lines {
                var values:[String] = []
                if line != "" {
                    // For a line with double quotes
                    // we use NSScanner to perform the parsing
                    if line.range(of: "\"") != nil {
                        var textToScan:String = line
                        var value:NSString?
                        var textScanner:Scanner = Scanner(string: textToScan)
                        while textScanner.string != "" {
                            
                            if (textScanner.string as NSString).substring(to: 1) == "\"" {
                                textScanner.scanLocation += 1
                                textScanner.scanUpTo("\"", into: &value)
                                textScanner.scanLocation += 1
                            } else {
                                textScanner.scanUpTo(delimiter, into: &value)
                            }
                            
                            // Store the value into the values array
                            let str = String.init(describing: value)
                            values.append(str)
                            
                            // Retrieve the unscanned remainder of the string
                            if textScanner.scanLocation < textScanner.string.characters.count {
                                textToScan = (textScanner.string as NSString).substring(from: textScanner.scanLocation + 1)
                            } else {
                                textToScan = ""
                            }
                            textScanner = Scanner(string: textToScan)
                        }
                        
                        // For a line without double quotes, we can simply separate the string
                        // by using the delimiter (e.g. comma)
                    } else  {
                        values = line.components(separatedBy: delimiter)
                    }
                    
                    // Put the values into the tuple and add it to the items array
                    let item = (id: values[0],
                                inf: values[1],
                                ger: values[2],
                                partPre: values[3],
                                partPas: values[4],
                                aux: values[5],
                                indPreJe: values[6],
                                indPreTu: values[7],
                                indPreIl: values[8],
                                indPreNous: values[9],
                                indPreVous: values[10],
                                indPreIls: values[11],
                                indImpJe: values[12],
                                indImpTu: values[13],
                                indImpIl: values[14],
                                indImpNous: values[15],
                                indImpVous: values[16],
                                indImpIls: values[17],
                                indPSJe: values[18],
                                indPSTu: values[19],
                                indPSIl: values[20],
                                indPSNous: values[21],
                                indPSVous: values[22],
                                indPSIls: values[23],
                                indFSJe: values[24],
                                indFSTu: values[25],
                                indFSIl: values[26],
                                indFSNous: values[27],
                                indFSVous: values[28],
                                indFSIls: values[29],
                                indConJe: values[30],
                                indConTu: values[31],
                                indConIl: values[32],
                                indConNous: values[33],
                                indConVous: values[34],
                                indConIls: values[35],
                                subPreJe: values[36],
                                subPreTu: values[37],
                                subPreIl: values[38],
                                subPreNous: values[39],
                                subPreVous: values[40],
                                subPreIls: values[41],
                                subImpJe: values[42],
                                subImpTu: values[43],
                                subImpIl: values[44],
                                subImpNous: values[45],
                                subImpVous: values[46],
                                subImpIls: values[47],
                                impTu: values[48],
                                impNous: values[49],
                                impVous: values[50],
                                indPCJe: values[51],
                                indPCTu: values[52],
                                indPCIl: values[53],
                                indPCNous: values[54],
                                indPCVous: values[55],
                                indPCIls: values[56]
)
                    
                    items?.append(item)
                }
            }

        } catch {
            print(error)
        }

        return items
    }

    func preloadData () {

        // Load the data file. For any reasons it can't be loaded, we just return
        guard let remoteURL = URL(string: "http://www.rachelyee.com/VerbsImported100817.csv") else {
            return
        }
        
        // Remove all the menu items before preloading
        removeData()
        
        if let items = parseCSV(remoteURL, encoding: String.Encoding.utf8) {
            // Preload the menu items
            for item in items {
                let myVerbb = NSEntityDescription.insertNewObject(forEntityName: "Verbb", into: managedObjectContext) as! Verbb
                let thisConjugation = NSEntityDescription.insertNewObject(forEntityName: "Verbb", into: managedObjectContext) as! Conjugation
                
                
//                let Verb = NSEntityDescription.insertNewObject(forEntityName: "Verb", into: managedObjectContext) as! Verb
//                Verb.id = item.id
//                Verb.inf = item.inf
//                Verb.ger = item.ger
//                Verb.partPre = item.partPre
//                Verb.partPas = item.partPas
//                Verb.aux = item.aux
//                Verb.indPreJe = item.indPreJe
//                Verb.indPreTu = item.indPreTu
//                Verb.indPreIl = item.indPreIl
//                Verb.indPreNous = item.indPreNous
//                Verb.indPreVous = item.indPreVous
//                Verb.indPreIls = item.indPreIls
//                Verb.indImpJe = item.indImpJe
//                Verb.indImpTu = item.indImpTu
//                Verb.indImpIl = item.indImpIl
//                Verb.indImpNous = item.indImpNous
//                Verb.indImpVous = item.indImpVous
//                Verb.indImpIls = item.indImpIls
//                Verb.indPSJe = item.indPSJe
//                Verb.indPSTu = item.indPSTu
//                Verb.indPSIl = item.indPSIl
//                Verb.indPSNous = item.indPSNous
//                Verb.indPSVous = item.indPSVous
//                Verb.indPSIls = item.indPSIls
//                Verb.indFSJe = item.indFSJe
//                Verb.indFSTu = item.indFSTu
//                Verb.indFSIl = item.indFSIl
//                Verb.indFSNous = item.indFSNous
//                Verb.indFSVous = item.indFSVous
//                Verb.indFSIls = item.indFSIls
//                Verb.indConJe = item.indConJe
//                Verb.indConTu = item.indConTu
//                Verb.indConIl = item.indConIl
//                Verb.indConNous = item.indConNous
//                Verb.indConVous = item.indConVous
//                Verb.indConIls = item.indConIls
//                Verb.subPreJe = item.subPreJe
//                Verb.subPreTu = item.subPreTu
//                Verb.subPreIl = item.subPreIl
//                Verb.subPreNous = item.subPreNous
//                Verb.subPreVous = item.subPreVous
//                Verb.subPreIls = item.subPreIls
//                Verb.subImpJe = item.subImpJe
//                Verb.subImpTu = item.subImpTu
//                Verb.subImpIl = item.subImpIl
//                Verb.subImpNous = item.subImpNous
//                Verb.subImpVous = item.subImpVous
//                Verb.subImpIls = item.subImpIls
//                Verb.impTu = item.impTu
//                Verb.impNous = item.impNous
//                Verb.impVous = item.impVous
//                Verb.indPCJe = item.indPCJe
//                Verb.indPCTu = item.indPCTu
//                Verb.indPCIl = item.indPCIl
//                Verb.indPCNous = item.indPCNous
//                Verb.indPCVous = item.indPCVous
//                Verb.indPCIls = item.indPCIls
        
                do {
                    try managedObjectContext.save()
                    
                    //set defaults csv loaded flag to true
                    UserDefaults.standard.set(true, forKey: "coreIsLoaded")
                    UserDefaults.standard.synchronize()
                } catch {
                    print(error)
                }
            }
        
        }
    }
    
    func removeData () {
        // Remove the existing items
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Verb")
        
        do {
            let Verbs = try managedObjectContext.fetch(fetchRequest) as! [Verb]
            for Verb in Verbs {
                managedObjectContext.delete(Verb)
            }
        } catch {
            print(error)
        }

    }

}

