//
//  KentModel.swift
//  KentSimgeleri_App
//
//  Created by Taha Turan on 26.04.2023.
//

import Foundation

class KentModel{
    let id:Int?
    let ad:String?
    let resim:String?
    
    init(id: Int, ad: String, resim: String) {
        self.id = id
        self.ad = ad
        self.resim = resim
    }
    
    static let dummyData:[KentModel] = [
    KentModel(id: 1, ad: "Colosseum", resim: "colosseum"),
    KentModel(id: 2, ad: "Greatwall", resim: "greatwall"),
    KentModel(id: 3, ad: "Kremlin", resim: "kremlin"),
    KentModel(id: 4, ad: "Stonehenge", resim: "stonehenge"),
    KentModel(id: 5, ad: "Tajmahal", resim: "tajmahal")
    ]
}
