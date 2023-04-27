//
//  KisiGuncelleViewController.swift
//  Rehber_Uygulamasi
//
//  Created by Taha Turan on 27.04.2023.
//

import UIKit

class KisiGuncelleViewController: UIViewController {
    let context = appDelegate.persistentContainer.viewContext
    
    @IBOutlet weak var kisiAdTextField: UITextField!
    @IBOutlet weak var kisiTelTextField: UITextField!
    
    var kisi:Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let k = kisi {
            kisiAdTextField.text = k.kisiAd
            kisiTelTextField.text = k.kisiTel
        }
    
        
    }
    

    @IBAction func kisiGuncelleButton(_ sender: Any) {
        
        if let k = kisi , let ad = kisiAdTextField.text , let tel = kisiTelTextField.text {
            k.kisiAd = ad
            k.kisiTel = tel
            
            appDelegate.saveContext()
            navigationController?.popViewController(animated: true)
        }
        
        
    }
    

}
