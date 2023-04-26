//
//  ViewController.swift
//  File_Islemleri_Uygulama
//
//  Created by Taha Turan on 26.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textFieldGirdi: UITextField!
    
    @IBOutlet weak var resimTutucu: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func yaz(_ sender: Any) {
        let mesaj:String = textFieldGirdi.text!
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appending(path: "dosyam.txt")
            
            do {
                
                try mesaj.write(to: dosyaYolu, atomically: false, encoding: String.Encoding.utf8)
                
                textFieldGirdi.text = ""
                
            }catch{
                print("Dosya Yazilirken Hata Olustu")
            }
        }
        
        
        
    }
    
    @IBAction func oku(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appending(path: "dosyam.txt")
            
            do {
                
                textFieldGirdi.text = try String(contentsOf: dosyaYolu, encoding: String.Encoding.utf8)
                
                
                
            }catch{
                print("Dosya Okurken Hata Olustu")
            }
        }
        
        
        
        
        
    }
    
    @IBAction func sil(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appending(path: "dosyam.txt")
            
            if FileManager.default.fileExists(atPath: dosyaYolu.path()){
                
                do {
                    
                    try FileManager.default.removeItem(at: dosyaYolu)
                    
                  
                    
                }catch{
                    print("Dosya Silinirken Hata Olustu")
                }
                
            }
            
      
        }
        
        
        
    }
    
    
    @IBAction func resimKaydet(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appending(path: "resimim.png")
            let resim = UIImage(named: "resim")
            
            do {
                
                try resim!.pngData()?.write(to: dosyaYolu)
                
            }catch{
                print("Resim Yazilirken Hata Olustu")
            }
        }
        
        
        
        
    }
    
    @IBAction func resimGoster(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appending(path: "resimim.png")
            
            self.resimTutucu.image =  UIImage(contentsOfFile: dosyaYolu.path())
        }
        
        
    }
    
    
    @IBAction func resimSil(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appending(path: "resimim.png")
            
            if FileManager.default.fileExists(atPath: dosyaYolu.path()){
                
                do {
                    
                    try FileManager.default.removeItem(at: dosyaYolu)
                    
                    
                    
                }catch{
                    print("Dosya Silinirken Hata Olustu")
                }
                
            }
            
      
        }
        
        
    }
    

}

