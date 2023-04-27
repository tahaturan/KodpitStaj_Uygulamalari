//
//  ViewController.swift
//  CoreData_Kullanimi
//
//  Created by Taha Turan on 27.04.2023.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

class ViewController: UIViewController {
    
    let context = appDelegate.persistentContainer.viewContext
    
    var kisilerListe:[Kisiler] = [Kisiler]()

    override func viewDidLoad() {
        super.viewDidLoad()
       // veriKaydi()
        
        //veriOkuma()
        print("------------------")
       // veriSil()
        
        //veriGuncelle()
        
        //veriOkuma()
        
        veriOkumaVeSiralama()
    }

    
    func veriKaydi()  {
       let kisi = Kisiler(context: context)
        kisi.kisiAd = "Muhammed"
        kisi.kisiYas = 25
        
        appDelegate.saveContext()
    }
    
    func veriOkuma()  {
        do {
            kisilerListe = try context.fetch(Kisiler.fetchRequest())
        } catch  {
            print("Veri Okunurken Hata Oldu")
        }
        
        for k in kisilerListe{
            print("Ad: \(k.kisiAd ?? "") Yas: \(k.kisiYas)")
        }
    }
    
    func veriSil()  {
        let kisi = kisilerListe[0]
        context.delete(kisi)
        appDelegate.saveContext()
    }
    
    func veriGuncelle()  {
        let kisi = kisilerListe[0]
        
        kisi.kisiAd = "Yeni Taha"
        kisi.kisiYas = 99
        
        appDelegate.saveContext()
    }
    
    
    func veriOkumaVeSiralama()  {
        let fetchRequest:NSFetchRequest<Kisiler> = Kisiler.fetchRequest()
        
        let sort = NSSortDescriptor(key: #keyPath(Kisiler.kisiYas), ascending: true)
        
        fetchRequest.sortDescriptors = [sort]
        
        do {
            kisilerListe = try context.fetch(fetchRequest)
        } catch  {
            print("Hata")
        }
        
        for k in kisilerListe{
            print("Ad: \(k.kisiAd ?? "") Yas: \(k.kisiYas)")
        }
    }

}

