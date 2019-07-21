import UIKit


enum animal {
    case cat, dog, dolphin
}

class Animal {
    let says: String
    
    init(says: String) {
        self.says = says
    }
}

class Cat: Animal {
    
    init (){
        super.init (says: "meow")
    }
}

class Dog: Animal {
    
    init (){
        super.init (says: "bark")
    }
}

class Dolphin: Animal {
    
    init (){
        super.init (says: "kikiki")
    }
}

class AnimalFactory {
    
    static func getAnimal (animalType: animal) -> Animal {
        switch animalType {
        case animal.cat:
            return Cat ()
        case .dog:
            return Dog ()
        case .dolphin:
            return Dolphin ()
        }
    }
}

var animalArray: Array <Animal> = []

animalArray.append(AnimalFactory.getAnimal(animalType: .cat))
animalArray.append(AnimalFactory.getAnimal(animalType: .cat))
animalArray.append(AnimalFactory.getAnimal(animalType: .dog))
animalArray.append(AnimalFactory.getAnimal(animalType: .dolphin))


print(animalArray)
