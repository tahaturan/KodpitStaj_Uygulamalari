//
//  main.swift
//  ProtocolSwiftProject
//
//  Created by Taha Turan on 10.05.2023.
//

import Foundation

//MARK: Protocoller soyut siniflardir - protocollerden bir obje olusturalmaz baska class ve struct larda kullanabiliriz
// bir taslak sinifi olarak dusunebiliriz

protocol Running {
    func myRun()
    
}

class Animal {
    
    func running()  {
        print("Running")
    }
}

class Dog:Running {
    func myRun() {
        print("RUNNING")
    }
    

    
    
}

let karabas = Dog()
karabas.myRun()

class Cat:Animal , Running{
    func myRun() {
        print("Protocol Run")
    }
    
    
}

let saskin = Cat()
saskin.running()
saskin.myRun()

class Turtle : Animal{
    
}

let leonardo = Turtle()
leonardo.running()


struct Bird:Running {
    func myRun() {
        print("RUN Bird")
    }
}
let bird = Bird()
bird.myRun()
