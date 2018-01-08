//: Playground - noun: a place where people can play

import UIKit

struct PrefixIterator: IteratorProtocol {
    
    let string: String
    var offset: String.Index
    
    init(string: String) {
        self.string = string
        offset = string.startIndex
    }
    
    mutating func next() -> Substring? {
        guard offset < string.endIndex else { return nil }
        offset = string.index(after: offset)
        return string[..<offset]
    }
}

struct PrefixString: Sequence {
    let string: String
    func makeIterator() -> PrefixIterator {
        return PrefixIterator(string: string)
    }
}

let prefixString = PrefixString(string: "Hello")
for substring in prefixString {
    print(substring)
}

let prefixArray = prefixString.map { $0.uppercased() }
prefixArray.forEach { print($0) }


print("---------------")

func fibsItetor() -> AnyIterator<Int> {
    var state = (0,1)
    return AnyIterator {
        let upcomingNumber = state.0
        state = (state.1, state.0 + state.1)
        return upcomingNumber
    }
}

let fibs = AnySequence(fibsItetor())
Array(fibs.prefix(10))


// ---------------

struct MyIteractor<T: Collection>: IteratorProtocol {
    let value: T
    var offset: T.Index

    init(value: T) {
        self.value = value
        offset = value.startIndex
    }

    mutating func next() -> T.Element? {
        guard offset < value.endIndex else { return nil }
        defer { offset = value.index(after: offset) }
        return value[offset]
    }
}

struct MyStruct<T: Collection>: Sequence {
    let value: T
    let iterator: AnyIterator<T.Element>

    init(value: T) {
        self.value = value
        self.iterator = AnyIterator(MyIteractor(value: value))
    }

    func makeIterator() -> AnyIterator<T.Element> {
        return iterator
    }
}

let myStruct = MyStruct(value: ["a","b","c"])
for value in myStruct {
    if value == "b" { break }
    print(value)
}
print("***")
for value in myStruct {
    print(value)
}


