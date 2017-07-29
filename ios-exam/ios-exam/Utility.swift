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
        f.dateFormat = "dd/MM/yy"
        
        return f.string(from: date)
        
    }
    
    class func getAge(_ birth:String) -> Int16 {
        let f = DateFormatter()
        //f.timeZone = NSTimeZone.localTimeZone()
        f.timeZone = TimeZone(abbreviation: "UTC");
        f.dateFormat = "YYYY-MM-DD"
        
        let startDate = f.date(from: birth)
        let calendar = Calendar.current
        
        let dateComponents = (calendar as NSCalendar).components([.month,.weekOfMonth,.hour, .day, .minute, .second], from: startDate!, to: Date(), options: [])
        
        let year = Int16(abs(dateComponents.month!))
        
        return year
    }
    

}
