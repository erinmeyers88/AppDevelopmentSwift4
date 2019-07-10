//
//  RegistrationTableViewController.swift
//  HotelManzana
//
//  Created by Erin Vincent on 7/10/19.
//  Copyright © 2019 Erin Vincent. All rights reserved.
//

import UIKit

class RegistrationTableViewController: UITableViewController {

    var registrations: [Registration] = []
    var selectedRegistration: Registration?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return registrations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationCell", for: indexPath)

        let registration = registrations[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        cell.textLabel?.text = registration.firstName + " " +
            registration.lastName
        cell.detailTextLabel?.text = dateFormatter.string(from:
            registration.checkInDate) + " - " +
            dateFormatter.string(from: registration.checkOutDate) + ": "
            + registration.roomType.name

        return cell
    }
 
    @IBAction func unwindFromAddRegistration(unwindSegue: UIStoryboardSegue) {
        
        guard let addRegistrationTableViewController = unwindSegue.source as? AddRegistrationTableViewController, let registration = addRegistrationTableViewController.registration else { return }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            print("selected append")
            registrations.remove(at: selectedIndexPath.row)
            registrations.append(registration)
        } else {
            registrations.append(registration)
        }
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else {return}
        if segue.identifier == "ShowSavedRegistration" {
            print("here")
            let destinationViewController = segue.destination.children[0] as? AddRegistrationTableViewController
            destinationViewController?.selectedRegistration = registrations[selectedIndexPath.row]
        }
    }

}
