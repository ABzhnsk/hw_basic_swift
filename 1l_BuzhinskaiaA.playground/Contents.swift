import UIKit
import Darwin

//: 1. Решить квадратное уравнение
print("-----------1 задание---------------")

// объвление переменных
let a: Double = 2
let b: Double = 25.5
let c: Double = 3.7

print("\(a) * x^2 + \(b)x + \(c) = 0 ") // вывод в консоль формулы квадратного уравнения

let discriminant = b * b - 4 * a * c // переменная с формулой дискременанта

if discriminant > 0 {
    // если дискременант > 0, то 2 корня
    
    let rootOne: Double = (-1 * b - sqrt(discriminant)) / (2 * a) // переменная с нахождением первого корня
    let rootTwo: Double = (-1 * b + sqrt(discriminant)) / (2 * a) // переменная с нахождением второго корня
    print("x1 = \(rootOne), x2 = \(rootTwo)") // вывод в консоль получившиеся корни уравнения
}
else if (discriminant == 0) {
    // если дискременант = 0, то 1 корень
    
    let rootOnlyOne: Double  = (-1 * b) / (2 * a) // переменная с нахождением одного корня
    print("x1 = \(rootOnlyOne)") // вывод в консоль получившегося корня
}
else {
    
    print("Нет корней") // в других случаях выводится сообщение "Нет корней" в консоль
}


//:2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника
print("-----------2 задание---------------")

let sideOne: Double = 5.6
let sideTwo: Double = 9  //инициализация катетов

print("Даны катеты: катет 1 = \(sideOne), катет 2 = \(sideTwo)") //вывод значения катетов в консоль

if sideOne > 0 && sideTwo > 0 {
    // проверка на правильность катетов ( катеты не должны быть отрицательными и равны 0 )
    
    let hypotenuse: Double  = sqrt(pow(sideOne, 2) + pow(sideTwo, 2)) // формула нахождения гипотенузы
    let P: Double = sideOne + sideTwo + hypotenuse // формула нахождения периметра
    let S: Double = (sideOne * sideTwo) / 2.0 // формула нахождения площади
    print("Гипотенуза = ", hypotenuse) //вывод результата в консоль
    print("Площадь прямоугольного треугольника = ", S) //вывод результата в консоль
    print("Периметр прямоугольного треугольника = ", P) //вывод результата в консоль
}
else {
    
    print("Неверные значения катетов")
}


//: 3. Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет
print("-----------3 задание---------------")

let deposit: Double = 100000
let cent: Double = 7.5
let year = 5

print("Дано: сумма вклада = \(deposit), годовой процент = \(cent), период = \(year) лет")

if cent > 0 && deposit > 0 && year > 0 {
    
    let depositAmount = deposit * (1 + 0.01 * cent * Double(year))
    print("Через 5 лет на счету будет = \(depositAmount)")
}
else {
    
    print("Процент не может быть отрицательным")
}


















