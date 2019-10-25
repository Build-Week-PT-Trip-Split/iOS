//
//  SetDateVC.swift
//  Split Trip
//
//  Created by Eoin Lavery on 23/10/2019.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class SetDateVC: UIViewController {

    @IBOutlet weak var setDatePicker: UIDatePicker!
    var selectedDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let date = selectedDate {
            dismissViewController(withDate: date)
        }
    }

    @IBAction func dateChanged(_ sender: Any) {
        selectedDate = setDatePicker.date
    }
    
    func dismissViewController(withDate date: Date) {
        if let presenterVC = presentingViewController as? AddTripVC {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            presenterVC.tripDate = dateFormatter.string(from: date)
        }
        dismiss(animated: true, completion: nil)
    }
    
}
