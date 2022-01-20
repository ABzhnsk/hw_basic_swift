//: Generic & Clousers & Subscripts

struct Queue <T> {
    // MARK: -  property
    private var arrayQueue = [T]()
    
    // MARK: - public methods
    func printQueue() {
        for i in 0 ..< arrayQueue.count {
            print("\(i + 1) в очереди: \(arrayQueue[i])")
        }
    }
    
    // MARK: - Mutating methods
    mutating func newInLine(the element: T) {
        arrayQueue.append(element)
    }
    
    mutating func serveTheFirst() -> T {
        return arrayQueue.removeFirst()
    }
    
    // MARK: - Computed property
    var whoFirstInLine: T? {
        return arrayQueue.first
    }
    
    var whoLastInLine: T? {
        return arrayQueue.last
    }
    
    // MARK: - Subscript
    subscript(index: Int) -> T? {
        return index > arrayQueue.count ? nil : arrayQueue[index]
    }
}

// MARK: - Structure instance
var queueInCafe = Queue<String>()

queueInCafe.newInLine(the: "Anna")
queueInCafe.newInLine(the: "Kate")
queueInCafe.newInLine(the: "Ivan")
queueInCafe.whoFirstInLine
queueInCafe.whoLastInLine
queueInCafe[0]
print("До обслуживания: ")
queueInCafe.printQueue()
queueInCafe.serveTheFirst()
print("После обслуживания: ")
queueInCafe.printQueue()







