//: Структуры

// MARK: - Enums
enum EngineWork {
    case working
    case notWorking
}

enum WindowState {
    case open
    case close
}

enum BaggageUpload{
    case full
    case empty
}


struct SportCar {
    
    // MARK: - Public property
    let carBrand: String
    let carModel: String
    let yearOfIssue: Int
    let mileage: Double
    var isEngineWork: Bool
    var isWindowOpen: Bool
    
    // MARK: - Public function
    func infoByCondition() {
        yearOfIssue > 2018 ? print("Автомобиль новый") : print("Автомобиль старый")
    }
    
    // MARK: - Mutating methods
    mutating func switchStatusWindow(the state: WindowState){
        switch state {
        case .open:
            if isWindowOpen {
                print("Окно открыто")
            }else {
                isWindowOpen = true
                print("Окно открылось")
            }
        case .close:
            if !isWindowOpen {
                print("Окно закрыто")
            }else {
                isWindowOpen = false
                print("Окно закрылось")
            }
        }
    }
    
    mutating func switchStatusEngine(the status: EngineWork) {
        switch status {
        case .working:
            if isEngineWork {
                print("Двигатель работает")
            }else {
                isEngineWork = true
                print("Двигатель включен")
            }
        case .notWorking:
            if !isEngineWork {
                print("Двигатель не работает")
            }else {
                isEngineWork = false
                print("Двигатель выключен")
            }
        }
    }
}

struct TrunkCar {
    
    // MARK: - Public property
    let carBrand: String
    let yearOfIssue: Int
    let engineVolume: Double
    let baggageVolume: Double
    var isBaggageFull: Bool
    
    // MARK: - Public methods
    func infoByBaggage() {
        isBaggageFull ? print("Багажник полный") : print("Багажник пустой")
    }
    
    func infoByCar() {
        print("""
                Марка машины: \(carBrand),
                Год выпуска: \(yearOfIssue),
                Объем двигателя: \(engineVolume),
                Объем багажника: \(baggageVolume)
                """)
    }
    
    // MARK: - Mutating methods
    mutating func actionsCar(the baggage: BaggageUpload){
        switch baggage{
        case .full:
            if isBaggageFull {
                print("Багажник уже полный")
            }else {
                isBaggageFull = true
                print("Багажник заполнен")
            }
        case .empty:
            if !isBaggageFull {
                print("Багажник уже пустой")
            }else {
                isBaggageFull = false
                print("Багажник разгружен")
            }
        }
    }
}

// MARK: - Инициализация экземпляров
var bmwX5Car = SportCar(carBrand: "BMW",
                        carModel: "X5",
                        yearOfIssue: 2020,
                        mileage: 50,
                        isEngineWork: true,
                        isWindowOpen: false)

var mersedesGlkCar = SportCar(carBrand: "Mercedes",
                         carModel: "GLK",
                         yearOfIssue: 2015,
                         mileage: 135,
                         isEngineWork: false,
                         isWindowOpen: true)

var gazelCar = TrunkCar(carBrand: "GAZ",
                        yearOfIssue: 2000,
                        engineVolume: 2.7,
                        baggageVolume: 13.5,
                        isBaggageFull: true)

// MARK: - Вывод экземпляров в консоль
print("-----first car-------")
bmwX5Car.infoByCondition()
bmwX5Car.switchStatusEngine(the: .notWorking)
bmwX5Car.switchStatusWindow(the: .open)

print("-----second car-------")
mersedesGlkCar.infoByCondition()
mersedesGlkCar.switchStatusEngine(the: .notWorking)
mersedesGlkCar.switchStatusWindow(the: .close)

print("-----third car-------")
gazelCar.infoByCar()
gazelCar.infoByBaggage()
gazelCar.actionsCar(the: .empty)
