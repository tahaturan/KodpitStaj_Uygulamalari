//
//  ViewController.swift
//  NotificationCenter_Uygulama
//
//  Created by Taha Turan on 28.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelSonuc: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.yap(notification:)), name: .bildirimAdi, object: nil)
        
    }

   @objc func yap(notification:NSNotification)  {
       let gelenMesaj = notification.userInfo?["mesaj"]
       let gelenTarih = notification.userInfo?["tarih"]
       let gelenNesne = notification.userInfo?["nesne"] as! Kisiler
       labelSonuc.text = "\(gelenMesaj!) - \(gelenTarih!) - \(gelenNesne.kisiAd!)"
    }

}

extension Notification.Name{
  static let bildirimAdi = Notification.Name("benimYayin")
}

