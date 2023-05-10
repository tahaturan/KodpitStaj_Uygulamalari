import UIKit

//MARK: Closure: tek seferlik fonksiyonlar yada isimsiz fonksyonlar olarak da gecer

func sum(num1: Int, num2:Int) -> Int {
    return num1 + num2
}

sum(num1: 5, num2: 11)



//MARK: Bir fonksiyon icine baska bir foksiyonu parametre olarak verebiliriz

func calculate(num1:Int , num2:Int , myFuntion: (Int , Int) -> Int) -> Int {
    return myFuntion(num1 , num2)
}

calculate(num1: 5, num2: 2, myFuntion: sum)



calculate(num1: 4, num2: 9, myFuntion: { (num1:Int , num2:Int) -> Int in
    return num1 * num2
})



calculate(num1: 4, num2: 9, myFuntion: { (num1 , num2) -> Int in
    return num1 * num2
})


calculate(num1: 4, num2: 9, myFuntion: { (num1 , num2) in
    return num1 * num2
})


calculate(num1: 4, num2: 9, myFuntion: { (num1 , num2) in num1 * num2 })


calculate(num1: 4, num2: 9, myFuntion: { $0 * $1 })


let myArray = [10,20,30,40]

func test(num1:Int) -> Int {
    return num1 / 5
}

print(myArray.map(test))
