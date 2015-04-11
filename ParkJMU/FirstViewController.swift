//
//  FirstViewController.swift
//  ParkJMU
//
//  Created by David Faliskie on 4/10/15.
//  Copyright (c) 2015 David Faliskie. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
// lot picker.
    @IBOutlet weak var lotPicker: UIPickerView!
    
    let locations = ["C10", "Convo", "D2", "Festival", "UREC", "R7"]

// Spot Label
    
    let spots = Spots()
    
    @IBOutlet weak var AvailableSpotsLabel: UILabel!

// Change Button 
    

    @IBAction func LotResetButton() {
        AvailableSpotsLabel.text = spots.randomSpace()
    }
    

    
// ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        lotPicker.dataSource = self
        lotPicker.delegate = self
        AvailableSpotsLabel.text = spots.randomSpace()
        
    }
// didRecieveMemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
// data sources for the lot_picker
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locations.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return locations[row]
    }
    



}

