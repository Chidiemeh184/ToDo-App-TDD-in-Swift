//
//  InputViewController.swift
//  ToDo
//
//  Created by Chidi Emeh on 3/19/19.
//  Copyright © 2019 Chidi Emeh. All rights reserved.
//

import UIKit
import CoreLocation

class InputViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    lazy var geocoder = CLGeocoder()
    var itemManager: ItemManager?
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save() {
        guard let titleString = titleTextField.text,
            titleString.count > 0 else { return }
        let date: Date?
        if let dateText = self.dateTextField.text,
            dateText.count > 0 {
            date = dateFormatter.date(from: dateText)
        } else {
            date = nil
        }
        
        let descriptionString = descriptionTextField.text
        if let locationName = locationTextField.text,
            locationName.count > 0 {
            if let address = addressTextField.text, address.count > 0 {
                
                geocoder.geocodeAddressString(address) { [unowned self](placemarks, error) in
                    let placeMark = placemarks?.first
                    let timestamp = 1456095600.0
                    
                    let item = ToDoItem(title: titleString, itemDescription: descriptionString, timestamp: timestamp, location: Location(name: locationName, coordinate: placeMark?.location?.coordinate))
                    
                    self.itemManager?.add(item)
                    
                }
            }
        }
    }
}
