//
//  ViewController.swift
//  Rehber_Uygulamasi
//
//  Created by Taha Turan on 27.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kisilerTableView: UITableView!
    
    var liste:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        liste = ["Taha" , "Berk" ,"Zeynep" , "Ismet" , "Sibel" , "Ali"]
        
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        searchBar.delegate = self
    }


}




//TableView
extension ViewController: UITableViewDelegate , UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liste.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kisiHucre", for: indexPath) as! KisiTableViewCell
        let gelenKisi = liste[indexPath.row]
        cell.kisiYaziLabel.text = gelenKisi
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetay", sender: indexPath.row)
    }
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { (contextualAction, view, boolValue)  in
            print("Sil tiklandi \(self.liste[indexPath.row])")
        }
        
        let guncelleAction = UIContextualAction(style: .normal, title: "Guncelle") { (contextualAction, view, boolValue) in
            print("Guncelle Tiklandi \(self.liste[indexPath.row])")
            
            self.performSegue(withIdentifier: "toGuncelle", sender: indexPath.row)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction , guncelleAction])
    }
}




//SearchBar
extension ViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("arama sonuc: \(searchText)")
    }
    
}

//Router
extension ViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
    }
}
