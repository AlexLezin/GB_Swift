//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

protocol Car {
    var brand: String { get set }
    
    var year: Int { get set }
    
    var ignition: Bool { get set }
    
    var windows: Bool { get set }
    
    func applyAction()
}

extension Car {
    mutating func startEngine() {
        if !ignition {
            ignition = true
        }
    }
    
    mutating func stopEngine() {
        if ignition {
            ignition = false
        }
    }
    
    mutating func openWindows() {
        if !windows {
            windows = true
        }
    }
    
    mutating func closeWindows() {
        if windows {
            windows = false
        }
    }
}

class trunkCar: Car {
    var brand: String
    
    var year: Int
    
    func applyAction() {}
    
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
    
    func carrentCapacityIs() {
        print("Current avaliable capacity is \(avaliableCapacity)")
    }
    
    func loadCargo() {
        if avaliableCapacity <= capacity && avaliableCapacity > 0 {
            cargo += cargoUnit
            carrentCapacityIs()
        } else {
            print("Cannot load any more. The trunk is full!")
        }
    }
    func unloadCargo() {
        if cargo > 0 {
            cargo -= cargoUnit
            carrentCapacityIs()
        } else {
            print("There is nothing to unload. The trunk is empty!")
        }
    }
    
    init(brand: String, year: Int, capacity: Double) {
        self.brand = brand
        self.year = year
        self.capacity = capacity
    }
}

class sportCar: Car {
    var brand: String
    
    var year: Int
    
    var ignition: Bool = false {
        didSet {
            if ignition {
                print("Ignition of your \(brand) is on")
            } else {
                print("Ignition of your \(brand) is off")
                tourbineMode = false
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
    
    func applyAction() {}
    
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
    
    func startTurbine() {
        if !tourbineMode && ignition {
            tourbineMode = true
            print("WROOOOOM! Now your \(brand) fuel consumption is \(fuelConsumption) l/100km")
        } else if !ignition {
            print("Start the engine of your \(brand) first, you racer!")
        } else {
            print("The tourbine is already working!")
        }
    }
    
    func stopTurbine() {
        if !ignition {
            print("You know the engine of your \(brand) is not working, right?")
        } else if ignition && tourbineMode {
            tourbineMode = false
            print("SCREEEEEECH! Now your \(brand) fuel consumption is \(fuelConsumption) l/100km")
        } else {
            print("If you want to stop the tourbine we strongly recommend you to start it first!")
        }
    }
    
    init(brand: String, year: Int, maxSpeed: Double) {
        self.brand = brand
        self.year = year
        self.maxSpeed = maxSpeed
    }
}

extension trunkCar: CustomStringConvertible {
    var description: String {
        return "Trunk car \(brand), manufactured in \(year), windows are \(windows ? "open" : "closed"), ignition is \(ignition ? "on" : "off"), currernt avaliable capacity is \(avaliableCapacity) units"
    }
}

extension sportCar: CustomStringConvertible {
    var description: String {
        return "Sport car \(brand), manufactured in \(year), windows are \(windows ? "open" : "closed"), ignition is \(ignition ? "on" : "off"), currernt fuel consumption is \(fuelConsumption) l/100 km."
    }
}



var bmw1 = trunkCar(brand: "BMW", year: 2000, capacity: 50.0)

bmw1.startEngine()
bmw1.openWindows()
bmw1.loadCargo()
print(bmw1)

var lamb1 = sportCar(brand: "Lamborgini", year: 2018, maxSpeed: 100.0)

lamb1.startTurbine()
lamb1.startEngine()
lamb1.startTurbine()

print(lamb1)
