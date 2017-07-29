//
//	PersonParser.swift
//
//	Create by Marlon Boncodin on 30/7/2017
//	Copyright © 2017 New World Solutions Inc.,. All rights reserved.

import Foundation
import CoreData

class PersonParser : NSManagedObject{

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	class func parse(fromDictionary dictionary: [String:Any])	{
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Person", into: AppDelegate().persistentContainer.viewContext) as! Person
        if let addressValue = dictionary["address"] as? String{
            entity.address = addressValue
        }
        if let birthdayValue = dictionary["birthday"] as? String{
            entity.birthday = Utility.convertToDate(birthdayValue) as NSDate
            entity.age = Utility.getAge(birthdayValue)
        }
        if let contactPersonValue = dictionary["contact_person"] as? String{
            entity.contactPerson = contactPersonValue
        }
        if let contactPersonNumberValue = dictionary["contact_person_number"] as? String{
            entity.contactPersonNumber = contactPersonNumberValue
        }
        if let firstNameValue = dictionary["first_name"] as? String{
            entity.firstName = firstNameValue
        }
        if let lastNameValue = dictionary["last_name"] as? String{
            entity.lastName = lastNameValue
        }
        if let mobileNumberValue = dictionary["mobile_number"] as? String{
            entity.mobileNumber = mobileNumberValue
        }
        
        AppDelegate().saveContext()
	}


}

