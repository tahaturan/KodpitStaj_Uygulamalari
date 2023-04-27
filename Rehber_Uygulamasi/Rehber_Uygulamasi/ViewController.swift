//
//  ViewController.swift
//  Rehber_Uygulamasi
//
//  Created by Taha Turan on 27.04.2023.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

class ViewController: UIViewController {
    let context = appDelegate.persistentContainer.viewContext
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kisilerTableView: UITableView!
    
    var KisilerListe:[Kisiler] = [Kisiler]()
    
    var aramaYapiliyorMu = false
    var aramaKelimesi:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        searchBar.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if aramaYapiliyorMu {
            aramaYap(kisiAd: aramaKelimesi!)
        }else{
            tumKisileriAl()
        }
        
        
        kisilerTableView.reloadData()
    }


}




//TableView
extension ViewController: UITableViewDelegate , UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return KisilerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let gelenKisi = KisilerListe[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "kisiHucre", for: indexPath) as! KisiTableViewCell
        
        cell.kisiYaziLabel.text = "\(gelenKisi.kisiAd!) - \(gelenKisi.kisiTel!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetay", sender: indexPath.row)
    }
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { (contextualAction, view, boolValue)  in
           
            let kisi = self.KisilerListe[indexPath.row]
            
            self.context.delete(kisi)
            
            appDelegate.saveContext()
            
            if self.aramaYapiliyorMu {
                self.aramaYap(kisiAd: self.aramaKelimesi!)
            }else{
                self.tumKisileriAl()
            }
            
            self.kisilerTableView.reloadData()
            
        }
        
        let guncelleAction = UIContextualAction(style: .normal, title: "Guncelle") { (contextualAction, view, boolValue) in
            
            
            
            self.performSegue(withIdentifier: "toGuncelle", sender: indexPath.row)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction , guncelleAction])
    }
}







//SearchBar
extension ViewController: UISearchBarDelegate{
    
    func aramaYap(kisiAd:String)  {
        
        
        let fetchRequest:NSFetchRequest<Kisiler>  = Kisiler.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "kisiAd CONTAINS %@", kisiAd)
        
        
        do {
            KisilerListe = try context.fetch(fetchRequest)
        } catch  {
            print(error)
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("arama sonuc: \(searchText)")
        
       aramaKelimesi = searchText
        
        if searchText == ""{
            aramaYapiliyorMu = false
            tumKisileriAl()
        }else{
            aramaYapiliyorMu = true
            aramaYap(kisiAd: aramaKelimesi!)
        }
        
        kisilerTableView.reloadData()
    }
    

    
}






//Router
extension ViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = sender as? Int
        
        if segue.identifier == "toDetay"{
            let gidilecekVC = segue.destination as! KisiDetayViewController
            
            gidilecekVC.kisi = KisilerListe[index!]
        }
        
        if segue.identifier == "toGuncelle"{
            let gidilecekVC = segue.destination as! KisiGuncelleViewController
            
            gidilecekVC.kisi = KisilerListe[index!]
        }
        
    }
}






//CoreDate
extension ViewController{
    
    func tumKisileriAl()  {
        do {
            KisilerListe = try context.fetch(Kisiler.fetchRequest())
        } catch  {
            print(error)
        }
    }
    
    
    
}
