import UIKit


//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum engineAction {
    case start, stop
}
enum windowAcrion {
    case open, shut
}
enum infoLength{
    case short, full
}

class Car {
    let brand: String
    let year: Double
    let trunkVolume: Double
    var engineState: engineAction //написать перечисление стэйтов двигателя enum
    var windowsState: windowAcrion // написать перечисление стэйтов окон enum
    
    func startEng (){
        engineState = .start
    }
    func stopEng (){
        engineState = .stop
    }
    
    
    init (brand: String, year: Double, trunkVolume: Double, engineState: engineAction, windowsState: windowAcrion)
    {
        self.brand = brand
        self.year = year
        self.trunkVolume = trunkVolume
        self.engineState = engineState
        self.windowsState = windowsState
    }
}

enum roofTop {
    case open, close, magical
}

class SportCar: Car {
    let HasBadAssSpoiler: Bool
    let SecToHundred: Double
    var roofState: roofTop
    
    func OpenRoof (){
        roofState = .open
    }
    
    func CloseRoof (){
        roofState = .close
    }
    
    func MagicRoof () {
        roofState = .magical
    }
    
    func carInfo () {
        print ("Информация об автомобиле: марка: \(brand), год выпуска: \(year), объем багажника: \(trunkVolume),  на текущий момент статус двигателя: \(engineState)ed, статус окон: \(windowsState)ed, спойлер: \(HasBadAssSpoiler), секунд до сотни: \(SecToHundred), крыша в режиме: \(roofState)")
    }
    
    init (brand: String, year: Double, trunkVolume: Double, engineState: engineAction, windowsState: windowAcrion, HasBadAssSpoiler: Bool, SecToHundred: Double, roofState: roofTop)
    {
        self.HasBadAssSpoiler = HasBadAssSpoiler
        self.SecToHundred = SecToHundred
        self .roofState = roofState
        super.init (brand: brand, year: year, trunkVolume: trunkVolume, engineState: engineState, windowsState: windowsState)
    }
    
}

enum tentState {
    case withTent, withoutTent
}

class TrunkCar: Car {
    let isTruck: Bool
    let maxLoadWeight: Double
    var TrailerState: tentState
    
    func pullTent() {
        TrailerState = .withTent
    }
    
    func removeTent() {
        TrailerState = .withoutTent
    }
    
    init (brand: String, year: Double, trunkVolume: Double, engineState: engineAction, windowsState: windowAcrion, isTruck: Bool, maxLoadWeight: Double, TrailerState: tentState)
    {
        self.isTruck = isTruck
        self.maxLoadWeight = maxLoadWeight
        self.TrailerState = TrailerState
        super.init (brand: brand, year: year, trunkVolume: trunkVolume, engineState: engineState, windowsState: windowsState)
    }
    
}


var car1 = Car (brand: "MS-Benz", year: 2013, trunkVolume: 400, engineState: .stop, windowsState: .shut)
var car2 = Car (brand: "BMW", year: 2018, trunkVolume: 12, engineState: .start, windowsState: .open)

var scar1 = SportCar (brand: "Jaguar", year: 2019, trunkVolume: 4, engineState: .stop, windowsState: .open, HasBadAssSpoiler: true, SecToHundred: 12, roofState: .magical)
var scar2 = SportCar (brand: "Lamborgini", year: 2019, trunkVolume: 1, engineState: .start, windowsState: .shut, HasBadAssSpoiler: false, SecToHundred: 8, roofState: .close)


//действия
scar1.OpenRoof ()
scar2.MagicRoof()
scar1.startEng()

//вывод
scar1.carInfo()
scar2.carInfo()
