//
//  MapKitKullanimViewController.swift
//  CoreLocationFramework_Kullanimi
//
//  Created by Taha Turan on 5.05.2023.
//

import UIKit
import MapKit

class MapKitKullanimViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
       
        let konum = CLLocationCoordinate2D(latitude: 37.7526186, longitude: 27.4030998)
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        
        let bolge = MKCoordinateRegion(center: konum, span: span)
        
        mapView.setRegion(bolge, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = konum
        pin.title = "Soke"
        pin.subtitle = "Memleket"
        
        mapView.addAnnotation(pin)
    }
    


}
