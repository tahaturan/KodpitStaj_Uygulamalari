//
//  KisiDetayViewController.swift
//  Rehber_Uygulamasi
//
//  Created by Taha Turan on 27.04.2023.
//

import UIKit

class KisiDetayViewController: UIViewController {
    
    @IBOutlet weak var kisiAdLabel: UILabel!
    @IBOutlet weak var kisiTelLabel: UILabel!
    
    var kisi:Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kisi {
            kisiAdLabel.text = k.kisiAd
            kisiTelLabel.text = k.kisiTel
        }
    }
    



}
