import UIKit
import Foundation

// Program 1

class Book: CustomStringConvertible, Codable {
    
    var title: String
    var author: String
    var isbn: Int
    
    init(title: String, author: String, isbn: Int) {
        self.title = title
        self.author = author
        self.isbn = isbn
    }
    
    var description: String {
        
        return "Book Title: \(self.title), Author: \(self.author), ISBN: \(self.isbn)"
    }
    
}

print("-----------Program 1-----------")

// Create a book
var book = Book(title: "Tristan's Adventures", author: "D.A. McMeekin", isbn: 100)
print(book)

// Program 2

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
        
        return "Book Title: \(self.title), Author: \(self.author), ISBN: \(self.isbn)"
    }
    
}

print("-----------Program 2-----------")

// Create a book two
var bookTwo = BookTwo(title: "Tristan's Adventures", author: "D.A. McMeekin", isbn: 100)
print(bookTwo)

let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

let archiveURL = documentDirectory.appendingPathComponent("book_library.plist")

let propertyListEncoder = PropertyListEncoder()

let encodedBook = try?propertyListEncoder.encode(bookTwo)
try?encodedBook?.write(to: archiveURL, options: .noFileProtection)

let propertyListDecoder = PropertyListDecoder()

if let retrieveBookData = try? Data(contentsOf: archiveURL), let decodedBook = try? propertyListDecoder.decode(BookTwo.self, from: retrieveBookData) {
    
    print(decodedBook)
}






















