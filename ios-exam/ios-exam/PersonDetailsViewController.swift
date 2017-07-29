//
//  PersonDetailsViewController.swift
//  ios-exam
//
//  Created by Marlon Boncodin on 30/07/2017.
//  Copyright © 2017 Marlon Boncodin. All rights reserved.
//

import UIKit

class PersonDetailsViewController: UIViewController {

    @IBOutlet weak var fnameLabel: UILabel!
    @IBOutlet weak var lnameLabel: UILabel!
    @IBOutlet weak var bdayLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var contactPersonLabel: UILabel!
    @IBOutlet weak var contactPersonNumberLabel: UILabel!
    
    var person : Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setDetails()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setDetails(){
        fnameLabel.text = person.firstName ?? ""
        lnameLabel.text = person.lastName ?? ""
        bdayLabel.text = Utility.getDateString(person.birthday! as Date) ?? ""
        ageLabel.text = "\(Utility.getAge(person.birthday! as Date))"
        addressLabel.text = person.address ?? ""
        mobileLabel.text = person.mobileNumber ?? ""
        contactPersonLabel.text = person.contactPerson ?? ""
        contactPersonNumberLabel.text = person.contactPersonNumber ?? ""
    }

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
