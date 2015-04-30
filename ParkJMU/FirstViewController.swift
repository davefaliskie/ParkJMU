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

    var locations = ["Loading...", "Loading..."]
    
// Spot Label
    
    let spots = Spots()
    
    @IBOutlet weak var AvailableSpotsLabel: UILabel!

// Change Button 
    

    @IBAction func LotResetButton(sender: AnyObject) {
        reloadInputViews()
    }
    

    @IBOutlet weak var SpacesLabel: UILabel!

    @IBOutlet weak var CapacityLabel: UILabel!
    
    @IBOutlet weak var BackupLabel: UILabel!
    
// ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        for the picker view
        lotPicker.dataSource = self
        lotPicker.delegate = self
        
        
//        for the JSON Data retreival
        
        var lotKey = ""
        
        let baseURL = NSURL(string: "http://134.126.65.63/getlotdata.php")
        let lotURL = NSURL(string: "\(lotKey)", relativeToURL: baseURL)
        
        let sharedSession = NSURLSession.sharedSession()
        
        let downloadTask: NSURLSessionDownloadTask =
            sharedSession.downloadTaskWithURL(lotURL!,
            completionHandler: { (location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
                
//                Gets the JSON data fron the URL
                let dataObject = NSData(contentsOfURL: location)
                
//                Gets the JSON dictionary using the JSON data
                let lotDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil) as! NSDictionary
                
                let spot_label_names = GetLotNames(lotDictionary)
                self.locations = spot_label_names as! [String]
                
                self.lotPicker.reloadAllComponents()
            
                
                    
//                   Calls the Current struct to build current lot data
                
                let num = Singleton.instance.lot_row
                
                let currentParkingLot = Current(lotDictionary: lotDictionary, lot_num: num)
                
                println(currentParkingLot.available)
                self.AvailableSpotsLabel.text = currentParkingLot.available
                self.SpacesLabel.text = currentParkingLot.lot_name
                self.CapacityLabel.text = currentParkingLot.capacity
                self.BackupLabel.text = currentParkingLot.backup_lot
        })
        

        downloadTask.resume()
        
        
    }
    
// didRecieveMemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    class Singleton {
        
        
        static let instance = Singleton()
        
        var lot_row: Int = 0
        
        init() { }
        
    }
    
// data sources for the lot_picker
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locations.count
    }

    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = locations[row]
        var myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,NSForegroundColorAttributeName:UIColor.blackColor()])
        return myTitle
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        var item_selected = locations[row]
//        SpacesLabel.text = item_selected
        Singleton.instance.lot_row = row
        viewDidLoad()
        
    }
    



}

