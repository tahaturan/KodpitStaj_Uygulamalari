//
//  ViewController.swift
//  Timer_Yapisi
//
//  Created by Taha Turan on 2.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ciktiLabel: UILabel!
    
    var sayici:Timer?
    var sayac:Int = 1
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func baslaButton(_ sender: Any) {
        sayici = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ileriSay), userInfo: nil, repeats: true)
    }
    
    @objc func ileriSay()  {
        ciktiLabel.text = String(sayac)
        sayac += 1
        
        if sayac > 6 {
            sayici?.invalidate()
            ciktiLabel.text = "Sure Bitti"
            sayac = 1
        }
    }
    
}

