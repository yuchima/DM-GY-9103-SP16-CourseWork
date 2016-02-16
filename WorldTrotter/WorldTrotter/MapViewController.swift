//
//  MapViewController..swift
//  WorldTrotter
//
//  Created by Yuchi on 16/2/16.
//  Copyright © 2016 Yuchi. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        
        //create a map view
        mapView = MKMapView()
        
        //set it as "the" view of this view controller
        view = mapView
    
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: "mapTypeChanged:", forControlEvents: .ValueChanged)
        
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
        
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
//        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(view.topAnchor)
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
//        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor)
//        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)

        let margins = view.layoutMarginsGuide
        
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
        
    }
    

    override func viewDidLoad(){
        //always call the super implementation of viewDidLoad
        super.viewDidLoad()
        print("MapviewController loaded its view")
        
    }
    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        print("viewWillAppear Sucess")
//    }
//
    
    
}