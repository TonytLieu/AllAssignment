import UIKit

/*
 1.Sets
 2.Dictionary
 3.Optionals
 4.Show different ways of optional binding
 5.Classes and inheritance and initialisers for it
 7.Structs and initialisers for it

 Prepare Theoretical part for above topics as well, We will have question answer session for it.
 */
//1.Sets
var Shapes:Set<String> = ["Ball","Triangle", "circle"]// differenct between sets and arrays are that the set has to have unique elements but array don't
print(Shapes)


//2.Dictirnary
var  books: [String:Int] = ["Harry Potter":7]//hashs
print(books)
//change the key by method below
books["Harry Potter"] = 999
print(books)

//optional
// ? is a way to intilaized a varible without any being attach to it

var someNam:String? = "Kaisa"
var n1:Double?

//4.Show different ways of optional binding
if let Names = someNam{
    print(Names)//this will will print name without an optional indicator
}
//guard let has to be made using a function to create
func changeOpGuard(){
    guard let name2 = someNam else{
        return
    }
    print(name2 + " Guard let version")
}
changeOpGuard()

//?? collection operator
print(someNam ?? "Defualt value")//this one will print name with optional indicator

//force unwrap
print(someNam!)//never use because of chance of cause crashes are high


//Classes and inheritance and initialisers for it :using heap memory
class Empolyee{
    var name:String
    var empID:Int
    var sal:Int? //this varible is an data type that not every person will have
    
    //default intilizer/ construtor
    init(name: String, empID: Int, sal:Int?) {
        self.name = name
        self.empID = empID
        self.sal = sal
    }
    //constructor for employee without salarys
    init(name: String, empID: Int) {
        self.name = name
        self.empID = empID
    }
    func walking() -> Void{
        print("\(name) Enployee is walking")
    }
    //this is for when the data is set to private so you can get the componements from the constructor
    func getEmpID()-> Int{
        return self.empID
    }
    func getEmpName()-> String{
        return self.name
    }
}
let emp1 = Empolyee(name: "Tony ", empID: 2000, sal:20)
let emp2 = Empolyee(name: "Tom", empID: 2001)
print(emp1.getEmpID())
print(emp1.getEmpName())
emp1.walking()
//example of inheritance
class ITEmployee:Empolyee{
    var techName:String
    init(techName: String, name:String, id:Int) {
        self.techName = techName
        super.init(name:name, empID:id)
    }
    func getTechName()->String{
        return techName
    }
}
let emp3 = ITEmployee(techName:"Tech Consulting", name:"Tony", id:2000)
emp3.walking()
print(emp3.getTechName())

//Structs and initialisers for it using stack memory
struct Empolyee2{
    var name:String
    var empID:Int
    var sal:Int?
    
    //functions for structs
    func walking() -> Void{
        print("\(name) Enployee is walking")
    }
    func getEmpID()-> Int{
        return self.empID
    }
    func getEmpName()-> String{
        return self.name
    }
}
//constructs for Structs
var s1 = Empolyee2(name:"hello", empID: 2324, sal:2000)
var s2 = Empolyee2(name:"hello2", empID: 4567)
print(s1)
s1 = s2
print(s2)
