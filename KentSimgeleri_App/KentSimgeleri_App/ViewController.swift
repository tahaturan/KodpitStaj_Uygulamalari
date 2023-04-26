//
//  ViewController.swift
//  KentSimgeleri_App
//
//  Created by Taha Turan on 26.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var kentTableView: UITableView!
    
    var kentListesi:[KentModel] = [KentModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kentListesi = KentModel.dummyData
        
        kentTableView.dataSource = self
        kentTableView.delegate = self
    }


}

extension ViewController: UITableViewDelegate , UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kentListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let gelenKent = kentListesi[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "kentHucre", for: indexPath) as! KentSimgeleriTableViewCell
        
        cell.kentImageView.image = UIImage(named: gelenKent.resim!)
        cell.kentLabel.text = gelenKent.ad!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gelenKent = kentListesi[indexPath.row]
        performSegue(withIdentifier: "detailPage", sender: gelenKent )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let veri = sender as? KentModel {
            let detailVC = segue.destination as! DetailViewController
            
            detailVC.kent = veri
        }
    }
}

