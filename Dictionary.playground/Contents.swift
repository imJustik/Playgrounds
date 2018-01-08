//: Playground - noun: a place where people can play

import UIKit

let dict = ["first":1, "second":2, "third":3]
let dictMap = dict.map { $0.key + "1" }
dictMap.forEach { print($0) }

let dictFlatMap = dict.mapValues { $0 + 5 }
dictFlatMap.forEach { print($0) }


struct SomeClass: Hashable {
    let name: String
    let hashValue: Int = 0 //O(n)
    
    static func ==(lhs: SomeClass, rhs: SomeClass) -> Bool {
        return lhs.name == rhs.name &&
               lhs.hashValue == rhs.hashValue
    }
}

let some1 = SomeClass(name: "some1")
let some2 = SomeClass(name: "some2")
let someDict = [some1: "some1", some2: "some2"]
print(someDict[some1] ?? "nil")


class SomeClass2: Hashable {
    let name: String
    var hashValue: Int = 0
    
    init(name: String) {
        self.name = name
    }
    
    static func ==(lhs: SomeClass2, rhs: SomeClass2) -> Bool {
        return lhs.name == rhs.name &&
            lhs.hashValue == rhs.hashValue
    }
}

print("********")

let sObject = SomeClass2(name: "sss")
let sObject1 = SomeClass2(name: "ooo")
let someDict1 = [sObject: "dddddd", sObject1: "bbbbbbb"]
print(someDict1[sObject] ?? "----")
sObject.hashValue = 1
print(someDict1[sObject] ?? "nil")
