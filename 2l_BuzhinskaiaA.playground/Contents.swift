//: 1. Написать функцию, которая определяет, четное число или нет

import Darwin
print("-----1 задание-----")

func evenOdd(number: Int) {
    //использую тернарный условный оператор для проверки числа на четность
    //если параметр функции является кратным двум, тогда это число четное, иначе нечетное
    
    number % 2 == 0 ? print("\(number) is even") : print("\(number) is odd")
}

evenOdd(number: 5)
evenOdd(number: 70)
evenOdd(number: 100)

//: 2. Написать функцию, которая определяет, делится ли число без остатка на 3
print("-----2 задание-----")

func divisionByThree(number: Int) {
    //использую тернарный условный оператор для проверки числа на делимость на три
    //если параметр функции является кратным трем, тогда это число делится без остатка на 3, иначе с остатком
    
    number % 3 == 0 ? print("\(number) divided into 3 without remainder") : print("\(number) divided into 3 with remainder")
}

divisionByThree(number: 5)
divisionByThree(number: 30)
divisionByThree(number: 53)
//: 3. Создать возрастающий массив из 100 чисел
print("-----3 задание-----")

var setOfOneHundredNums = [Int](0...99) // создаю массив из 100 элементов от 0 до 99
print(setOfOneHundredNums)
//: 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3
print("-----4 задание-----")

for arrayElements in setOfOneHundredNums {
    if arrayElements % 2 == 0 || arrayElements % 3 != 0, let firstIndex = setOfOneHundredNums.firstIndex(of: arrayElements) {
        setOfOneHundredNums.remove(at: firstIndex) // в цикле перебираю все элементы массива и удаляю только те, которые относятся к условию
    }
}
print(setOfOneHundredNums)
//: 5. Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов
print("-----5 задание-----")
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2

func fibonacciNumber(num: Int) {
    var arrayFibonacci = [0, 1] //создаю массив из двух элементов
    for elem in 1...num {
        arrayFibonacci.append(arrayFibonacci[elem] + arrayFibonacci[elem - 1]) //в цикле добавляю новые элементы массива num раз
    }
    print(arrayFibonacci)
}
fibonacciNumber(num: 50)
//: 6. Заполнить массив из 100 элементов различными простыми числами
print("-----6 задание-----")

//Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу

let oneSimpleNum = 2 //пусть первое простое число изначально равно 2 (по условию)

//создаю функцию, которая проверяет число - простое оно или нет
func checkSimpleNumbers(number: Int) -> Bool {
    if number < oneSimpleNum {
        return false  //проверка параметра функции, он должен быть больше первого простого числа
    }
    
    for elementSequence in oneSimpleNum..<number {
        if number % elementSequence == 0 {
            return false //проверка на делимость, параметр функции должен делиться только на себя и на единицу
        }
    }
    return true
}

var simpleNumberArray = [Int]()
for elem in 1...100 {
    if checkSimpleNumbers(number: elem) {
        simpleNumberArray.append(elem) //ищу простые числа из последовательности от 1 до 100 и заполняю ими массив
    }
}
print(simpleNumberArray)
