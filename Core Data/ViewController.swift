//
//  ViewController.swift
//  Core Data
//
//  Created by Jorge Duque on 12/11/16.
//  Copyright © 2016 Jorgeduque. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //STEP 1: Create Data Model in Core_Data.xcdatamodelid
        
        //STEP 2: Methods to access Core Data
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        

        /* STEP 3: Create a new Users Object and save it into Users Entity
       
        //Set values for new object
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        newUser.setValue("jorge", forKey: "username")
        newUser.setValue("myPass", forKey: "password")
        newUser.setValue(5, forKey: "age")
        
        //Save the context
        do{
            try context.save()
            print("saved")
         } catch{
            print("There was an error")
         }
         
         */
        
        //STEP 4: Fetch Data from Core Data
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Users")
        request.returnsObjectsAsFaults = false
        
        /* Specific Queries
            //search for users with username "jorge"
            request.predicate = NSPredicate(format: "username = %@", "jorge")
            
            //search for users that are less that 10 years old
            request.predicate = NSPredicate(format: "age < %@", "10")
        */
        
        do{
            let results = try context.fetch(request)
            if results.count > 0{
                for result in results as! [NSManagedObject]{
                    
                    //If username was found, attempt to cast as string and print
                    if let username = result.value(forKey: "username") as? String{
                        
                        print(username)
                        
                    /* Optional Methods when username is found
                         //DELETE
                        context.delete(result)
                        do{
                            try context.save()
                            
                        } catch{
                            print("delete failed")
                        }
                        
                       //EDIT
                        result.setValue("Dooley", forKey: "username")
                        do{
                            try context.save()
                            print (username)
                        } catch{
                            print("rename failed")
                        }
                    */
                        
                    }
                }
            } else{
                print("No results")
                }
            } catch{
            print("couldn't fetch results")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

