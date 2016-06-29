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

// add a map view delegate
class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

