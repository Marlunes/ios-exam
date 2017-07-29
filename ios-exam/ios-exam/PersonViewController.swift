//
//  PersonViewController.swift
//  ios-exam
//
//  Created by Marlon Boncodin on 30/07/2017.
//  Copyright © 2017 Marlon Boncodin. All rights reserved.
//

import UIKit
import MBProgressHUD

class PersonViewController: UIViewController {

    @IBOutlet weak var personsTableView: UITableView!
    @IBOutlet var viewModel: PersonViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*
         if there is a cache, the app will get the data from storage
         otherwise pull the data from the remote server.
         */
        if viewModel.getPersonsData().count == 0{
            MBProgressHUD.showAdded(to: self.view, animated: true)
            viewModel.getPersonDataFromRemoteServer(completed: { success in
                MBProgressHUD.hide(for: self.view, animated: true)
                self.personsTableView.reloadData()
            })
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension PersonViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getPersonsData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let persons = viewModel.getPersonsData()
        let identifier =  "generic"
        let cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        let fname = persons[indexPath.row].firstName ?? ""
        let lname = persons[indexPath.row].lastName ?? ""
        cell.textLabel?.text = "\(fname) \(lname)"

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
