//
//  CryptoViewModel.swift
//  CryptoAppMVVM
//
//  Created by Taha Turan on 12.05.2023.
//

import Foundation

struct CryptoListViewModel{
    let cryptoCurrencyList : [CryptoModel]
    
    func numberOfRowsInSection() -> Int {
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index:Int) -> CryptoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
    
}

struct CryptoViewModel{
    let cryptoCurrency : CryptoModel
    
    var name : String {
        return self.cryptoCurrency.currency
    }
    var price : String {
        return self.cryptoCurrency.price
    }
}
