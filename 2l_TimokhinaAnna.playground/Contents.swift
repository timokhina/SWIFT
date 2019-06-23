import UIKit

//2.1 Написать функцию, которая определяет, четное число или нет
func isEven (_ param : Int) -> Bool {
    let number = param
    if (number % 2) > 0 {
        return false
    } else {
        return true
    }
}

isEven (4)
isEven (357)




//2.2 Написать функцию, которая определяет, делится ли число без остатка на 3.
func divByThree (_ param : Int) -> Bool {
    let number = param
    if (number % 3) > 0 {
        return false
    } else {
        return true
    }
}

divByThree(9)
divByThree(297)
divByThree(1768)




//2.3 Создать возрастающий массив из 100 чисел.
var simpleArray: [Int] = []

for i in 1...100 {
    simpleArray.append(i)
}
simpleArray




//2.4 Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
for value in simpleArray {
    if isEven(value) {
        simpleArray.remove(at: simpleArray.firstIndex(of: value)!)
    } else {}
}

for value in simpleArray {
    if !divByThree(value) {
        simpleArray.remove(at: simpleArray.firstIndex(of: value)!)
    } else {}
}

simpleArray




//2.5* Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
func nextFibonachchi (_ array : [Int]) -> Int {
    let n = array.count
    let value = array[n - 1]+array[n - 2]
    return value
}

var fibonachchiArray: [Int] = [0 , 1]
fibonachchiArray.append(nextFibonachchi(fibonachchiArray))

//дальше цикл запустить не удалось, хотя я переписала его миллион раз. Один из вариантов -- ниже. Почему он выдает ошибку я не знаю
/*repeat {
fibonachchiArray.append(nextFibonachchi(fibonachchiArray))
 } while (fibonachchiArray.count < 100)*/






//2.6* Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.
// буду делать попозже по малой теореме Ферма, решето эратосфена баян


