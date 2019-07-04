import UIKit


//1. + Описать несколько структур – любой легковой автомобиль и любой грузовик.
//2. + Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. + Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. +Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. + Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. +Вывести значения свойств экземпляров в консоль.

enum engineAction {
    case start, stop
}
enum windowAcrion {
    case open, shut
}
enum trunkAction {
    case load, unload
}

enum infoLength{
    case short, full
}

struct car {
    let brand: String
    let year: Double
    let trunkVolume: Double
    var engineState: engineAction //написать перечисление стэйтов двигателя enum
    var windowsState: windowAcrion // написать перечисление стэйтов окон enum
    var trunkState: trunkAction // написать перечисление стэйтов заполненности багажника enum
    
    mutating func startEngine () {
        self.engineState = .start
    }
    mutating func stopEngine () {
        self.engineState = .stop
    }
    
    func carInfo () {
        print ("Информация об автомобиле: марка: \(brand), год выпуска: \(year), на текущий момент статус двигателя: \(engineState)ed")
    }
    
    func carInfo2 (mode: infoLength){
        switch mode {
        case .short : (print ("Информация об автомобиле: марка: \(brand), год выпуска: \(year), объем багажника: \(trunkVolume)"))
        case .full : (print ("Информация об автомобиле: марка: \(brand), год выпуска: \(year), объем багажника: \(trunkVolume),  на текущий момент статус двигателя: \(engineState)ed, статус окон: \(windowsState)ed, статус багажника: \(trunkState)ed"))
        default : (print ("Информация об автомобиле: марка: \(brand), год выпуска: \(year)"))
            
        }
    }
}

struct truck {
    let brand: String
    var year: Double // var чтоб протестировать изменение параметра
    let trunkVolume: Double
    var engineState: engineAction
    var windowsState: windowAcrion
    var trunkState: trunkAction
    
    func truckInfo () {
        print ("Информация об автомобиле: марка: \(brand), год выпуска: \(year), на текущий момент статус двигателя: \(engineState)ed")
    }
}

// экземпляры

var car1 = car(brand: "Range Rover", year: 2013, trunkVolume: 3.0, engineState: .start, windowsState: .shut, trunkState: .unload)
var car2 = car(brand: "Lada", year: 2017, trunkVolume: 2.1, engineState: .stop, windowsState: .open, trunkState: .load)
var truck1 = truck(brand: "dunno", year: 2023, trunkVolume: 1000, engineState: .start, windowsState: .shut, trunkState: .load)

//глушим двигатель
car1.carInfo()
car1.stopEngine()
car1.carInfo()

//меняем свойство год
truck1.truckInfo()
truck1.year = 2018
truck1.truckInfo()

//выводим все экземпляры
car1.carInfo()
car2.carInfo()
truck1.truckInfo()

//выводим разные варианты экземпляров (функция с перечислением в аргументе)
car1.carInfo2(mode: .full)
car1.carInfo2(mode: .short)
