//
//  ViewController.swift
//  bildirim_olusturma
//
//  Created by Taha Turan on 2.05.2023.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    var izinKontrol:Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert , .badge , .sound], completionHandler: {
            (granted , error) in
            self.izinKontrol = granted
            
            if granted{
                print("izin alma islemi basarili")
            }else{
                print("izin alma islemi basariz")
            }
        })
        
        
    }


}

