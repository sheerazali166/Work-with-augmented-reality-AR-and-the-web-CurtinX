import UIKit

// Program 1

print("-----------------Program 1-----------------")

func addition(numbers: [Int]) -> Int {
    
    var total = 0
    
    for number in numbers {
        total = total + number
    }
    
    return total
}

print(addition(numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))

// print(addition(numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]))

// print(addition(numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]))

// print(addition(numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]))

// print(addition(numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]))

// print(addition(numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]))

// print(addition(numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]))

// print(addition(numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]))

// print(addition(numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]))

// kiya kar sakte hain illigal puppies jitni choot pe laat utni chootain aage
// print(36 - 71)

// Program 2

print("-----------------Program 2-----------------")

let sumClosure = { (numbers: [Int]) -> Int in
    
    var total = 0
    
    for number in numbers {
        total = total + number
    }
    
    return total
}

let addClosure = { (numbers: [Int]) -> Int in
    
    var total = 0
    
    for number in numbers {
        total = total + number
    }
    
    return total
}

let sum = sumClosure([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

let add = addClosure([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

// let addTwo = addClosure([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20])

// let addThree = addClosure([1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
                           // 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
                                    // 21, 22, 23, 24, 25, 26, 27, 28, 29, 30])

print(sum)

print(add)

//print(addTwo)
//print(addThree)

// Program 3

print("-----------------Program 3-----------------")

let addClosureFour = { (numbers: [Int]) -> Int in
    
    var total = 0
    
    for number in numbers {
        total = total + number
    }
    
    return total
}

let subClosureFour = { (numbers: [Int]) -> Int in
    
    var difference = 0
    
    for number in numbers {
        difference = difference - number
    }
    
    return difference
}

let multiClosureFour = { (numbers: [Int]) -> Int in
    
    var product = 0
    
    for number in numbers {
        product = product * number
    }
    
    return product
}

let divClosureFour = { (numbers: [Int]) -> Double in
    
    var divide = 1.0
    
    for number in numbers {
        divide = divide / Double(number)
    }
    
    return divide
}

// let addFour = addClosureFour([2, 2])
// print(addFour)

// let sub = subClosureFour([2, 2])
// print(sub)

// let multi = multiClosureFour([2, 2])
// print(multi)

let div = divClosureFour([2, 2])
print(div)



