//
//  MapKitSearchVC.swift
//  CoreLocationFramework_Kullanimi
//
//  Created by Taha Turan on 5.05.2023.
//

import UIKit
import MapKit

class MapKitSearchVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var mapKitView: MKMapView!
    
    let istek = MKLocalSearch.Request()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        mapKitView.delegate = self
        
        let konum = CLLocationCoordinate2D(latitude: 37.7526186, longitude: 27.4030998)
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let bolge = MKCoordinateRegion(center: konum, span: span)
        mapKitView.setRegion(bolge, animated: true)
        
        istek.region = mapKitView.region

    }

}

extension MapKitSearchVC:UISearchBarDelegate,MKMapViewDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        istek.naturalLanguageQuery = searchBar.text!
        
        if mapKitView.annotations.count > 0{
            mapKitView.removeAnnotation(mapKitView.annotations as! MKAnnotation)
        }
        
        
        let arama = MKLocalSearch(request: istek)
        
        arama.start { response, error in
            
            if error != nil{
                print(error?.localizedDescription ?? "Error")
            }else if response?.mapItems.count == 0{
                print("Mekan Yok")
            }else{
                
                for mekan in response!.mapItems{
                    
                    if let ad = mekan.name , let tel = mekan.phoneNumber {
                        print("Ad : \(ad) - Tel: \(tel)")
                        print("Enlem: \(mekan.placemark.coordinate.latitude)")
                        print("Boylam: \(mekan.placemark.coordinate.longitude)")
                        
                        let pin = MKPointAnnotation()
                        
                        pin.coordinate = mekan.placemark.coordinate
                        pin.title = ad
                        pin.subtitle = tel
                        
                        self.mapKitView.addAnnotation(pin)
                    }
                    
                    
                }
                
            }
            
        }
    }
}
