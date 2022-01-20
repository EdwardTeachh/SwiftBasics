//
//  main.swift
//  dz02
//
//  Created by Admin on 21.10.2021.
//

import Foundation

// MARK: - 1. Написать функцию, которая определяет, четное число или нет.

func evenNumber(_ value: Int) -> Bool {
    return value % 2 == 0
}

// MARK: - 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

//var b = 55

func divisionNumber(_ value: Int) -> Bool {
    return value % 3 == 0 ? true : false
}

//MARK: - 3. Создать возрастающий массив из 100 чисел.

var xArray : Array<Int> =  [Int]()
var i = 0
while i<100 {
    xArray.append(i+1)
    i+=1
}

// MARK: - 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

xArray.removeAll(where: {evenNumber($0) || !divisionNumber($0)})


//print(xArray)

