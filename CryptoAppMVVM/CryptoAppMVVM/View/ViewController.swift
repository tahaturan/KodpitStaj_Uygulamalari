//
//  ViewController.swift
//  CryptoAppMVVM
//
//  Created by Taha Turan on 12.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getData()
    }


}


//MARK: -TableView Listeleme-
extension ViewController:UITableViewDataSource , UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel!.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell") as! CryptoTableViewCell
        let cryproViewModel = self.cryptoListViewModel?.cryptoAtIndex(indexPath.row)
        
        cell.priceLabel.text = cryproViewModel?.price
        cell.currencyLabel.text = cryproViewModel?.name
        cell.backgroundColor = indexPath.row % 2 == 0 ? .cyan:.link
        
        
   
        
        return cell
    }
    
}

//MARK: -get data-
extension ViewController{
    func getData()  {
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")
        
        WebService().downloadCurrency(url: url!) { cryptos in
            if let cryptos = cryptos {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}
