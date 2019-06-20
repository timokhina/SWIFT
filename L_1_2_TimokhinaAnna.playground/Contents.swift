import UIKit

let katet1: Double = 42
let katet2: Double = 87

var S: Double
S = (katet1*katet2)/2
var hyp: Double
hyp = round (sqrt(pow(katet1, 2)+pow(katet2, 2)))
var P: Double
P = (katet1+katet2+hyp)

print ("Катет: \(Int(katet1)) см, другой катет: \(Int(katet2)) см. Гипотенуза (c округлением): \(Int(hyp)) см. Периметр: \(Int(P)) см. Площадь: \(Int(S)) см^2 .")
