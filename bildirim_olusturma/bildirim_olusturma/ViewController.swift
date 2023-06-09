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
        
        UNUserNotificationCenter.current().delegate = self
        
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

    @IBAction func bildirim(_ sender: Any) {
        if izinKontrol{
            
            let evet = UNNotificationAction(identifier: "evet", title: "Evet" , options: .foreground)
            let hayir = UNNotificationAction(identifier: "hayir", title: "Hayir", options: .foreground)
            let sil = UNNotificationAction(identifier: "sil", title: "Sil", options: .destructive)
            
            let kategori = UNNotificationCategory(identifier: "kategori", actions: [evet , hayir , sil], intentIdentifiers: [])
            UNUserNotificationCenter.current().setNotificationCategories([kategori])
            
            let icerik = UNMutableNotificationContent()
            icerik.title = "Baslik"
            icerik.subtitle = "Alt Baslik"
            icerik.body = "Mesaj"
            icerik.badge = 1
            icerik.sound = UNNotificationSound.default
            icerik.categoryIdentifier = "kategori"
            
//            var date = DateComponents()
//            date.minute = 30
//            date.hour = 10
//
//            let tetikleme = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
            
            let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            
            let bildirimIstegi = UNNotificationRequest(identifier: "bildirimOlusturma", content: icerik, trigger: tetikleme)
            
            UNUserNotificationCenter.current().add(bildirimIstegi)
        }
    }
    
    
}


extension ViewController:UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner , .sound , .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.actionIdentifier == "evet"{
            print("Evet Tiklandi")
        }
        if response.actionIdentifier == "hayir" {
            print("Hayir Tiklandi")
        }
        if response.actionIdentifier == "sil"{
            print("Sil Tiklandi")
        }
        
        completionHandler()
    }
}
