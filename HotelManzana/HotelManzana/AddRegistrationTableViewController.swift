//
//  AddRegistrationTableViewController.swift
//  HotelManzana
//
//  Created by Erin Vincent on 7/9/19.
//  Copyright © 2019 Erin Vincent. All rights reserved.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {

    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    @IBOutlet weak var wifiSwitch: UISwitch!
    @IBOutlet weak var roomTypeLabel: UILabel!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    var selectedRegistration: Registration?
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var roomType: RoomType?
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
           loadSelectedRegistration()
        
        updateDateViews()
        updateNumberOfGuests()
        updateRoomType()
        updateDoneButton()
    }
    
   
    
    func loadSelectedRegistration() {
        if let firstName = selectedRegistration?.firstName {
            firstNameTextField?.text = firstName
        }
        if let lastName = selectedRegistration?.lastName  {
            lastNameTextField.text = lastName
        }
        
        if let email = selectedRegistration?.emailAddress {
            emailTextField.text = email
        }

        if let checkInDate = selectedRegistration?.checkInDate {
            checkInDatePicker.date = checkInDate
        }

        if let checkOutDate = selectedRegistration?.checkOutDate {
            checkOutDatePicker.date = checkOutDate
        }

        if let adults = selectedRegistration?.numberOfAdults {
            numberOfAdultsStepper.value = Double(adults)
        }

        if let children = selectedRegistration?.numberOfChildren {
            numberOfChildrenStepper.value = Double(children)
        }

        if let wifi = selectedRegistration?.wifi {
            wifiSwitch.isOn = wifi
        }
        
        if let selectedRoomType = selectedRegistration?.roomType {
            roomType = selectedRoomType
        }
        
    }
    
    func updateDateViews() {
        
        checkOutDatePicker.minimumDate =
        checkInDatePicker.date.addingTimeInterval(86400)
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        
        checkInDateLabel.text = dateFormatter.string(from:
            checkInDatePicker.date)
        
        checkOutDateLabel.text = dateFormatter.string(from:
            checkOutDatePicker.date)
        
        updateDoneButton()
        
    }
    
    @IBAction func datePickerValueChanged(_sender: UIDatePicker) {
        updateDateViews()
    }
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section:
        1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section:
        1)
    
    var isCheckInDatePickerShown: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    
    var isCheckOutDatePickerShown: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerShown
        }
    }
 
    override func tableView(_ tableView: UITableView,
                               heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) {
        case (checkInDatePickerCellIndexPath.section,
              checkInDatePickerCellIndexPath.row):
            if isCheckInDatePickerShown {
                return 216.0
            } else {
                return 0.0
            }
        case (checkOutDatePickerCellIndexPath.section,
              checkOutDatePickerCellIndexPath.row):
            if isCheckOutDatePickerShown {
                return 216.0
            } else {
                return 0.0
            }
        default:
            return 44.0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch (indexPath.section, indexPath.row) {
        case (checkInDatePickerCellIndexPath.section,
              checkInDatePickerCellIndexPath.row - 1):
            
            if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
            } else if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
                isCheckInDatePickerShown = true
            } else {
                isCheckInDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        case (checkOutDatePickerCellIndexPath.section,
              checkOutDatePickerCellIndexPath.row - 1):
            if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
            } else if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
                isCheckOutDatePickerShown = true
            } else {
                isCheckOutDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        default:
            break
        }
    }
    
    func updateNumberOfGuests() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
        updateDoneButton()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
        
    }
    
    func updateRoomType() {
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
        } else {
            roomTypeLabel.text = "Not Set"
        }
        updateDoneButton()
    }
    
    func didSelect(roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectRoomType" {
        let destinationViewController = segue.destination as? SelectRoomTypeTableViewController
        destinationViewController?.delegate = self
        destinationViewController?.roomType = roomType
        }
    }
    
    func updateDoneButton() {
     doneButton.isEnabled = self.registration != nil
    }
    
    var registration: Registration? {
        
        guard let roomType = roomType else {return nil}
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        
        
        
        return Registration(firstName: firstName, lastName: lastName, emailAddress: email, checkInDate: checkInDate, checkOutDate: checkOutDate, numberOfAdults: numberOfAdults, numberOfChildren: numberOfChildren, roomType: roomType, wifi: hasWifi)
    
    }
    
}
