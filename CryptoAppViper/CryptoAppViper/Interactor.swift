//
//  Interactor.swift
//  CryptoAppViper
//
//  Created by Taha Turan on 12.05.2023.
//

import Foundation
// Etkilesim -> Presenter
// Class , Protocol
// Veri cekme islemleri

protocol AnyInteractor {
    var presenter : AnyPresenter? {get set}
    
    func downloadCryptos()
}

class CryptoInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func downloadCryptos() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")
        
        guard let url = url else { return }
        
        let task = URLSession.shared.dataTask(with: url) {  data , response , error in
            
            guard let data = data , error == nil else {
                self.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.NetworkFailed))
                return
            }
            
            do {
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                
                self.presenter?.interactorDidDownloadCrypto(result: .success(cryptos))
                
            } catch  {
                self.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.ParsingFailed))
            }
            
       
        }
        
        task.resume()
        
    }
    
    
}
