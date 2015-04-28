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
//        AvailableSpotsLabel.text = spots.randomSpace()
    }
    

    @IBOutlet weak var SpacesLabel: UILabel!
    
    


    
// ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        for the picker view
        lotPicker.dataSource = self
        lotPicker.delegate = self
        
//        for the spots label
//        AvailableSpotsLabel.text = spots.randomSpace()
        
//        for the JSON Data retreival
        var lotKey = "?lot=C10"
        
        let baseURL = NSURL(string: "http://134.126.65.63/getlotdata.php")
        let lotURL = NSURL(string: "\(lotKey)", relativeToURL: baseURL)
        
        
        let sharedSession = NSURLSession.sharedSession()
        
        let downloadTask: NSURLSessionDownloadTask =
            sharedSession.downloadTaskWithURL(lotURL!,
            completionHandler: { (location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
                
//            CHECKS FOR JSON DATA AND RETURNS IT
//            var urlContents = NSString(contentsOfURL: location, encoding: NSUTF8StringEncoding, error: nil)
//            println(urlContents)
            
                if(error == nil){
                    
                    let dataObject = NSData(contentsOfURL: location)
                    
                    let lotDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil) as! NSDictionary
                    
                    let currentLotName: NSArray = lotDictionary["LotResults"] as! NSArray
                    
                    let LotName: NSDictionary = currentLotName[0] as! NSDictionary
                    
                    self.SpacesLabel.text =  (LotName["lot_name"] as! String)
                    
                    self.AvailableSpotsLabel.text = (LotName["available"] as! String)
                
                }
                
        })
        

        downloadTask.resume()
        
        
        
        
    
        
        
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

    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = locations[row]
        var myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,NSForegroundColorAttributeName:UIColor.blackColor()])
        return myTitle
    }
    



}

