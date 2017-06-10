//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Deanna Yee on 9/7/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

//import Foundation

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    //view for the map
    var mapView: MKMapView!
    
    //makes a region around the initial location
    let regionRadius: CLLocationDistance = 500000
    
    override func loadView(){
        //Create a map view
        mapView = MKMapView()
        
        //set it as the view of this view controller
        view = mapView
        
        //activate Standard, Hybrid, and Satellite links
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: "mapTypeChanged:", forControlEvents: .ValueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        //create the constraints
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        //set all constraints
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
    }
    
    //prints to the console when map view controller is selected the first time
    override func viewDidLoad(){
        //Always call the super implementation of viewDidLoad
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
        
        //set initial location in Tokyo,Japan
        let initialLocation = CLLocation(latitude: 35.6895,longitude: 139.6917)
        
        //sets the center of the map to Japan
        centerMapOnLocation(initialLocation)
        
        //Tokyo, Japan coordinates
        let tokyoLocation = CLLocationCoordinate2DMake(35.6895, 139.6917)
        
        //Drop a pin
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = tokyoLocation
        dropPin.title = "Tokyo"
        mapView.addAnnotation(dropPin)
    }
    
    //changes the map view to Standard, Hybrid, or Satellite
    func mapTypeChanged(segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex{
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            break
        }
    }
    
    //centers and displays the map zoomed out to the location given
    func centerMapOnLocation(location: CLLocation){
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        
        mapView.setRegion(coordinateRegion, animated: true)
        
    }
    
   
    
}
