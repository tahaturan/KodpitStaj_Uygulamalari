//
//  Presenter.swift
//  CryptoAppViper
//
//  Created by Taha Turan on 12.05.2023.
//

import Foundation
// Etkilesim -> Interactor , Router , View
// Class , Protocol

protocol AnyPresenter {
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    
    func interactorDidDownloadCrypto(result:Result<[Crypto],Error>) // Verilerin gelip gelmedigi bilgisi icin
}
class CryptoPresenter: AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCryptos()
        }
    }
    
    var view: AnyView?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        
        switch result{
        case .success(let cryptos):
            //view update
            view?.update(with: cryptos)
            print("Update")
        case .failure(let error):
            // view Update Error
            view?.update(with: "Try again later: \(error)")
        }
        
    }
    
}


//MARK: -Custom Error Enum
enum NetworkError : Error {
    case NetworkFailed
    case ParsingFailed
}
