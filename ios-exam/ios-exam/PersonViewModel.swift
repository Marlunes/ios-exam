//
//  PersonViewModel.swift
//  ios-exam
//
//  Created by Marlon Boncodin on 30/07/2017.
//  Copyright © 2017 Marlon Boncodin. All rights reserved.
//

import UIKit
import CoreData

class PersonViewModel: NSObject {
    
    /*
     if there is a cache, the app will get the data from storage
     otherwise pull the data from the remote server.
    */
    func getPersonsData(completion: ((_ data: [Person]) -> Void)){
        
        let cachedPerson = getDataFromCoreData()
        if cachedPerson.count > 0{
            completion(cachedPerson)
        }else{
            
        }
        
    }
    
    func getDataFromCoreData() -> [Person]{
        
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        let context = AppDelegate().persistentContainer.viewContext
        
        do{
            let persons = try context.fetch(fetchRequest)
            return persons
        }catch{
            
            print("Error On Fething Person: \(error.localizedDescription)")
            
        }
        
        return []
        
    }
    
    func getPersonDataFromRemoteServer(completion: (_ data: [Person]) -> Void)){
    
    }

}
