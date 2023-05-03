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
        kisiEkle()
    }
    
    
    func kisiEkle()  {
        let yeniKisi = Kisiler(kisiAd: "Berk", kisiYas: 15)
        
        let dict:[String:Any] = ["kisiAd":yeniKisi.kisiAd! , "kisiYas":yeniKisi.kisiYas!]
        
        let newRef = ref?.child("kisiler").childByAutoId()
        
        newRef?.setValue(dict)
    }


}

