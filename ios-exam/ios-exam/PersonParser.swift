//
//	PersonParser.swift
//
//	Create by Marlon Boncodin on 30/7/2017
//	Copyright © 2017 New World Solutions Inc.,. All rights reserved.

import Foundation
import CoreData

class PersonParser : NSManagedObject{

	@NSManaged var address : String!
	@NSManaged var birthday : String!
	@NSManaged var contactPerson : String!
	@NSManaged var contactPersonNumber : String!
	@NSManaged var firstName : String!
	@NSManaged var lastName : String!
	@NSManaged var mobileNumber : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any], context: NSManagedObjectContext)	{
		let entity = NSEntityDescription.entity(forEntityName: "Person", in: context)!
		super.init(entity: entity, insertInto: context)
		if let addressValue = dictionary["address"] as? String{
			address = addressValue
		}
		if let birthdayValue = dictionary["birthday"] as? String{
			birthday = birthdayValue
		}
		if let contactPersonValue = dictionary["contact_person"] as? String{
			contactPerson = contactPersonValue
		}
		if let contactPersonNumberValue = dictionary["contact_person_number"] as? String{
			contactPersonNumber = contactPersonNumberValue
		}
		if let firstNameValue = dictionary["first_name"] as? String{
			firstName = firstNameValue
		}
		if let lastNameValue = dictionary["last_name"] as? String{
			lastName = lastNameValue
		}
		if let mobileNumberValue = dictionary["mobile_number"] as? String{
			mobileNumber = mobileNumberValue
		}
	}


}
