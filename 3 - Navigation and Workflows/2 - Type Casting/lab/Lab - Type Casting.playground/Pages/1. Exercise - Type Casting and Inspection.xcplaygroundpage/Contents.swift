/*:
 ## Exercise - Type Casting and Inspection
 
 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
var myCollection: [Any] = [1.5, 5.05, "hello", 3, "test", 100, false]
print(myCollection)

/*:
 Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
 */
for item in myCollection {
    if let integer = item as? Int {
        print("The integer has a value of \(integer)")
    }
    if let string = item as? String {
        print("The string has a value of \(string)")
    }
    if let double = item as? Double {
        print("The double has a value of \(double)")
    }
    if let bool = item as? Bool {
        print("The boolean has a value of \(bool)")
    }
}

/*:
 Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
 */
let myDictionary : [String: Any] = ["Double": 2.5, "String": "hello", "Boolean": true, "Integer" : 5]
print(myDictionary)

/*:
 Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
 */
var total: Double = 0
for (key, value) in myDictionary {
    if let double = value as? Double {
        total += double
    }
    if let integer = value as? Int {
        total += Double(integer)
    }
    if let string = value as? String {
        total += 1
    }
    if let bool = value as? Bool {
        if (bool) {
            total += 2
        } else {
            total -= 3
        }
    }
}

print(total)
/*:
 Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
 */
var total2 : Double = 0

for (key, value) in myDictionary {
    if let integer = value as? Int {
        total2 += Double(integer)
    }
    if let double = value as? Double {
        total2 += double
    }
    if let string = value as? String {
        if let stringDouble = Double(string) {
              total2 += stringDouble
        }
      
    }
}

print(total2)
//: page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
