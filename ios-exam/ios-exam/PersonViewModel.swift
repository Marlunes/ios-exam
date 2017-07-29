//
//  PersonViewModel.swift
//  ios-exam
//
//  Created by Marlon Boncodin on 30/07/2017.
//  Copyright © 2017 Marlon Boncodin. All rights reserved.
//

import UIKit
import CoreData
import Alamofire

class PersonViewModel: NSObject {
    
    func getPersonsData() -> [Person]{
        
        let cachedPerson = getDataFromCoreData()
        return cachedPerson
        
    }
    
    func getDataFromCoreData() -> [Person]{
        
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        let context = Database.persistentContainer.viewContext
        
        do{
            let persons = try context.fetch(fetchRequest)
            return persons
        }catch{
            
            print("Error On Fething Person: \(error.localizedDescription)")
            
        }
        
        return []
        
    }
    
    func getPersonDataFromRemoteServer(completed: @escaping ((_ success: Bool) -> Void)){
        
        //for the demo, the app will pull 8 ramdom users
        let resultsParam = "8"
        
        let url = "https://randomapi.com/api/6396f911938d4f237f3371c4ba876115?results=\(resultsParam)"
        Alamofire.request(url).responseJSON { response in
            
            if let json = response.result.value as? NSDictionary{
                if let results = json["results"] as? [NSDictionary]{
                    for dict in results{
                        if let converted = dict as? [String: Any]{
                            _ = PersonParser.parse(fromDictionary: converted)
                        }
                    }
                    completed(true)
                }else{
                    completed(false)
                }
            }else{
                completed(false)
            }
            
        }
        
    }

}
