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

print("--------------------TUPLE-------------------")

let myTuple = (1,3)
print(myTuple.0)

let myTuple2 = (1,3,5)
print(myTuple2.2)

let myTuple3 = ("taha" , 100)
print(myTuple3.0)

let myTuple4 = (10,[10,20,30])

print(myTuple4.1[1])

let myTuple5 = (name:"Taha" , age:25)
print(myTuple5.age)
