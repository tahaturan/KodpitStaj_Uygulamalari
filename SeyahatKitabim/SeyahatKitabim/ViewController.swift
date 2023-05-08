//
//  ViewController.swift
//  SeyahatKitabim
//
//  Created by Taha Turan on 8.05.2023.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class ViewController: UIViewController, MKMapViewDelegate  , CLLocationManagerDelegate{
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var commentTextField: UITextField!
    
    
    
    var locationManager = CLLocationManager()
    
    var chosenLatitude:Double = Double()
    var chosenLongitude:Double = Double()

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
           
           chosenLatitude = touchCoordinates.latitude
           chosenLongitude = touchCoordinates.longitude
           
           let annotation = MKPointAnnotation()
           annotation.coordinate = touchCoordinates
           annotation.title = nameTextField.text
           annotation.subtitle = commentTextField.text
           self.mapView.addAnnotation(annotation)
       }
       
       
       
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location  = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
      
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let contex = appDelegate.persistentContainer.viewContext
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: contex)
        
        newPlace.setValue(nameTextField.text, forKey: "title")
        newPlace.setValue(commentTextField.text, forKey: "subtitle")
        newPlace.setValue(chosenLatitude, forKey: "latitude")
        newPlace.setValue(chosenLongitude, forKey: "longitude")
        newPlace.setValue(UUID(), forKey: "id")
        
        do {
            try contex.save()
            print("basarili")
        } catch  {
            print(error)
        }
    }
    


}

