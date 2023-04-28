//
//  ViewController2.swift
//  NotificationCenter_Uygulama
//
//  Created by Taha Turan on 28.04.2023.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func gonderButton(_ sender: Any) {
        let kisi = Kisiler(kisiAd: "Taha", kisiYas: 25)
        
        NotificationCenter.default.post(name: .bildirimAdi, object: nil , userInfo: ["mesaj" : "merhaba" , "tarih":Date() , "nesne":kisi])
        dismiss(animated: true)
    }
    

}
