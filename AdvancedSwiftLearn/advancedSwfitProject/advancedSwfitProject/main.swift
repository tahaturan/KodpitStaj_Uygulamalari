//
//  main.swift
//  advancedSwfitProject
//
//  Created by Taha Turan on 10.05.2023.
//

import Foundation

let classJames = MusicianClass(name: "Jamas", age: 44, instrument: "guitar")
//print(classJames.age)

//MARK: class ile struct in farki struct init istemiyor bizden otomatik olarak girdigimiz degerleri init ediyor
var structJames = MusicianStruct(name: "James", age: 44, instrument: "guitar")
//print(structJames.age)




//MARK: IMMUTABLE Struct


//classJames.age = 50
//print(classJames.age)

//MARK: Struct lar degistirelemez eger objemizi var ile tanimlasaydik degistebilirdik

//structJames.age = 50
//print(structJames.age)

//MARK: REFERENCE vs VALUE

let copyOfClassJames = classJames

var copyOfStructJames = structJames

print(copyOfClassJames.age)
print(copyOfStructJames.age)


copyOfClassJames.age = 52
copyOfStructJames.age = 52

print(copyOfClassJames.age)
print(copyOfStructJames.age)
print("--------------")

print(classJames.age)
print(structJames.age)

print("------------------Function vs Mutanding Function----------------")

print(classJames.age)
classJames.happyBirthDay()
print(classJames.age)

print("StructJames Age: \(structJames.age)")
structJames.happyBirthDay()
print("StructJames Age: \(structJames.age)")
