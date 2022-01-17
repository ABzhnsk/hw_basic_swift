//: Протоколы

// MARK: - Enums
enum WorkEngine {
    case startEngine
    case stopEngine
}

enum WorkWindow {
    case open
    case close
}

enum BaggageUpload{
    case full
    case empty
    
}

enum SpeedCar {
    case maxCar
    case minCar
}

// MARK: - Protocol
protocol CarProtocol {
    
    var carBrand: String { get }
    var carModel: String { get }
    var carBody: String { get }
    var transmission: String { get }
    var typeEngine: String { get }
    var yearOfIssue: Int { get }
    var engineVolume: Double { get }
    
    func printInfoCar()
}

// MARK: - Extension for protocol
extension CarProtocol{
    
    func printInfoCar() {
        print("""
            ---- Info about car ----
            Бренд: \(carBrand),
            Модель: \(carModel),
            Тип кузова: \(carBody),
            Трансмиссия: \(transmission),
            Тип двигателя: \(typeEngine),
            Объем двигателя: \(engineVolume),
            Год выпуска: \(yearOfIssue)
            ---- -------------- ----
        """)
    }
    func printStatusWindow(the actionWindow: WorkWindow) {
        switch actionWindow{
        case .open:
            print("Окно открылось")
        case .close:
            print("Окно закрылось")
        }
    }
    func printStatusWorkCar(the actionEngine: WorkEngine) {
        switch actionEngine {
        case .startEngine:
                print("Двигатель заведен")
        case .stopEngine:
                print("Двигатель заглушен")
        }
    }
}

// MARK: - Class SportCar
final class SportCar: CarProtocol {
    
    var carBrand: String
    var carModel: String
    var carBody: String
    var transmission: String
    var typeEngine: String
    var yearOfIssue: Int
    var engineVolume: Double
    let maxSpeed: Int
    
    init(carBrand: String,
         carModel: String,
         carBody: String,
         transmission: String,
         typeEngine: String,
         yearOfIssue: Int,
         engineVolume: Double,
         maxSpeed: Int)
    {
        self.carBrand = carBrand
        self.carModel = carModel
        self.carBody = carBody
        self.transmission = transmission
        self.typeEngine = typeEngine
        self.yearOfIssue = yearOfIssue
        self.engineVolume = engineVolume
        self.maxSpeed = maxSpeed
    }
    
    func carAcceleration(the speed: SpeedCar) {
        switch speed {
        case .maxCar:
            print("Включена максимальная скорость = \(maxSpeed) км/ч")
        case .minCar:
            print("Выключена максимальная скорость")
        }
    }
}

// MARK: - Class TrunkCar
final class TrunkCar: CarProtocol {
    
    var carBrand: String
    var carModel: String
    var carBody: String
    var transmission: String
    var typeEngine: String
    var yearOfIssue: Int
    var engineVolume: Double
    var stateBaggage: Double
    var maxVolumeBaggage: Double
    
    init(carBrand: String,
         carModel: String,
         carBody: String,
         transmission: String,
         typeEngine: String,
         yearOfIssue: Int,
         engineVolume: Double,
         stateBaggage: Double,
         maxVolumeBaggage: Double)
    {
        self.carBrand = carBrand
        self.carModel = carModel
        self.carBody = carBody
        self.transmission = transmission
        self.typeEngine = typeEngine
        self.yearOfIssue = yearOfIssue
        self.engineVolume = engineVolume
        self.stateBaggage = stateBaggage
        self.maxVolumeBaggage = maxVolumeBaggage
    }
    
    func loadingCargo(the actionBaggage: BaggageUpload) {
        switch  actionBaggage {
        case .full:
            if stateBaggage > 0 && stateBaggage < maxVolumeBaggage{
                print("Багажник загружен на \(stateBaggage) кг")
            }else if stateBaggage > maxVolumeBaggage {
                print("Ошибка! Груз не может превышать максимального объема багажника = \(maxVolumeBaggage) кг")
            }else if stateBaggage == maxVolumeBaggage {
                print("Стоп! Багажник загружен на максимальный объем")
            }else if stateBaggage < 0 {
                print("Ошибка! Груз не может быть отрицательным")
            } else {
                stateBaggage = 10
                print("Багажник был пустой. Загрузили на \(stateBaggage) кг")
            }
        case .empty:
            if stateBaggage == 0 {
                print("Багажник еще пустой. Разгрузка отменена")
            }else if stateBaggage > maxVolumeBaggage{
                print("Ошибка! Груз слишком большой. Разгрузка отменена")
            }else if stateBaggage < 0 {
                print("Ошибка! Груз отрицательный. Разгрузка отменена")
            }else {
                print("Багажник загружен на \(stateBaggage) кг. Разгрузка...")
                stateBaggage = 0
                print("Багажник разгружен")
            }
        }
    }
}

// MARK: - Extensions for class
extension SportCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль относится к классу Sportcar"
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль относится к классу Trunkcar"
    }
}

// MARK: - Instance initialization
let ferrariF40 = SportCar(carBrand: "Ferrari",
                        carModel: "F40",
                        carBody: "Berlinetta",
                        transmission: "MT",
                        typeEngine: "Petrol",
                        yearOfIssue: 1992,
                        engineVolume: 2.9,
                        maxSpeed: 100)

let peugeotExpert = TrunkCar(carBrand: "Peugeot",
                             carModel: "Expert 3",
                             carBody: "Van",
                             transmission: "MT",
                             typeEngine: "Diesel",
                             yearOfIssue: 2020,
                             engineVolume: 2.0,
                             stateBaggage: 500,
                             maxVolumeBaggage: 1000)

// MARK: - Print instance
print("----First car----")
ferrariF40.printInfoCar()
ferrariF40.printStatusWindow(the: .close)
ferrariF40.printStatusWorkCar(the: .startEngine)
ferrariF40.carAcceleration(the: .maxCar)
ferrariF40.carAcceleration(the: .minCar)
ferrariF40.printStatusWorkCar(the: .stopEngine)
print(ferrariF40)

print("----Second car----")
peugeotExpert.printInfoCar()
peugeotExpert.printStatusWindow(the: .open)
peugeotExpert.printStatusWorkCar(the: .startEngine)
peugeotExpert.loadingCargo(the: .full)
peugeotExpert.printStatusWorkCar(the: .stopEngine)
peugeotExpert.loadingCargo(the: .empty)
print(peugeotExpert)
