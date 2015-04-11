//
//  SecondViewController.swift
//  Park @ JMU
//
//  Created by David Faliskie on 3/19/15.
//  Copyright (c) 2015 David Faliskie. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SecondViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    
    @IBOutlet weak var map: MKMapView!
    
    let locationManager = CLLocationManager()
    var manager:CLLocationManager!
    var myLocations: [CLLocation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //   Code for getting the current location
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
        
        //Setup our Map View
        map.delegate = self
        map.mapType = MKMapType.Satellite
        map.showsUserLocation = true
        
        //  Code for displaying the MAP
        //      var centerLocation = CLLocationCoordinate2DMake(38.4343708, -78.8622934)
        
        //        var currentLocation = map.userLocation.coordinate
        //
        //        var mapSpan = MKCoordinateSpanMake(0.01, 0.01)
        //
        //        var mapRegion = MKCoordinateRegionMake(currentLocation, mapSpan)
        //
        //        self.map.setRegion(mapRegion, animated: true)
        
        //        var newRegion = MKCoordinateRegion(center: map.userLocation.coordinate, span: MKCoordinateSpanMake(spanX, spanY))
        //        map.setRegion(newRegion, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
    //        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: { (placemarks, error) -> Void in
    //
    //            if(error != nil) {
    //                println("Error:" + error.localizedDescription)
    //                return
    //            }
    //            if placemarks.count > 0 {
    //                let pm = placemarks[0] as CLPlacemark
    //                self.displayLocationInfo(pm)
    //            }
    //            else{
    //                println("Error with Data")
    //            }
    //        })
    //    }
    
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
        //        mapLabel.text = "\(locations[0])"
        myLocations.append(locations[0] as! CLLocation)
        
        var currentLocation = map.userLocation.coordinate
        
        var mapSpan = MKCoordinateSpanMake(0.01, 0.01)
        
        var mapRegion = MKCoordinateRegionMake(currentLocation, mapSpan)
        
        self.map.setRegion(mapRegion, animated: true)
        
    }
    
    func displayLocationInfo(placemark: CLPlacemark){
        self.locationManager.stopUpdatingLocation()
        
        println(placemark.locality)
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error" + error.localizedDescription)
    }
    
    
    
    
    
    
    
}




