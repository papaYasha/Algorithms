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

// Задача 11 - Одинаковые по длине строки, но не более чем 3 различных символа.
// Написать функцию, которая принимает две строки и возвращает true, если они одинаковы по длине, но различаются по содержанию не более, чем на 3 символа.

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

// Задача 12 - Поиск самого длинного префикса
// Написать функцию, которая принимает строку, состоящую из слов с похожими префиксами, разделенных пробелами и возвращает самый длинный префикс, который должен встречаться в каждом слове (например: "swift", "swim", "switch" вернет "swi")

func prefix(input: String) -> String {
    let parts = input.components(separatedBy: " ")
    guard let first = parts.first else { return "" }
    
    var currentPrefix = ""
    var bestPrefix = ""
    
    for letter in first {
        currentPrefix.append(letter)
        
        for word in parts {
            if !word.hasPrefix(currentPrefix) {
                return bestPrefix
            }
        }
        bestPrefix = currentPrefix
    }
    return bestPrefix
}

// Задача 13 - Повторение символа в ряду
// Написать функцию, которая принимает строку и возвращает строку, содержащую символ и количество его повторений в ряду(например строка "aaabbbccc" вернется в виде "a3b3c3", а строка "ff///" в виде "f2/3")

func howManyTimes(input: String) -> String {
    var currentLetter: Character?
    var returnValue = ""
    var letterCounter = 0
    
    for letter in input {
        if letter == currentLetter {
            letterCounter += 1
        } else {
            if let current = currentLetter {
                returnValue.append("\(current)\(letterCounter)")
            }
            currentLetter = letter
            letterCounter = 1
        }
    }
    if let current = currentLetter {
        returnValue.append("\(current)\(letterCounter)")
    }
    return returnValue
}

// Задача 14 - Перевернуть слова в строке
// Написать функцию, которая принимает строку и возвращает эту же строку, каждое слово в которой записано в обратном порядке, без использования цикла

func reverse(input: String) -> String {
    let parts = input.components(separatedBy: " ")
    let reversed = parts.map { String($0.reversed()) }
    return reversed.joined(separator: " ")
}

// Задача 15 - Остаток от деления
// Написать функцию, которая счиатает от 1 до 100 и печатает "Three" если число делится на 3, "Five" если число делится на 5, "Three Five" и на 3 и на 5.

func devision() {
    for i in 1...100 {
        if i % 3 == 0 && i % 5 == 0 {
            print("Three Five")
        } else if i % 3 == 0 {
            print("Three")
        } else if i % 5 == 0 {
            print("five")
        } else {
            print(i)
        }
    }
}

// Задача 16 - Сгенерировать рандомное число из диапазона
// Написать функцию, которая принимает два положительных числа - минамальное и максимальное значение диапазона и возвращает рандомное число из этого диапазона.

func randomNumberMinMax(min: Int, max: Int) -> Int {
    return Int.random(in: min...max)
}

// Задача 17 - Возведение одного числа в степень другого
// Написать функцию, которая принимает два положительных числа и возводит первое числа в степень второго.

func makePower(first: Double, second: Double) -> Double {
    guard first > 0, second > 0 else { return 0 }
    let inPower = pow(first, second)
    return inPower
}

// Задача 18 - Поменять числа местами
// Поменять местами 2 положительных числа (тип данных: Инт), без использования промежуточной переменной.

var a = 5
var b = 3

//a = a + b
//b = a - b
//a = a - b

//swap(&a, &b)

(a, b) = (b, a)

// Задача 19 - Найти простое число
// Написат функцию, которая принимает число (тип данных: Int) и возвращае true если это число является простым.

func primeNumber(number: Int) -> Bool {
    guard number >= 2 else { return false }
    
    for i in 2 ..< number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

// Задача 20 - Число в строке
// Написать функцию, которая принимает строку и возвращает true если строка содержит только числа, например, цифры от 0 до 9.

func checkFigureInString(string: String) -> Bool {
   return UInt(string) != nil
}

// Задача 21 - Сложить числа в строке
// Написать функцию, которая принимает строку, содержащую числа и буквы и возвращает сумму чисел в строке.

func addNumbersInString(string: String) -> Int {
    var currentNumber = ""
    var sum = 0
    
    for letter in string {
        let strLetter = String(letter)
        if Int(strLetter) != nil {
            currentNumber += strLetter
        } else {
            sum += Int(currentNumber) ?? 0
            currentNumber = ""
        }
    }
    sum += Int(currentNumber) ?? 0
    return sum
}

// Задача 22 - Вычислить квадратный корень
// Написать функцию, которая принимает число (тип данных: Int) и возвращает квадратный корень из этого числа, округленный до ближайшего целого. Без использования функции sqrt().

func squareRoot1(input: Int) -> Int {
    guard input != 1 else { return 1 }
    
    for i in 0 ... input {
        if i * i > input {
            return i - 1
        }
    }
    return 0
}

func squareRoot2(input: Int) -> Int {
    return Int(pow(Double(input), 0.5))
}

// Задача 23 - Вычитание без оператора
// Написать функцию, котороая принимает два положительных числа и возвращает число, равное разности второго и первого входных чисел без использования арифметического оператора "-"
 
func subtraction(subract: Int, from: Int) -> Int {
    return from + -1 * subract
}

