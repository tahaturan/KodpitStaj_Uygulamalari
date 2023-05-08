//
//  ViewController.swift
//  SeyahatKitabim
//
//  Created by Taha Turan on 8.05.2023.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate  , CLLocationManagerDelegate{
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer:)))
        gestureRecognizer.minimumPressDuration = 3
        mapView.addGestureRecognizer(gestureRecognizer)
        
    }
    
    
   @objc func chooseLocation(gestureRecognizer:UILongPressGestureRecognizer)  {
       
       if gestureRecognizer.state == .began {
           let touchPoint = gestureRecognizer.location(in: self.mapView)
           let touchCoordinates = self.mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
           
           let annotation = MKPointAnnotation()
           annotation.coordinate = touchCoordinates
           annotation.title = "New Annotation"
           annotation.subtitle = "Travel Book"
           self.mapView.addAnnotation(annotation)
       }
       
       
       
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location  = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
      
    }


}

