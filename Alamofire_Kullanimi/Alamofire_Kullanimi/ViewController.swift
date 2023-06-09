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
        
       //urunEkle()
        //urunGuncelle()
        //urunSil()
        tumUrunler()
        
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
    
    func urunGuncelle()  {
        let parametre:Parameters = ["title":"DenemeTelefon"]
        
        AF.request("https://dummyjson.com/products/1" , method: .put , parameters: parametre).response {
            response in
            
            if let data = response.data {
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data) as? Dictionary<String,Any> {
                        print(json)
                    }
                } catch  {
                    print(error.localizedDescription)
                }
                
            }
            
            
        }
    }
    
    func urunSil()  {
        AF.request("https://dummyjson.com/products/1" , method: .delete).response {
            response in
            
            if let data = response.data{
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data) as? Dictionary<String,Any>{
                        print(json)
                    }
                } catch  {
                    print(error.localizedDescription)
                }
                
            }
            
            
        }
    }
    
    func tumUrunler()  {
        AF.request("https://dummyjson.com/products" , method: .get).response {
            response in
            
            if let data = response.data{
                
                do {
                    
                    let cevap = try JSONDecoder().decode(UrunCevap.self, from: data)
                    
                    if let urunListesi = cevap.products {
                        
                        for product in urunListesi {
                            print(product.title)
                        }
                        
                    }
                    
                    
                } catch  {
                    print(error.localizedDescription)
                }
                
                
            }
            
        }
    }


}

