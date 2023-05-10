//
//  MusicianStruct.swift
//  advancedSwfitProject
//
//  Created by Taha Turan on 10.05.2023.
//

import Foundation

struct MusicianStruct {
    var name:String
    var age:Int
    var instrument:String
    
   mutating func happyBirthDay()  {
        self.age += 1
    }
    
    //Struct larda eger bir degeri degistirmek istiyorsak bir fonksiyonla basina mutating eklememiz gerekiyor
}

//MARK: init istemedi bizden kendisini yapiyor init islemini
