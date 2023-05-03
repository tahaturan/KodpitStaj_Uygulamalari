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
        kisiGuncelle()
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


}

