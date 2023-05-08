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
    
    var selectedTitle = ""
    var selectedID : UUID?
    
    var annotationTitle = ""
    var annotationSubtitle = ""
    var annotationLatitude = Double()
    var annotationLongitude = Double()

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
        
        
        if selectedTitle != ""{
            //CoreData cekme islemi
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
           let contex = appDelegate.persistentContainer.viewContext
            
            let fetctRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
            let idString = selectedID!.uuidString
            fetctRequest.predicate = NSPredicate(format: "id = %@", idString)
            fetctRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try contex.fetch(fetctRequest)
                
                if results.count > 0 {
                    
                    for result in results as! [NSManagedObject] {
                        
                        if let title = result.value(forKey: "title") as? String {
                            annotationTitle = title
                            if let subtitle = result.value(forKey: "subtitle") as? String {
                                    annotationSubtitle = subtitle
                                if let latitude = result.value(forKey: "latitude") as? Double {
                                    annotationLatitude = latitude
                                    
                                    if let longitude = result.value(forKey: "longitude") as? Double {
                                        annotationLongitude = longitude
                                                                                
                                        let annotation = MKPointAnnotation()
                                        annotation.title = annotationTitle
                                        annotation.subtitle = annotationSubtitle
                                        let coordinate = CLLocationCoordinate2D(latitude: annotationLatitude, longitude: annotationLongitude)
                                        annotation.coordinate = coordinate
                                        
                                        self.mapView.addAnnotation(annotation)
                                        nameTextField.text = annotationTitle
                                        commentTextField.text = annotationSubtitle
                                        
                                        locationManager.stopUpdatingLocation()
                                        
                                        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                                        let region = MKCoordinateRegion(center: coordinate, span: span)
                                        
                                        mapView.setRegion(region, animated: true)
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            } catch  {
                print(error.localizedDescription)
            }
            
        }else{
            //add new data
        }
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
        if selectedTitle == "" {
            let location  = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            
            let region = MKCoordinateRegion(center: location, span: span)
            
            mapView.setRegion(region, animated: true)
        }

      
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation{
            return nil
        }
        
        let reuseId = "myAnnotatiton"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKMarkerAnnotationView
        
        if pinView == nil {
            pinView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            pinView?.tintColor = .cyan
            
            let button = UIButton(type: UIButton.ButtonType.detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
            
        }else{
            pinView?.annotation = annotation
        }
        
        return pinView
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
        
        NotificationCenter.default.post(name: NSNotification.Name("newPlace"), object: nil)
        navigationController?.popViewController(animated: true)
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if selectedTitle != ""{
            
            let requestLocation = CLLocation(latitude: annotationLatitude, longitude: annotationLongitude)
            
            CLGeocoder().reverseGeocodeLocation(requestLocation) { placeMarks , error in
                //Closure
                if let placeMark  = placeMarks {
                    if placeMark.count > 0 {
                        
                        let newPlaceMark = MKPlacemark(placemark: placeMark[0])
                        let item = MKMapItem(placemark: newPlaceMark)
                        item.name = self.annotationTitle
                        
                        
                        item.openInMaps()
                    }
                }
                
       
            }
            
        }
    }
    


}

