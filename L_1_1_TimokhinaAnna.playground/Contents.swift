import UIKit

let a: Double = 1
let b: Double = -13
let c: Double = 12

let D: Double = pow(b, 2) - 4*a*c

if D > 0 {
    let x_1: Double = (b*(-1) + sqrt(D))/(2*a)
    let x_2: Double = (b*(-1) - sqrt(D))/(2*a)
    print ("Уравнение имеет 2 корня: х1=\(Float(x_1)), х2=\(Float(x_2))") //когда получаем числа в периоде (пример а=6, b=+/-17, с= 7 -- сокращаем их до 6 символов, а как округлить до 100 кроме как с помощью round(1000*x)/1000 я не нашла ¯\_(ツ)_/¯, поэтому Float
} else if D == 0 {
    let x: Double = (b*(-1))/(2*a)
    print ("Уравнение имеет 1 корень: x=\(x)")
} else {
    print ("Уравнение не имеет решений")
}

