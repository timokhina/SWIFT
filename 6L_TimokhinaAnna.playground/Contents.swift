import UIKit

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

enum hasWire {
    case nope, hasOriginal, hasSubstitute}
enum OS {
    case MacOS, Windows, Linux}
enum keyboardLanguages {
    case ENG, RU, ZH, AR}
enum resolutions {
    case low, standart, HD}

class OfficeTech {
    var inventNum: Int?
    var employee: String?
    
    init (inventNum: Int?, employee: String?){
        self.inventNum = inventNum
        self.employee = employee
    }
}

class laptops : OfficeTech {
    var OS: OS
    var wires: hasWire
    var RAM: Int
    
    init (inventNum: Int?, employee: String, OS: OS, wires: hasWire, RAM: Int ) {
        self.OS = OS
        self.wires = wires
        self.RAM = RAM
        super.init(inventNum: inventNum, employee: employee)
    }
}

class keybords : OfficeTech {
    var language: keyboardLanguages
    var secondlanguage: keyboardLanguages
    var isClean: Bool
    var Color: String
    
    init (inventNum: Int?, employee: String, firstLanguage: keyboardLanguages, secondLanguage: keyboardLanguages, isClean: Bool, Color: String) {
        self.language = firstLanguage
        self.secondlanguage = secondLanguage
        self.isClean = isClean
        self.Color = Color
        super.init(inventNum: inventNum, employee: employee)
    }
}

class screens : OfficeTech {
    var resolution: resolutions
    var Color: String

    init (inventNum: Int?, employee: String, resolution: resolutions, Color: String) {
        self.resolution = resolution
        self.Color = Color
        super.init(inventNum: inventNum, employee: employee)
    }
    
}


//1

struct Stack<T> {
    private var elements: [T] = []
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        return elements.removeLast()
    }
}

var StackLaptops = Stack <laptops> ()
var StackKeyboards = Stack <keybords> ()
var StackScreens = Stack <screens> ()

StackLaptops.push(laptops(inventNum: 45673, employee: "Anna", OS: .MacOS, wires: .hasOriginal, RAM: 8))
StackLaptops.push(laptops.init(inventNum: 46739, employee: "Nastya", OS: .Windows, wires: .hasSubstitute, RAM: 4))
StackKeyboards.push(keybords.init(inventNum: nil, employee: "", firstLanguage: .ENG, secondLanguage: .RU, isClean: true, Color: "Black"))
StackKeyboards.push(keybords.init(inventNum: 37890, employee: "Pasha", firstLanguage: .ENG, secondLanguage: .ZH, isClean: false, Color: "White"))
StackKeyboards.push(keybords.init(inventNum: 54893, employee: "", firstLanguage: .ENG, secondLanguage: .RU, isClean: true, Color: "Black"))

//2

// не справилась. Что можно почитать чтобы получше погрузится в тепу ООП?
