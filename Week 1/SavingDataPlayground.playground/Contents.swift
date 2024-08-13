import UIKit
import Foundation

// Program 1

class Book: CustomStringConvertible {
    
    var title: String
    var author: String
    var isbn: Int
    
    init(title: String, author: String, isbn: Int) {
        self.title = title
        self.author = author
        self.isbn = isbn
    }
    
    var description: String {
        return "Book title: \(self.title), Author: \(self.author), ISBM: \(self.isbn)"
    }
    
}

print("-------------Program 1-------------")

// Create a book
var book = Book(title: "Tristan's Adventures", author: "D.A. McMeekin", isbn: 100)
print(book)

// Program 2

print("-------------Program 2-------------")


class BookTwo: CustomStringConvertible, Codable {
    
    var title: String
    var author: String
    var isbn: Int
    
    init(title: String, author: String, isbn: Int) {
        self.title = title
        self.author = author
        self.isbn = isbn
    }
    
    var description: String {
        return "Book title: \(self.title), Author: \(self.author), ISBM: \(self.isbn)"
    }
    
}

// Create a book two
var bookTwo = BookTwo(title: "Tristan's Adventures", author: "D.A. McMeekin", isbn: 100)
print(bookTwo)

let propertyListEncoder = PropertyListEncoder()

if let encodedBook = try?propertyListEncoder.encode(bookTwo) {
    
    print(encodedBook)
    
    let propertyListDecoder = PropertyListDecoder()
    
    if let decodedBook = try? propertyListDecoder.decode(BookTwo.self, from: encodedBook) {
        print(decodedBook)
    }
        
}






