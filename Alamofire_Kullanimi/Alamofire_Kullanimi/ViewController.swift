//
//  ViewController.swift
//  Alamofire_Kullanimi
//
//  Created by Taha Turan on 3.05.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       urunEkle()
        
    }
    
    func urunEkle()  {
        let param:Parameters = ["title":"Deneme"]
        AF.request("https://dummyjson.com/products/add" , method: .post , parameters: param).response {
            response in
            
            if let data = response.data {
                
                do {
                    if let json =  try JSONSerialization.jsonObject(with: data) as? Dictionary<String,Any> {
                        print(json)
                    }
                } catch  {
                    print(error.localizedDescription)
                }
                
                
            }
            
            
        }
    }


}

