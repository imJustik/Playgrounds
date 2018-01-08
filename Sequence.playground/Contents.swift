//: Playground - noun: a place where people can play

import UIKit

extension Sequence {
    func reduce1(
        _ nextPartialResult: (Element, Element) -> Element
        ) -> Element?
    {
        var i = makeIterator()
        
        guard var accumulated = i.next() else {
            return nil
        }
        print("accumulated: \(accumulated)")
        
        while let element = i.next() {
            print("element \(element)")
            accumulated = nextPartialResult(accumulated, element)
            print("accumulated2: \(accumulated)")
        }
        return accumulated
    }
}


let animals = ["1", "123", "12"]

let longest = animals.reduce1 { current, element in
    if current.count > element.count {
        return current
    } else {
        return element
    }
}

print(longest ?? "nil")



print ("*********---**********")


struct Countdown: Sequence {
    let start: Int
    
    func makeIterator() -> CountdownIterator {
        return CountdownIterator(self)
    }
}

struct CountdownIterator: IteratorProtocol {
    let countdown: Countdown
    var times = 0
    
    init(_ countdown: Countdown) {
        self.countdown = countdown
    }
    
    mutating func next() -> Int? {
        let nextNumber = countdown.start - times
        guard nextNumber > 0 else { return nil }
        times += 1
        return nextNumber
    }
}

let threeTwoOne = Countdown(start: 3)
var iterator = threeTwoOne.makeIterator()
while let number = iterator.next() {
    print(number)
}
print("--------------------")

extension Sequence {
    func last(where predicate: (Element) -> Bool) -> Element? {
        for element in reversed() where predicate(element) {
            return element
        }
        return nil
    }
}

let names = ["Elena", "Hua", "SomeName"]
let match = names.last { $0.hasSuffix("a") }
print(match ?? "none")





