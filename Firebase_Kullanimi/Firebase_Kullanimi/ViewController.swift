//
//  ViewController.swift
//  Firebase_Kullanimi
//
//  Created by Taha Turan on 3.05.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var ref:DatabaseReference?

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        //kisiEkle()
        //kisiSil()
        //kisiGuncelle()
        tumKisiler()
    }
    
    
    func kisiEkle()  {
        let yeniKisi = Kisiler(kisiAd: "Berk", kisiYas: 15)
        
        let dict:[String:Any] = ["kisiAd":yeniKisi.kisiAd! , "kisiYas":yeniKisi.kisiYas!]
        
        let newRef = ref?.child("kisiler").childByAutoId()
        
        newRef?.setValue(dict)
    }
    
    func kisiSil()  {
        ref?.child("kisiler").child("-NUWLPQ_KYXFxHI21cWg").removeValue()
    }
    
    func kisiGuncelle()  {
        let dict:[String:Any] = ["kisiAd":"YeniTaha" , "kisiYas":30]
        ref?.child("kisiler").child("-NUWLEUp7jPQYDEIACW9").updateChildValues(dict)
    }
    
    func tumKisiler()  {
        ref?.child("kisiler").observe(.value, with: { snapshot in
            
            if let gelenVeriButunu = snapshot.value as? Dictionary<String,Any>{
                
                for gelenSatirVerisi in gelenVeriButunu {
                    
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary{
                        
                        let key = gelenSatirVerisi.key
                        let kisiAd = sozluk["kisiAd"] as? String ?? ""
                        let kisiYas = sozluk["kisiYas"] as? Int ?? 0
                        
                        print("Key      : \(key)")
                        print("Kisi Ad  : \(kisiAd)")
                        print("Kisi Yas : \(kisiYas)")
                        print("------------------------------")
                        
                    }
                    
                }
                
                
            }
            
            
        })
    }


}

