//: Классы

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

class Car {
    // MARK: - Public property
    let carBrand: String
    let carModel: String
    let carBody: String
    let transmission: String
    let typeEngine: String
    let yearOfIssue: Int
    let engineVolume: Double
    
    init(carBrand: String,
         carModel: String,
         carBody: String,
         transmission: String,
         typeEngine: String,
         yearOfIssue: Int,
         engineVolume: Double)
    {
        self.carBrand = carBrand
        self.carModel = carModel
        self.carBody = carBody
        self.transmission = transmission
        self.typeEngine = typeEngine
        self.yearOfIssue = yearOfIssue
        self.engineVolume = engineVolume
    }
    
    // MARK: - Public methods
    func printInfoCar() {
        print(carBrand, carModel, yearOfIssue)
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

final class SportCar: Car {
    
    // MARK: - Public property
    let maxSpeed: Int
    init(carBrand: String,
         carModel: String,
         carBody: String,
         transmission: String,
         typeEngine: String,
         yearOfIssue: Int,
         engineVolume: Double,
         maxSpeed:Int)
    {
        self.maxSpeed = maxSpeed
        super.init(carBrand: carBrand,
                   carModel: carModel,
                   carBody: carBody,
                   transmission: transmission,
                   typeEngine: typeEngine,
                   yearOfIssue: yearOfIssue,
                   engineVolume: engineVolume)
    }
    
    // MARK: - Public methods
    func carAcceleration(the speed: SpeedCar) {
        switch speed {
        case .maxCar:
            print("Включена максимальная скорость = \(maxSpeed) км/ч")
        case .minCar:
            print("Включена минимальная скорость")
        }
    }
}

final class TrunkCar: Car {
    
    // MARK: - Public property
    var stateBaggage: Double
    init(carBrand: String,
         carModel: String,
         carBody: String,
         transmission: String,
         typeEngine: String,
         yearOfIssue: Int,
         engineVolume: Double,
         stateBaggage: Double)
    {
        self.stateBaggage = stateBaggage
        super.init(carBrand: carBrand,
                   carModel: carModel,
                   carBody: carBody,
                   transmission: transmission,
                   typeEngine: typeEngine,
                   yearOfIssue: yearOfIssue,
                   engineVolume: engineVolume)
    }
    
    // MARK: - Public methods
    func loadingCargo(the actionBaggage: BaggageUpload) {
        switch  actionBaggage {
        case .full:
            if stateBaggage > 0{
                print("Багажник загружен на \(stateBaggage) кг")
            }else {
                stateBaggage = 10
                print("Багажник был пустой. Загрузили на \(stateBaggage)")
            }
        case .empty:
            if stateBaggage == 0 {
                print("Багажник пуст")
            }else{
                print("Багажник загружен на \(stateBaggage). Разгрузка...")
                stateBaggage = 0
                print("Багажник разгружен")
            }
        }
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
                             transmission: "Van",
                             typeEngine: "Diesel",
                             yearOfIssue: 2020,
                             engineVolume: 2.0,
                             stateBaggage: 50)

// MARK: - Print instance
print("-----Ferrari F40----")
ferrariF40.printInfoCar()
ferrariF40.printStatusWindow(the: .open)
ferrariF40.carAcceleration(the: .maxCar)
ferrariF40.printStatusWorkCar(the: .startEngine)

print("----Peugeot Expert----")
peugeotExpert.printInfoCar()
peugeotExpert.printStatusWorkCar(the: .stopEngine)
peugeotExpert.printStatusWindow(the: .close)
peugeotExpert.loadingCargo(the: .full)




