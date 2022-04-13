//
//  main.swift
//  Algorithms
//
//  Created by Macbook on 13.04.22.
//

import Foundation

// Задача 1.
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

// Задача 2.
// Написать функцию, которая принмиает строку как свой единственный параметр и возвращает true если эта строка может быть прочитана одинакого как слева направо, так и српаво налево, игнорирую регистр)

func checkPolindrom(input: String) -> Bool {
    let lowercased = input.lowercased()
    return String(lowercased.reversed()) == lowercased
}

// Задача 3.
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

print(checkStringSimilarity(string1: "qwert", string2: "qwerty"))
