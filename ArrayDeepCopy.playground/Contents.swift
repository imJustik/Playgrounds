import Foundation

class Class1: NSCopying {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Class1(name: name)
        return copy
    }
}

let arr = [Class1(name: "name"), Class1(name: "name1"),Class1(name: "name2")]
var arr2 = arr
let arr3 = arr.map { $0.copy() as! Class1}

arr[0].name = "Testable"
arr2.append(Class1(name: "fds"))
arr3[1].name = "da mne vse p"

arr.map { print($0.name) }
print(" ---- ")
arr2.map { print($0.name) }
print(" ---- ")
arr3.map { print($0.name) }


let a = NSMutableArray(array: [1,2,3])
let b: NSArray = a

a.insert(4, at: 3)




