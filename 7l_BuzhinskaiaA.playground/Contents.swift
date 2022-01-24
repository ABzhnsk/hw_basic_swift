//: Errors & Try catch

// MARK: - Error enum
enum ATMError: Error {
    case invalidPIN
    case invalidAmount
}

// MARK: - ATM Protocol
protocol ATMProtocol {
    
    var userBalance: UInt { get }
}

// MARK: - Class SberbankATM
final class SberbankATM: ATMProtocol {
    
    var userBalance: UInt
        
    init(userBalance: UInt) {
        self.userBalance = userBalance
    }
    
    func issuingMoney(_ issueAmount: UInt) -> UInt? {
        guard issueAmount < userBalance else {
            print("На Вашем счету недостаточно средств")
            return nil
        }
       
        print("Баланс счёта: \(userBalance)")
        userBalance -= issueAmount
        print("Вы сняли: \(issueAmount). Остаток на счёте: \(userBalance)")
        return issueAmount
    }
}

// MARK: - Class TinkoffATM
final class TinkoffATM: ATMProtocol {
    
    let userPIN: UInt
    var userBalance: UInt
    
    init(userPIN: UInt, userBalance: UInt) {
        self.userBalance = userBalance
        self.userPIN = userPIN
    }
    
    func issuingMoney(_ pinCode: UInt, _ issueAmount: UInt) throws -> UInt? {
        guard pinCode == userPIN else { throw ATMError.invalidPIN }
        guard issueAmount < userBalance else { throw ATMError.invalidAmount }
        
        print("Баланс счёта: \(userBalance)")
        userBalance -= issueAmount
        print("Вы сняли: \(issueAmount). Остаток на счёте: \(userBalance)")
        return issueAmount
    }
}

// MARK: - Instances of the class
print("----1 пользователь Sberbank----")
let userAnna = SberbankATM(userBalance: 2000)
userAnna.issuingMoney(700)

print("----2 пользователь Sberbank----")
let userKate = SberbankATM(userBalance: 50)
userKate.issuingMoney(500)

print("----1 пользователь Tinkoff----")
let userJhon = TinkoffATM(userPIN: 1234, userBalance: 1200)
do {
   try userJhon.issuingMoney(1234, 100)
} catch let error {
    print(error)
}

print("----2 пользователь Tinkoff----")
let userOleg = TinkoffATM(userPIN: 1010, userBalance: 10000)
do {
   try userOleg.issuingMoney(1019, 1000)
} catch let error {
    print(error)
}

print("----3 пользователь Tinkoff----")
let userAlex = TinkoffATM(userPIN: 5555, userBalance: 5000)
do {
   try userAlex.issuingMoney(5555, 50000)
} catch let error {
    print(error)
}
