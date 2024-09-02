import UIKit

// Program 1

print("----------------Program 1----------------")

struct Person {
    
    var name: String
    var age: Int
    var address: String
    var email: String
    
}

var people = [Person(name: "Tristan", age: 25, address: "123 Fake St, Perth", email: "tristan@gmail.com"),
              Person(name: "David", age: 30, address: "124 Fake Ave, Perth", email: "david@gmail.com")]

print(people)

// yeh tum decide nahi karo gi kaun one hai kaun two tum karogi toh tumhare pass logon ko jana chahye

// Program 2

print("----------------Program 2----------------")


struct PersonTwo {
    
    var name: String
    var age: Int
    var address: String
    var email: String
    
}

var peopleTwo = [PersonTwo(name: "Tristan", age: 25, address: "123 Fake St, Perth", email: "tristan@gmail.com"),
              PersonTwo(name: "David", age: 30, address: "124 Fake Ave, Perth", email: "david@gmail.com"),
              PersonTwo(name: "Tim", age: 60, address: "456 Fake St, Perth", email: "tim@gmail.com"),
              PersonTwo(name: "Sandie", age: 40, address: "123 Fake Ave, Perth", email: "sandie@gmail.com")]


var sortedPeople = peopleTwo.sorted {
    return $0.name < $1.name
}

print(sortedPeople)

var sortedPeopleAge = peopleTwo.sorted {
    return $0.age < $1.age
}

print(sortedPeopleAge)


// Program 3

print("----------------Program 3----------------")

var numbers = [7, 42, 9, 18, 27]

var numbersMap = numbers.map{(numbers) in
    return numbers * 2
}

print(numbersMap)

// Program 4

print("----------------Program 4----------------")

var numbersFilter = numbers.filter { (number) -> Bool in
    return number < 20
}

var numbersFilterTwo = numbersMap.filter { (number) -> Bool in
    return number < 20
}

// problem in anushka if you can't why are you taking credit
//print(numbersFilter)

print(numbersFilterTwo)


// Program 5

print("----------------Program 5----------------")


var numbersReduce = numbersFilter.reduce(0) { (currentNumber, number) -> Int in
    return currentNumber + number
}

var numbersReduceTwo = numbersFilterTwo.reduce(0) { (currentNumber, number) -> Int in
    return currentNumber + number
}

print(numbersReduce)
print(numbersReduceTwo)

print("--------------")

print(52 - 34)
print(54 - 32)

print("--------------")

print(52 - 32)
print(54 - 34)

print("--------------")

print(34 - 18)
print(32 - 22)

print("--------------")

print(16 - 20)
print(10 - 20)


