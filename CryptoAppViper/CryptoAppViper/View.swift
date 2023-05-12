//
//  View.swift
//  CryptoAppViper
//
//  Created by Taha Turan on 12.05.2023.
//

import Foundation
import UIKit

// etkilesimde oldugu bolum -> Presenter
// Class , Protocol
// ViewController

protocol AnyView {
    var presenter:AnyPresenter? {get set}
    
    func update(with cryptos:[Crypto])
    func update(with error:String)
}

class CryptoViewController: UIViewController , AnyView {
    var presenter: AnyPresenter?
    
    var cryptos = [Crypto]()
    
    //tableView
    private let tableView : UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    //message label
    private let messageLabel : UILabel = {
       let label = UILabel()
        label.isHidden = false
        label.text = "Downloading..."
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        view.addSubview(messageLabel)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    
        messageLabel.frame = CGRect(x:view.frame.width / 2 - 100 , y: view.frame.height / 2 - 25, width: 200, height: 50)
    }
    
    func update(with cryptos: [Crypto]) {
        DispatchQueue.main.async {
            self.cryptos = cryptos
            self.messageLabel.isHidden = true
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.cryptos = []
            self.tableView.isHidden = true
            self.messageLabel.text = error
            self.messageLabel.isHidden = false
        }
    }

}

//MARK: - TableView islemleri
extension CryptoViewController : UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let crypto = cryptos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = crypto.currency
        content.secondaryText = crypto.price
        cell.contentConfiguration = content
        cell.backgroundColor = .cyan
        
        return cell
    }
    
    
}
//MARK: -TableView Extension sonu

