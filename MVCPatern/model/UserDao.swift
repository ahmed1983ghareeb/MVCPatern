//
//  UserDao.swift
//  MVCPatern
//
//  Created by Ahmed Ghareeb on 2019-06-03.
//  Copyright © 2019 Ahmed Ghareeb. All rights reserved.
//

import Foundation
import CoreData

class UserDao{
    let appDelegate: AppDelegate?
    
    
    init(delegate: AppDelegate){
        appDelegate = delegate
    }
    
    func getManagedContext() -> NSManagedObjectContext? {
        guard let managedContext =  appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        return managedContext
        
    }
    
    func getUserByUserName(username: String)-> User?{
       // var user = User()
        
        let context = getManagedContext()!
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "username = %@", username)
        
        do{
            let result = try context.fetch(fetchRequest)
            if result.count > 0{
                let user = result[0] as! User
                return user
            }else{
                print("Error fetching user with username = \(username)")
                return nil
            }
            }catch{
                print("can not fetch from coreData!")
                return nil
            }
    }
    
    func saveUser(user: User)->Bool{
        
        let context = getManagedContext()!
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "username = %@", user.username!)
        
        do{
            let result = try context.fetch(fetchRequest)
            if result.count > 0{
                print("user alredy exist!!!")
                return false
            }
        }catch{
            print("Error fetching data")
        }
        
        let userToSave = User(context: context)
        userToSave.username = user.username
        userToSave.password = user.password
        
        do{
            try context.save()
            print("user saved successfully!")
            return true
        }catch{
            print("Error saving to coredata")
            return false
        }
    }
    
    func getAllUsers() -> [User]{
        
        let context = getManagedContext()!
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        do{
            let result = try context.fetch(fetchRequest)
            if result.count > 0 {
            return (result as? [User])!
            }else {
                print("Error! not users registered!!!")
                return []
            }
        }catch{
            print("fectch users faild!!!")
            return []
        }
    }
}
