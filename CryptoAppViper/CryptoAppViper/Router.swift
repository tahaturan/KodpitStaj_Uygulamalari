//
//  Router.swift
//  CryptoAppViper
//
//  Created by Taha Turan on 12.05.2023.
//

import Foundation
// Kordinasyon Bolumu
// Class , Protocol
// EntryPoint i belirtiriz tabi olusturupda

protocol AnyRouter {
    static func startExecution() -> AnyRouter
}

class CryptoRouter: AnyRouter {
    
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
        
        
        return router
    }
    
}
