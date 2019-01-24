//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum Action {
    case startEngine, stopEngine, loadCargo, unloadCargo, startTurbine, stopTurbine
}

class Car {
    var brand: String
    var year: Int
    
    var ignition: Bool = false {
        didSet {
            if ignition {
                print("Ignition of your \(brand) is on")
            } else {
                print("Ignition of your \(brand) is off")
            }
        }
    }
    
    var windows: Bool = false {
        didSet {
            if windows {
                print("Windows of your " + brand + " are open")
            } else {
                print("Windows of your " + brand + " are closed")
            }
        }
    }
    
    func applyAction(_ act:Action) {
        switch act {
        case .startEngine:
            if ignition == false {
                ignition = true
            }
        case .stopEngine:
            if ignition == true {
                ignition = false
            }
        default:
            print("Wrong action!")
        }
    }
    
    init(brand: String, year: Int) {
        self.brand = brand
        self.year = year
    }
}

class trunkCar: Car {
    let capacity: Double
    var cargo: Double = 0
    var avaliableCapacity: Double {
        get {
            return capacity - cargo
        }
    }
    var cargoUnit: Double {
        get {
            return 0.1 * capacity
        }
    }
    func carrentCapacityIs() {
        print("Current avaliable capacity is \(avaliableCapacity)")
    }
    
    override func applyAction(_ act: Action) {
        switch act {
        case .loadCargo:
            if avaliableCapacity <= capacity && avaliableCapacity > 0 {
                cargo += cargoUnit
                carrentCapacityIs()
            } else {
                print("Cannot load any more. The trunk is full!")
            }
        case .unloadCargo:
            if cargo > 0 {
                cargo -= cargoUnit
                carrentCapacityIs()
            } else {
                print("There is nothing to unload. The trunk is empty!")
            }
        default: super.applyAction(act)
        }
    }
    
    init(brand: String, year: Int, capacity: Double) {
        self.capacity = capacity
        super.init(brand: brand, year: year)
    }
}

class sportCar: Car {
    
   override var ignition: Bool {
        didSet {
            if !ignition {
                tourbineMode = false
            }
        }
    }
    
    let maxSpeed: Double
    
    var tourbineMode: Bool = false
    
    var fuelConsumption: Double {
        get {
            if tourbineMode {
                return 0.5 * maxSpeed
            } else {
                return 0.1 * maxSpeed
            }
        }
    }
    
    
    
    override func applyAction(_ act: Action) {
        switch act {
        case .startTurbine:
            if !tourbineMode && ignition {
                tourbineMode = true
                print("WROOOOOM! Now your \(brand) fuel consumption is \(fuelConsumption) l/100km")
            } else if !ignition {
                print("Start the engine of your \(brand) first, you racer!")
            } else {
                print("The tourbine is already working!")
            }
        case .stopTurbine:
            if !ignition {
                print("You know the engine of your \(brand) is not working, right?")
            } else if ignition && tourbineMode {
                tourbineMode = false
                print("SCREEEEEECH! Now your \(brand) fuel consumption is \(fuelConsumption) l/100km")
            } else {
                print("If you want to stop the tourbine we strongly recommend you to start it first!")
            }
        default: super.applyAction(act)
        }
    }
    
    init(brand: String, year: Int, maxSpeed: Double) {
        self.maxSpeed = maxSpeed
        super.init(brand: brand, year: year)
    }
}

let bmw1 = sportCar(brand: "BMW", year: 2018, maxSpeed: 50.0)

bmw1.applyAction(Action.startEngine)
bmw1.applyAction(Action.startTurbine)
bmw1.applyAction(Action.stopEngine)
bmw1.applyAction(Action.startEngine)
bmw1.applyAction(Action.stopTurbine)
bmw1.applyAction(Action.startTurbine)
bmw1.applyAction(Action.stopTurbine)

let izh1 = trunkCar(brand: "IZH", year: 1990, capacity: 50.0)

izh1.applyAction(.startEngine)
for _ in 1...12 {
    izh1.applyAction(.loadCargo)
}
for _ in 1...12 {
    izh1.applyAction(.unloadCargo)
}

