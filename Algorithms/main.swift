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

// Задача 7 - Сокращение количество пробелов до одного
// Написать функцию, которая принимает строку как свой единственный параметр и возвращает ту же самую строку только с замененными множественными пробелами на единичный пробел

func deleteExtraSpaces(string: String) -> String {
    var seenSpace = false
    var returnValue = ""
    
    for letter in string {
        if letter == " " {
            if seenSpace { continue }
            seenSpace = true
        } else {
            seenSpace = false
        }
        returnValue.append(letter)
    }
    return returnValue
}

// Задача 8 - Является ли строка панграммой?
// Написать функцию, которая принимает строку и возвращает true если эта строка является панграммой, игнорирую регистр (панграмма - фраза, содержащая в себе все буквы алфавита)

func checkPangramm(input: String) -> Bool {
    let set = Set(input.lowercased())
    let letters = set.filter {
        $0 >= "a" && $0 <= "z"
    }
    return letters.count == 26
}

// Задача 9 - Количество гласных и согласных
//Написать функцию, которая принимает строку и возвращает tuple, содержащий число гласных и согласных букв данной строки.

func separate(input: String) -> (vowels: Int, consonants: Int) {
    let vowels = "aeiou"
    let consonants = "qwrtypsdfghjklzxcvbnm"
    
    var vowelCount = 0
    var consonantCount = 0
    
    for letter in input.lowercased() {
        if vowels.contains(letter) {
            vowelCount += 1
        } else if consonants.contains(letter) {
            consonantCount += 1
        }
    }
    return(vowelCount, consonantCount)
}

// Задача 10 - Одинаковые по длине строки
// Написать функцию, которая принимает две строки и возвращает true, если они одинаковы по длине

func compareStringByLenght(string1: String, string2: String) -> Bool {
    var boolResult = false
    if string1.count == string2.count {
        boolResult = true
    }
    return boolResult
}

// Задача 11 - Одинаковые по длине строки, но не более чем 3 различные буквы
// Написать функцию, которая принимает две строки и возвращает true, если они одинаковы по длине, но различаются по содержанию не более, чем на 3 буквы.

func compareStringByLenghtAnd3DifLetter(string1: String, string2: String) -> Bool {
    guard string1.count == string2.count else { return false }
    let firstArray = Array(string1)
    let secondArray = Array(string2)
    var differences = 0
    
    for (index, letter) in firstArray.enumerated() {
        if secondArray[index] != letter {
            differences += 1
            if differences == 4 {
                return false
            }
        }
    }
    return true
}
