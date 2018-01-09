import UIKit

enum List<Element> {
    case end
    indirect case node(Element, next: List<Element>)
}


let emptyList = List<Int>.end
let oneElementList = List.node(1, next: emptyList)

extension List {
    func cons(_ x: Element) -> List {
        return .node(x, next: self)
    }
}

let list = List<Int>.end.cons(1).cons(2).cons(3)

extension List: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        self = elements.reversed().reduce(.end) { partialList, element in
            partialList.cons(element)
        }
    }
}

let list2: List = [2,1]
print(list2)
let list3 = list2.cons(3)
let list4 = list2.cons(33)


extension List {
    mutating func push(_ x: Element) {
        self = self.cons(x)
    }
    
    mutating func pop() -> Element? {
        switch self {
        case .end: return nil
        case let .node(x, next: tail):
            self = tail
            return x
        }
    }
}

var stack: List<Int> = [3,2,1]
var a = stack
var b = stack

a.pop() //3
a.pop() //2
a.pop() //1

stack.pop() //3
stack.push(4)

b.pop() //3
b.pop() //2
b.pop() //1

stack.pop() //4

extension List: IteratorProtocol, Sequence {
    mutating func next() -> Element? {
        return pop()
    }
}

let listSeq: List = ["1","2","3"]
listSeq.forEach { print($0) }

/*
 In computer science theory, linked lists are more efficient than arrays for some common operations. In practice, however, it’s really hard to outperform arrays on modern computer architectures with their extremely fast caches and (relatively) slow main memory. Because arrays use contiguous memory for their elements, the processor can process them way more efficiently.
 */

