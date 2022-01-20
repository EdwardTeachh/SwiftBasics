// ax2+bx-c =0

// дискриминант d = b2 - 4ac
import Foundation


let a : Double = 3
let b : Double = 7
let c : Double = -10
var x1 : Double
var x2 : Double

var resalutDis = (b*b) - (4*a*c)

print(resalutDis) // дискриминант положительный

x1 = (-b + sqrt(resalutDis)) / (2 * a)
x2 = (-b - sqrt(resalutDis)) / (2 * a)

print("x1 =  \(x1)")
print("x2 = \(x2)")

// задание 2 Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.


let aLeg : Double = 3
let bLeg : Double = 4
var hypotenuse : Double

var Interpreter = (a*b) / 2    // площадь прямоугольного треугольника
    hypotenuse = sqrt((aLeg * aLeg) + (bLeg*bLeg))  // гипотенуза треугольника
var perimetr = aLeg + bLeg + hypotenuse

print("Interpreter = \(Interpreter)")
print("hypotenuse = \(hypotenuse)")
print("perimetr = \(perimetr)")



    // задание 3 Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

var contribution : Double = 15000
var percent : Double = 3.5

var resultpercent = (contribution / 100 * percent / 365 * 1825)
var resultcontribution = contribution + resultpercent

print("resultcontribution = \(resultcontribution)")
