//
//  main.swift
//  Algorithms
//
//  Created by Macbook on 13.04.22.
//

import Foundation

// Задача 1 - Проверка уникальных символов в строке
// Написать функцию, которая принимает строку как своей единственный параметр и возвращает true если строка содержит только уникальные символы.

func checkUniqueString(input: String) -> Bool {
    var checkedSymbols = [Character]()
    for symbol in input {
        if checkedSymbols.contains(symbol) {
            return false
        }
        checkedSymbols.append(symbol)
    }
    return true
}

func checkUniqueStringSet(input: String) -> Bool {
    return Set(input).count == input.count
}

// Задача 2 - Проверка полиндрома
// Написать функцию, которая принмиает строку как свой единственный параметр и возвращает true если эта строка может быть прочитана одинакого как слева направо, так и српаво налево, игнорирую регистр)

func checkPolindrom(input: String) -> Bool {
    let lowercased = input.lowercased()
    return String(lowercased.reversed()) == lowercased
}

// Задача 3 - Проверка одинаковых символов в строке
// Написать функцию, которая принимает две строки и возвращает true если эти строки содержат одни и те же символы в любом порядке с учетом регистра.

func checkStringSimilarity(string1: String, string2: String) -> Bool {
    var checkString = string2
    for letter in string1 {
        if let index = checkString.firstIndex(of: letter) {
            checkString.remove(at: index)
        } else {
            return false
        }
    }
    return checkString.count == 0
}

func checkStringSimilarity2(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
}

// Задача 4 - Одна строка полностью содержит другую
// Написать функцию, которая принимает одну строку и возвращает true если эта строка полностью содержится в другой строке, игнорирую регистр.

func checkStringContainAnotherString(input1: String, input2: String) {
    let str1 = "Hello, Swift"
    print(str1.customContains("swift"))
}

extension String {
    func customContains(_ string: String) -> Bool {
        return self.lowercased().contains(string.lowercased())
    }
}

// Задача 5 - Сколько раз символ встречается в строке?
// Написать функцию, которая принимает строку и символ, а далее возвращает количетсво раз, которое данный символ встречается в строке, с учетом регистра.

func countLetterInString(input: String, character: Character) -> Int {
    var letterCount = 0
    for letter in input {
        if letter == character {
            letterCount += 1
        }
    }
    return letterCount
}

// Задача 6 - Удаление повторяющихся символов из строки
// Написать функцию, которая приимает строку как свой единственный параметр и возвращает ту же самую строку с удаленными повторяющимися символами (например: "hello" -> "helo")

func sort1(string: String) -> String {
    var used = [Character]()
    for letter in string {
        if !used.contains(letter) {
            used.append(letter)
        }
    }
    return String(used)
}


