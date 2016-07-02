//
//  ViewController.swift
//  mapDemo
//
//  Created by Kaylan Smith on 6/29/16.
//  Copyright © 2016 Kaylan Smith. All rights reserved.
//

import UIKit

// import map kit framework
import MapKit

import CoreLocation


// add a map view delegate
class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // GET USERS LOCATION
        // edit info.plist first!
        // also build phases
        // add the new delegate CLLocation...
        // import CoreLocation
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        // get coordinates easily from Google Maps, search for a location, right click "What's Here?" to retrieve coordinates
        // give varialbe type of CLLocationDegrees
        var latitude:CLLocationDegrees =  40.722990
        
        var longitude: CLLocationDegrees = -73.958508
        
        // delta is difference of latitudes from one side of screen to the other
        // zoom level, essentially
        var latDelta:CLLocationDegrees = 0.01
        
        var lonDelta:CLLocationDegrees = 0.01
        
        // combination of two deltas, changes within degrees
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
        // for a pin
        var annotation = MKPointAnnotation()
        
        // set coordinate to location as used earlier
        annotation.coordinate = location
    
        // title of annotation
        annotation.title = "Brooklyn"
        
        annotation.subtitle = "Home of Wythe Hotel"
        
        // add the annotation to the map
        map.addAnnotation(annotation)
        
        // for user to add their own pin, 
        // ui long press gesture recognizer
        // "action" is name of function to be run when user does a long press
        // : means gestureRecognizer will be sent
        var uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.action(_:)))
        
        // number of seconds user has to hold the press
        uilpgr.minimumPressDuration = 2
        
        // add to the map, like before
        map.addGestureRecognizer(uilpgr)
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
        // note the simulater will populate with fake locations
        print(locations)
        
        // extract location from the array
        // center the map on the users location
        var userLocation: CLLocation = locations[0]
        
        var latitude = userLocation.coordinate.latitude
        
        var longitude = userLocation.coordinate.longitude
        
        var latDelta:CLLocationDegrees = 0.05
        
        var lonDelta:CLLocationDegrees = 0.05
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        self.map.setRegion(region, animated: true)
    
    }
    
    // action function, runs when long press is recognized
    // receives variable gestureRecognizer
    func action(gestureRecognizer:UIGestureRecognizer) {
        
        print("Gesture Recognized")
        
        // gives us the point user has pressed RELATIVE to the map in the view 
        // self refers to view controller
        var touchPoint = gestureRecognizer.locationInView(self.map)
        
        var newCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = newCoordinate
        
        // title of annotation
        annotation.title = "New Place"
        
        annotation.subtitle = "To Visit One Day"
        
        // add the annotation to the map
        map.addAnnotation(annotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

