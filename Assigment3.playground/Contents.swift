import UIKit

/*
 1.Control Statements (if , if else, if else if else,switch)
 2.Loops (for loop , while loop, repeat while)
 3.Initialisers in Swift
 4. Enums and its types
 5.Different uses of Enums and use of variables and functions inside Enum
 6.Mutating Function in struct
 */

// 1.Conditional Expresstion
var isTrue = true
if isTrue{
    print(true)
}
else{
    print(false)
}

//1.for loops
//for loops that will print out the elements in the Array
var numberArray = [1,2,3,4,5]
for value in numberArray{
    print(value)
}
//how to use for loops to run throught a dictionary
let dictionary = ["a":1, "b":2, "c":3]
for value in dictionary{
    print(value)
}//this another way to go throught the data using for loops
for (key,val) in dictionary{
    print("key = \(key), value = \(val)")
}
//for loop using stride to control the forloop
//from -> where the for loop starts to -> where the for loop conditional ends by -> what kind of inteveral that the for loop will incorprate like 2 will increase the number by 2 everytime goes throught the for lopp
for i in stride(from: 1, to:20, by: 3){
    print (i)
}
//while // this will not excute at all if it doesn't see the condtion
var num2 = 5
while num2 < 10{
    print(num2)
    num2 += 1
}

//repeat while //this will excute the value atleast once
var num = 10
repeat{
    print(num)
    num += 1
}while num <= 20
//3. default inilizers
class Person{
    var name: String = "SwiftUI"
    var age: Int = 4
}
let p1 = Person()//this is the default initilizer because it come with the default data in the class

//2. MemberWise Initilzer
struct EmployeeStruct{
    var nameE: String
    var ageE: Int
}
let e1 = EmployeeStruct(nameE: "Tonys", ageE:29)// mean it create the memeber in the object for the struct
//3.custom Initilizer
class EmployeeClass{
    var empName: String
    var empAge: Int
    
    init(empName: String, empAge: Int){
        self.empName = empName
        self.empAge = empAge
    }
}
let empClass = EmployeeClass(empName: "TOny", empAge: 29)// create the object for classes

//4. failable Initizler used to check for the data if it fit for the the strut
struct Dog{
    var breed:String
    init?(breed:String){
        if breed != "as"{
            return nil
        }
        self.breed = breed
    }
}
let d1 = Dog(breed: "chi")
//5. requried Init
class SEmp{
    var yearsOfExp: Int
    required init(yearsOfExp: Int) {
        self.yearsOfExp = yearsOfExp
    }
}

class AccoutsEmp:SEmp{
    var age: Int?
    init(age: Int, years: Int) {
        super.init(yearsOfExp: years)
        self.age = age
    }
    
    required init(yearsOfExp: Int) {
        super.init(yearsOfExp: yearsOfExp)
    }
}
var emp21 = AccoutsEmp(age: 29, years: 9)
print(emp21.yearsOfExp)


 //Enums- Group of  related data types can have func and propertys
enum days:Int{
    case day1 = 200 // will incriment by 1 other than that it will go with zero
    case day2
    case day3
    case day100
 }
enum WeekDays:CaseIterable{
    case monday
    case tuesday
    case wedenday
    case thru
    case fri
    case sat
    case sun
    // example of another way to use switch cases in enums
    func dayType()->String{
        switch self{
        case .sun, .sat:
            return "Weekend"
        default:
            return "Weekdays"
        }
    }
}
    print(WeekDays.monday.dayType())
    print(WeekDays.sun.dayType())
    print(WeekDays.monday)
    for value in WeekDays.allCases{
     print(value)
    }
        //1. Raw Value Enum
        enum Cartoons:String{
            case EdEddEddy = "funny"
            case DeathNote = "The chip"
            case BlackClover = "Musceles"
            case Scooby
        }
        print(Cartoons.DeathNote.rawValue)
    

//2.Assiocited Type Enum
enum TypeGenus{
    case Comedy(Genus:Int)
    case Drama(Genus:Int)
    case romance(GenusString:String)
    case sliceOfLife
}
print(TypeGenus.Comedy(Genus: 200))
    
func getGenusType(range: TypeGenus){
    switch range {
        //each case has to have a condition or some kind of epression for this to function
    case .Comedy(Genus: let Genus):
        if Genus >= 0{
            print("Comedy")
        }
    case .Drama(Genus: let Genus):
        if Genus == 1{
            print("Drama")
        }
    case .romance(GenusString: _):
        print("Romance")
    default:
        print("defualt")
    }
    
}
getGenusType(range: TypeGenus.Comedy(Genus: 0))
//these enum are example for  error like if something in code isn't written correctily
enum NetworkError{
    case ResposeError(_code:Int)
    case PrasingError
    case DataNotFoundError
}
struct Counter{
    var counter: Int
    init(counter: Int){
        self.counter = counter
    }
    mutating func addOne(){// mutating key word make so you can mutate the values of the properties
        counter += 1
    }
}

var counter1 = Counter(counter: 1)
print("Counter1 = \(counter1.counter)")
counter1.addOne()
print("Counter1 = \(counter1.counter)")
