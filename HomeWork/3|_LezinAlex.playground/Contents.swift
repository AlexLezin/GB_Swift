/*
 1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль.
*/

enum Action {
    case startEngine, stopEngine, openWindows, closeWindows, loadCargo, unloadCargo
}

enum VehicleType: String {
    case car , lorry
}

struct Vehicle {
    let type: VehicleType
    let brand: String
    let year: Int
    let cargoCapacity: Double
    var cargo: Double {
        didSet {
            print(brand + " " + type.rawValue + " Was loaded with " + String(cargo) + " units. There is still " + String(avaliableCargo) + " units avaliable")
        }
    }
    var avaliableCargo: Double {
        get {
            return cargoCapacity - cargo
        }
    }
    var ignition: Bool {
        didSet {
            if ignition {
                print("Ignition of " + brand + " " + type.rawValue + " is on")
            } else {
                print("Ignition of " + brand + " " + type.rawValue + " is off")
            }
        }
    }
    var windows: Bool {
        didSet {
            if windows {
                print("Windows of " + brand + " " + type.rawValue + " are open")
            } else {
                print("Windows of " + brand + " " + type.rawValue + " are closed")
            }
        }
    }
    mutating func action(_ act: Action) {
        switch act {
            case .startEngine: ignition = true
            case .stopEngine: ignition = false
            case .openWindows: windows = true
            case .closeWindows: windows = false
            case .loadCargo: cargo += 0.1 * cargoCapacity
            case .unloadCargo: cargo -= 0.1 * cargoCapacity
        }
    }
}

var newCar = Vehicle(type: .car, brand: "Opel", year: 2000, cargoCapacity: 5.0, cargo: 0.0, ignition: false, windows: false)
var newLorry = Vehicle(type: .lorry, brand: "MAN", year: 2010, cargoCapacity: 50.0, cargo: 0.0, ignition: false, windows: false)


newCar.action(.startEngine)
newCar.action(.openWindows)
newCar.action(.loadCargo)
newCar.action(.closeWindows)

newLorry.action(.startEngine)
newLorry.action(.openWindows)
newLorry.action(.loadCargo)
