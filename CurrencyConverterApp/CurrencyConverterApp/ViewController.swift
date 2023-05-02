//
//  ViewController.swift
//  CurrencyConverterApp
//
//  Created by Taha Turan on 2.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cadLabel: UILabel!
    
    @IBOutlet weak var chfLabel: UILabel!
    
    @IBOutlet weak var gbpLabel: UILabel!
    
    
    @IBOutlet weak var usdLabel: UILabel!
    
    @IBOutlet weak var tryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func getRatesClicked(_ sender: Any) {
        
        // 1. Request - Session = web adresine gitmek istek yollamak
        // 2. Response - Data = gittigimiz yerde veriyi almak
        // 3. Parsing - JSON Serialization = Aldigimiz Verileri islemek
        
        // MARK: 1.Adim
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/CurrencyData/main/currency.json")
        let session = URLSession.shared
        //Closure
        let task = session.dataTask(with: url!) { (data,response ,error ) in
            
            if error != nil{
                
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .default)
                alert.addAction(okButton)
                self.present(alert, animated: true)
            } else {
                //2.Adim
                if data != nil{
                    
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data! , options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,Any>
                        
                        //ASYNC
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                                
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLabel.text = "CHF: \(chf)"
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP: \(gbp)"
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD: \(usd)"
                                }
                                if let turkish = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY: \(turkish)"
                                }
                            }
                        }
                        
                    } catch  {
                        print(error.localizedDescription)
                    }
                    
                    
                }
                
                
            }
            
            
        }
        task.resume()
        
        
    }
    

}

