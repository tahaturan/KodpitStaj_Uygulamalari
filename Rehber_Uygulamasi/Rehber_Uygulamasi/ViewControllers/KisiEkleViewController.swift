//
//  KisiEkleViewController.swift
//  Rehber_Uygulamasi
//
//  Created by Taha Turan on 27.04.2023.
//

import UIKit

class KisiEkleViewController: UIViewController {
    
    let context = appDelegate.persistentContainer.viewContext
    
    @IBOutlet weak var kisiAdTextField: UITextField!
    
    @IBOutlet weak var kisiTelTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    

    @IBAction func kisiEkleButton(_ sender: Any) {
        
        if let ad = kisiAdTextField.text , let tel = kisiTelTextField.text {
            let kisi = Kisiler(context: context)
            
            kisi.kisiAd = ad
            kisi.kisiTel = tel
            
            appDelegate.saveContext()
            navigationController?.popViewController(animated: true)
        }
        
        
        
        
        
        
    }
    

}
