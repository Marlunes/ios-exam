//
//  Utility.swift
//  ios-exam
//
//  Created by Marlon Boncodin on 30/07/2017.
//  Copyright © 2017 Marlon Boncodin. All rights reserved.
//

import UIKit

class Utility: NSObject {
    
    class func convertToDate(_ dateStr: String) -> Date{
        
        let f1 = DateFormatter()
        f1.timeZone = TimeZone(abbreviation: "UTC");
        f1.dateFormat = "YYYY-MM-DD"
        
        let date = f1.date(from: dateStr)
        
        return date!
        
    }
        
    class func getDateString(_ date : Date) -> String!{
        
        let f = DateFormatter()
        f.timeZone = TimeZone.autoupdatingCurrent
        f.dateFormat = "MMMM dd, yyyy"
        
        return f.string(from: date)
        
    }
    
    class func getAge(_ birth: Date) -> Int16 {
        let calendar = Calendar.current
        
        let dateComponents = (calendar as NSCalendar).components([.year], from: birth, to: Date(), options: [])
        
        let year = Int16(abs(dateComponents.year!))
        
        return year
    }
    

}
