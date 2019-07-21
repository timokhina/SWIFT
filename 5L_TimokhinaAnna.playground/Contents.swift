import UIKit

enum engineState {
    case start, stop
}
enum windowState {
    case open, shut
}
enum roofTop {
    case open, close, magical
}

enum tentState {
    case withTent, withoutTent
}

// 1

protocol Car {
    var brand: String { get }
    var year: Int { get }
    var trunkVolume: Double { get }
    var engineState: engineState { get set }
    var windowsState: windowState { get set }
    
    func engine (state: engineState)
    func windows (state: windowState)
}

//2

extension Car {
    mutating func engine (state: engineState) {
        switch state {
        case .start :
            self.engineState = .start
        case .stop :
            self.engineState = .stop
        }
    }
    mutating func windows (state: windowState) {
        switch state {
        case .open : self.windowsState = .open
        case .shut : self.windowsState = .shut
        }
    }
  
}

//2+

protocol SportCar : Car {
    var HasBadAssSpoiler: Bool { get }
    var SecToHundred: Int { get set }
    var roofState: roofTop { get set }
    
    func roof (state: roofTop)
}

extension SportCar {
    mutating func roof (state: roofTop) {
        switch state {
        case .open:
            self.roofState = .open
        case .close:
            self.roofState = .close
        case .magical:
            self.roofState = .magical

        }
    }
}

protocol TruckCar : Car {
    var isTruck: Bool {get}
    var maxLoadWeight: Double {get}
    var TrailerState: tentState {get set}
    
    func tent (state: tentState)
}

extension TruckCar {
    mutating func tent (state: tentState) {
        switch state {
        case .withoutTent:
            self.TrailerState = .withoutTent
        case .withTent:
            self.TrailerState = .withTent
        }
    }
}

// 3

class sportCar : SportCar {

    var HasBadAssSpoiler: Bool
    var SecToHundred: Int
    var roofState: roofTop
    func roof (state: roofTop) {
        self.roofState = state
    }
    
    var brand: String
    var year: Int
    var trunkVolume: Double
    var engineState: engineState
    var windowsState: windowState
    func engine(state: engineState) {
        self.engineState = state
    }
    func windows(state: windowState) {
        self.windowsState = state
    }
    
    init (brand: String, year: Int, trunkVolume: Double, engineState: engineState, windowsState: windowState, HasBadAssSpoiler: Bool, SecToHundred: Int, roofState: roofTop) {
        self.brand = brand
        self.year = year
        self.trunkVolume = trunkVolume
        self.engineState = .stop
        self.windowsState = .shut
        self.HasBadAssSpoiler = HasBadAssSpoiler
        self.SecToHundred = SecToHundred
        self.roofState = roofState
    }
}

class truckCar : TruckCar {
    
    var brand: String
    var year: Int
    var trunkVolume: Double
    var engineState: engineState
    var windowsState: windowState
    func engine(state: engineState) {
        self.engineState = state
    }
    func windows(state: windowState) {
        self.windowsState = state
    }
    
    var isTruck: Bool
    var maxLoadWeight: Double
    var TrailerState: tentState
    func tent(state: tentState) {
        self.TrailerState = state
    }
    
    init (brand: String, year: Int, trunkVolume: Double, engineState: engineState, windowsState: windowState, isTruck: Bool, maxLoadWeight: Double, TrailerState: tentState) {
        self.brand = brand
        self.year = year
        self.trunkVolume = trunkVolume
        self.engineState = .stop
        self.windowsState = .shut
        self.isTruck = isTruck
        self.maxLoadWeight = maxLoadWeight
        self.TrailerState = TrailerState
    }
}

// 4

extension sportCar: CustomStringConvertible {
    var description: String {
        return "Brand: \(brand)\n" +
            "Year: \(year)\n" +
            "Current Engine State: \(engineState)\n" +
            "Current Windows State: \(windowsState)\n" +
            "Seconds to 100 kmph: \(SecToHundred)\n" +
            "It has bad ass spoiler: \(HasBadAssSpoiler)\n" +
        "It's roof is: \(roofState)\n"
    }
}

extension truckCar: CustomStringConvertible {
    var description: String {
        return "Brand: \(brand)\n" +
            "Year: \(year)\n" +
            "Current Engine State: \(engineState)\n" +
            "Current Windows State: \(windowsState))\n" +
            "It is truck: \(isTruck)\n" +
            "Maximum load weight: \(maxLoadWeight)\n" +
        "Also it has TENT! Isn't it?: \(TrailerState)\n"
    }
}

//5

var sportive1 = sportCar (brand: "BMW", year: 2018, trunkVolume: 2, engineState: .stop, windowsState: .shut, HasBadAssSpoiler: true, SecToHundred: 12, roofState: .magical)
var sportive2 = sportCar (brand: "Lambo", year: 2109, trunkVolume: 1, engineState: .stop, windowsState: .shut, HasBadAssSpoiler: false, SecToHundred: 5, roofState: .close)

var truck1 = truckCar (brand: "MANN", year: 2019, trunkVolume: 5000, engineState: .stop, windowsState: .open, isTruck: true, maxLoadWeight: 3000, TrailerState: .withTent)
var truck2 = truckCar (brand: "Some", year: 2001, trunkVolume: 2000, engineState: .stop, windowsState: .open, isTruck: true, maxLoadWeight: 2000, TrailerState: .withoutTent)

sportive1.engine(state: .start)
sportive2.roof(state: .magical)

truck1.windows(state: .shut)
truck2.tent(state: .withTent)


//6

print (sportive1)
print (sportive2)
print (truck1)
print (truck2)
print ("That's all folks")
