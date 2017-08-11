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
    func parseCSV (_ contentsOfURL: URL, encoding: String.Encoding) -> [(id: String,
        inf: String,
        ger: String,
        prePart: String,
        pastPart: String,
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
        aux: String,
        indPCJe: String,
        indPCTu: String,
        indPCIl: String,
        indPCNous: String,
        indPCVous: String,
        indPCIls: String)]? {
        
        // Load the CSV file and parse it
        let delimiter = ","
            var items:[(id: String,
            inf: String,
            ger: String,
            prePart: String,
            pastPart: String,
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
            aux: String,
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
                                prePart: values[3],
                                pastPart: values[4],
                                indPreJe: values[5],
                                indPreTu: values[6],
                                indPreIl: values[7],
                                indPreNous: values[8],
                                indPreVous: values[9],
                                indPreIls: values[10],
                                indImpJe: values[11],
                                indImpTu: values[12],
                                indImpIl: values[13],
                                indImpNous: values[14],
                                indImpVous: values[15],
                                indImpIls: values[16],
                                indPSJe: values[17],
                                indPSTu: values[18],
                                indPSIl: values[19],
                                indPSNous: values[20],
                                indPSVous: values[21],
                                indPSIls: values[22],
                                indFSJe: values[23],
                                indFSTu: values[24],
                                indFSIl: values[25],
                                indFSNous: values[26],
                                indFSVous: values[27],
                                indFSIls: values[28],
                                indConJe: values[29],
                                indConTu: values[30],
                                indConIl: values[31],
                                indConNous: values[32],
                                indConVous: values[33],
                                indConIls: values[34],
                                subPreJe: values[35],
                                subPreTu: values[36],
                                subPreIl: values[37],
                                subPreNous: values[38],
                                subPreVous: values[39],
                                subPreIls: values[40],
                                subImpJe: values[41],
                                subImpTu: values[42],
                                subImpIl: values[43],
                                subImpNous: values[44],
                                subImpVous: values[45],
                                subImpIls: values[46],
                                impTu: values[47],
                                impNous: values[48],
                                impVous: values[49],
                                aux: values[50],
                                indPCJe: values[5],
                                indPCTu: values[6],
                                indPCIl: values[7],
                                indPCNous: values[8],
                                indPCVous: values[9],
                                indPCIls: values[10])
                    
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
                let verbDatabase = NSEntityDescription.insertNewObject(forEntityName: "VerbDatabase", into: managedObjectContext) as! VerbDatabase
                verbDatabase.id = item.id
                verbDatabase.inf = item.inf
                verbDatabase.ger = item.ger
                verbDatabase.prePart = item.prePart
                verbDatabase.pastPart = item.pastPart
                verbDatabase.indPreJe = item.indPreJe
                verbDatabase.indPreTu = item.indPreTu
                verbDatabase.indPreIl = item.indPreIl
                verbDatabase.indPreNous = item.indPreNous
                verbDatabase.indPreVous = item.indPreVous
                verbDatabase.indPreIls = item.indPreIls
                verbDatabase.indImpJe = item.indImpJe
                verbDatabase.indImpTu = item.indImpTu
                verbDatabase.indImpIl = item.indImpIl
                verbDatabase.indImpNous = item.indImpNous
                verbDatabase.indImpVous = item.indImpVous
                verbDatabase.indImpIls = item.indImpIls
                verbDatabase.indPSJe = item.indPSJe
                verbDatabase.indPSTu = item.indPSTu
                verbDatabase.indPSIl = item.indPSIl
                verbDatabase.indPSNous = item.indPSNous
                verbDatabase.indPSVous = item.indPSVous
                verbDatabase.indPSIls = item.indPSIls
                verbDatabase.indFSJe = item.indFSJe
                verbDatabase.indFSTu = item.indFSTu
                verbDatabase.indFSIl = item.indFSIl
                verbDatabase.indFSNous = item.indFSNous
                verbDatabase.indFSVous = item.indFSVous
                verbDatabase.indFSIls = item.indFSIls
                verbDatabase.indConJe = item.indConJe
                verbDatabase.indConTu = item.indConTu
                verbDatabase.indConIl = item.indConIl
                verbDatabase.indConNous = item.indConNous
                verbDatabase.indConVous = item.indConVous
                verbDatabase.indConIls = item.indConIls
                verbDatabase.subPreJe = item.subPreJe
                verbDatabase.subPreTu = item.subPreTu
                verbDatabase.subPreIl = item.subPreIl
                verbDatabase.subPreNous = item.subPreNous
                verbDatabase.subPreVous = item.subPreVous
                verbDatabase.subPreIls = item.subPreIls
                verbDatabase.subImpJe = item.subImpJe
                verbDatabase.subImpTu = item.subImpTu
                verbDatabase.subImpIl = item.subImpIl
                verbDatabase.subImpNous = item.subImpNous
                verbDatabase.subImpVous = item.subImpVous
                verbDatabase.subImpIls = item.subImpIls
                verbDatabase.impTu = item.impTu
                verbDatabase.impNous = item.impNous
                verbDatabase.impVous = item.impVous
                verbDatabase.aux = item.aux
                verbDatabase.indPCJe = item.indPCJe
                verbDatabase.indPCTu = item.indPCTu
                verbDatabase.indPCIl = item.indPCIl
                verbDatabase.indPCNous = item.indPCNous
                verbDatabase.indPCVous = item.indPCVous
                verbDatabase.indPCIls = item.indPCIls
        
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
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "VerbDatabase")
        
        do {
            let VerbDatabases = try managedObjectContext.fetch(fetchRequest) as! [VerbDatabase]
            for verbDatabase in VerbDatabases {
                managedObjectContext.delete(verbDatabase)
            }
        } catch {
            print(error)
        }

    }

}

