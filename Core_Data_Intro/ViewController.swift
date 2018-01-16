//
//  ViewController.swift
//  Core_Data_Intro
//
//  Created by Charlie Cuddy on 1/13/18.
//  Copyright © 2018 Charlie Cuddy. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
/*
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("Josie", forKey: "username")
        newUser.setValue("myPassword", forKey: "password")
        newUser.setValue(3, forKey: "age")
        
        do {
            
            try context.save()
            print("Saved")
            
        } catch {
            
            
            print("There was an error")
            
        }
 */
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        //request.predicate = NSPredicate(format: "username = %@", "Josie")
        
        request.returnsObjectsAsFaults = false
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                
                    if let username = result.value(forKey: "username") as? String {
/*
                        context.delete(result)
                        
                        do {
                            
                            try context.save()
                            
                        } catch {
                            
                            print("Delete failed")
                            
                        }
*/
/*
                        result.setValue("That one guy", forKey: "username")
                        
                        do {
                            
                            try context.save()
                            print(username)
                            
                        } catch {
                            
                            print("Rename failed")
                            
                        }
*/
                        print(username)
                    }
                    
                }
                
            } else {
                
                print("No results")
                
            }
            
        } catch {
            
            print("Couldn't fetch results")
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

