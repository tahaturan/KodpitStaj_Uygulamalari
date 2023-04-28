//
//  ViewController.swift
//  BackgroundModes_SesOynatma
//
//  Created by Taha Turan on 28.04.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var sesOynatici:AVAudioPlayer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let dosyaYolu = Bundle.main.path(forResource: "music", ofType: ".mp3")
            sesOynatici = try AVAudioPlayer(contentsOf: URL.init(filePath: dosyaYolu!))
            sesOynatici.prepareToPlay()
        } catch  {
            print(error.localizedDescription)
        }
        
        
    }

    @IBAction func baslaButton(_ sender: Any) {
        sesOynatici.play()
    }
    
    
    @IBAction func durButton(_ sender: Any) {
        sesOynatici.stop()
    }
    
}

