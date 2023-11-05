import UIKit
import Foundation
/*
var greeting = "Hello, playground"
/*
 early 1980 -1983 NextStep Computer
 NeXT's operating system- Objective C,
 
 Objective C- Brad Cox
 1997 -Apple - NextStep
 MacOS
 IOS 29 June 2007 iphone OS-1
 2007-2014- Obj C-, C, C++
 
 2014-Swift
 UIkit
 2019-SwiftUI
 
 Langauges
 ObjC
 Swift
 
 UIFramework
 UIkit
 SwiftUI
 
 IOS 17
 WWDC
 
 IOS
 MacOS
 WatchOS
 tvOS
 
 */
print("Hello world")

//-single line comment
/*
 mutiline comment
 
 name
 first Name
 age
 gender
 EmployeeID
 
 doWork
 doExercsie
 takeLunch
 */

//type infericing
var name = "Tony"
var age = "30"
//let- contast var- variable
let gender = "male"
var EmployeeID = "69"

//data types
var lastName:String = "Lieu" //string

//ARC _ automatic refrece conuting  Type safe help detect if the var is the right data type
var rollNo:Int = 420 //int
var num:Float = 12.3 // float
var number:Double = 98763 //double
var isCorrect:Bool = true
//functions- methods simple fuctions
func doAdditions() {
    print("doing Maths")
}

doAdditions()

//2.Func taking some parmeters

func doSum(num1:Int, num2:Int){
    let result = num1 + num2
    print(result)
}
doSum(num1: 1, num2: 1)

func doSubstraction(n1:Int, n2:Int)-> Int{
    let res = n1 - n2
    return res

}

let ans = doSubstraction(n1: 100, n2: 1)
print(ans)

func doSomeTask(Name:String, age:Int, Gender:Bool)->String{
    return name + String(age) + String(Gender)
}
 let r1 = doSomeTask(Name: "Swift", age: 9, Gender: true)
print(r1)

var sal = 10.1
print("results is \(r1) \(sal)")

let tupleExample = (1, "A", true)
func taskWhichReturnMulipleThings()-> (Int,String){
    return (10, "ABC")
}
var arrayOFString = ["A","B","C"]
print(arrayOFString)
print(arrayOFString[2])

var arrayOFInt = [1,2,3,4,5,6,7]
// append = added to the end of array
arrayOFInt.append(7)

var collection:[Any] = [1, "a", false, 100]

//10/19/2023 notes
//Set -  is unordered collection of unique elements
//doesn't allow dulicate elements

var fruitsCollection:Set<String> = ["Apple", "Bannana"]
fruitsCollection.insert("Poison")
print(fruitsCollection)
fruitsCollection.remove("Poison")
if(!fruitsCollection.contains("Posion")){
    print("no posion")
}

if fruitsCollection.contains("Apple"){
    print("Apple is present")
}

var numbers:Set<Int> = [1,2,3,4]
var emptySet = Set<String>()
emptySet.insert("a")


//Dictionary - its a collection of Key pairs, key needs to be unique

var scores: [String:Int] = ["adam":1, "bob":2]
print(scores)
scores["adam"] = 14
print(scores)
//removing value for key
scores["bob"] = nil

var someNam:String? = "Kaisa"
var n1:Double?

//OPTIONAL - there can be or cannot be a value for that varible
print(someNam)

//unwrapping optionals - Optional binding(getting the value of optional binding)
/*
 1. if let
 2.guard let
 3.?? collecting orperator
 4! Force unwrap

if true{
    
}
else if(1<32){
    
}else{
    
}

if let newName = someNam{
    print("Unwrapped value", newName)
}
func checkingGuardLetUse(){
    guard let newValue = someNam else{
        return
    }
    print(newValue)
}
checkingGuardLetUse()
//3. ?? collection operator
print(someNam ?? "Defualt value")
//4. force unwrap
print(someNam!)
 */
class Empolyee{
    private var name:String
    private var empID:Int
    var sal:Int?
    //default intilizer/ construtor
    init(name: String, empID: Int, sal: Int?) {
        self.name = name
        self.empID = empID
        self.sal = sal
        
    }
    init(name: String, empID: Int) {
        self.name = name
        self.empID = empID
    }
    func walking() -> Void{
        print("\(name) Enployee is walking")
    }
    func getEmpID()-> Int{
        return self.empID
    }
    func getEmpName()-> String{
        return self.name
    }
    func changeSalOfEmployee(newSal:Int?){
        self.sal = newSal
 }
}
let emp1 = Empolyee(name: "ObjC", empID: 2000, sal:20)
print(emp1.getEmpID())
print(emp1.getEmpName())
emp1.walking()

class ITEmployee:Empolyee{
    var techName:String
    
    init(techName: String, name:String, id:Int) {
        self.techName = techName
        super.init(name:name, empID:id)
    }
    
}
 
//struct

struct Empolyee2{
    var name:String
    var empID:Int
    var sal:Int
    
    func walking() -> Void{
        print("\(name) Enployee is walking")
    }
    func getEmpID()-> Int{
        return self.empID
    }
    func getEmpName()-> String{
        return self.name
    }
    func getEmpSal()-> Int{
        return self.sal
    }
    //mutating key word to make somthing mutable in struct
    mutating func changeSalOfEmployee(newSal:Int){
        self.sal = newSal
    }
}
var s1 = Empolyee2(name:"hello", empID: 2324, sal: 2000)
var s2 = Empolyee2(name:"hello2", empID: 4567, sal: 200020)
print(s1)
s1.changeSalOfEmployee(newSal: 2009)
print(s1.getEmpSal())
s1 = s2
print(s2)
s1.walking()

//classes gets stored on heap memory
//struct get stored in stack memory
*/
/*
//1. if else
var isCorrect = true
if isCorrect{
    print("this is a correct statement")
}
else{
    print("this is a false statement")
}
var num:Int = 10
if num > 10 {
    print("the number is greater than 10")
}
else if num < 10{
    print("this number is not greater than 10")
}
else{
    print("this doesn't fit anything condition")
}


func numberChocies{
    guard number else{
        print("doesn't have a value")
        return
    }
    print(" number \(number)")
}

//for loop
let numberArray = [1,2,3,4,5]
for value in numberArray{
    print(value)
}
let numberArray = [1,2,3,4,5]
for(index,element) in numberArray.enumerated(){
    print("index = \(index), value = \(element)")
}
//for loops with statment of time it runs
for i in 0..<10{
    print(i)
}
let dictionary = ["a":1, "b":2, "c":3]

for value in dictionary{
    print(value)
}
for (key,val) in dictionary{
    print("key = \(key), value = \(val)")
}
for i in stride(from: 1, to:20, by: 3){
    print (i)
}
//while // this will not excute at all if it doesn't see the condtion
var num = 5
while num < 10{
    print(num)
    num += 1
}

//repeat while //this will excute the value atleast once
var num = 10
repeat{
    print(num)
    num += 1
}while num <= 20
 
//1 default initilizers
class Person{
    var name: String = "SwiftUI"
    var age: Int = 4
}
let p1 = Person()
//2. MemberWise Initilzer// create defualt inilazer only in struct
struct EmployeeStruct{
    var nameE: String
    var ageE: Int
}
let e1 = EmployeeStruct(nameE: "Tonys", ageE:29)

class EmployeeClass{
    var empName: String
    var empAge: Int
    
    init(empName: String, empAge: Int){
        self.empName = empName
        self.empAge = empAge
    }
}
//4. failable Initizler

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
//required in
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
 */
//Enums

// Enums- Group of  related data types can have func and propertys
/*
enum days:Int{
    case day1 = 200 // will incriment by 1 other than that it will go with zero
    case day2
    case day3
    case day100
 }
 print(Days.day1.rawValue)
enum WeekDays:CaseIterable{
    case monday
    case tuesday
    case wedenday
    case thru
    case fri
    case sat
    case sun
 
    func dayType()->String{
        switch self{
        case .sun, .sat:
            return "Weekend"
        default
            reutrn "Weekdays"
 }
    var numberOfDays:Int ={
        return 7
}
print(WeekDays.friday.dayType())
print(WeedDays.sat.numberOfDays)
 
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

func getCartoonTp(range: TypeGenus){
    switch range{
    case .Comedy(Genus:Int, let Genus):
        if Genus < 1 {
            print("comedy")
        }
    case .Drama(Genus:Int, let Genus):
        if Genus > 1 {
            print("Drama")
        }
    case .romance(GenusString:String let GenusString):
        print("Romance")
    default:
        print("default")
    }
}
getCartoonTp(range: Genus.Comedy(Genus: 0))

enum NetworkError{
    case ResposeError(_code:Int)
    case PrsingError
    case DataNotFoundError
}
 */
// protocals - Interface
/*
 protocols- list of rules or blueprint which  class or structs or anyone who adopts/comfirms it,needs to give implemation for functions

protocol Drive{
    //defualt func for protocol
    func acclerate(speed:Int)
    func applyBreaks()
    func stearing(direction:String)
    
    //Properties does not own memory
   // var numberOFGearss:Int {get set}// this need the get set to beable to implement
    
}
//extension Drive{this is use to make some func optional for when you use the interface
    
//}
struct Car:Drive{
    var numberOFGearss: Int
    
    func acclerate(speed: Int) {
        print("acclerating by \(speed)")
    }
    
    func applyBreaks() {
        print("Applying Breaks")
    }
    //optional Methed
    
    func stearing(direction: String) {
        print("stearing the Car in \(direction)")
    }
    mutating func updateingGears(gears: Int){
        self.numberOFGearss = gears
    }
    
    var numberOfWheels:Int
}
let c1 = Car(numberOFGearss: 6, numberOfWheels: 4)
c1.acclerate(speed: 10)
c1.stearing(direction: "North")
c1.applyBreaks()
//all inteface has to have all the function initilied to beable to use
struct Truck:Drive{
    var numberOFGearss: Int
    func acclerate(speed: Int) {
        print("acclerating by \(speed)")
    }
    
    func applyBreaks() {
        print("Applying Breaks")
    }
    
    func stearing(direction: String) {
        print("stearing the Car in \(direction)")
    }
    
}

enum DriveDirection:Drive{

    
    case left, right, up, down
    
    func acclerate(speed: Int) {
        print("acclerating by \(speed)")
    }
    
    func applyBreaks() {
        print("Applying Breaks")
    }
    
    func stearing(direction: String) {
        print("stearing the Car in \(direction)")
    }
}


//Extension - will allow us to add more meaning/ fuctionality to exist type or for protocol confimace
// can be use for adding func to already exixting classes or structs
extension Int{
    func square() ->Int{
        return self * self
    }
    //for instance print for squaring numbers
    func squarePrint(){
       var results = self * self
        print(results)
    }
}
let i1:Int = 5
i1.square()
print(i1)
i1.squarePrint()

//extension String{
  //  func myOwnPrint()
//}
class Temperture{
    var celcius:Double = 0
    
    func setTempreture(givenTemp: Double){
        self.celcius = givenTemp
    }
    
    
}

extension Temperture{
    func convertToF(){
        var f = celcius * 1.8 + 31
        print(f)
    }
}
let t1 = Temperture()
t1.setTempreture(givenTemp: 40)
t1.convertToF()



//Type of Properties in IOS

class Circle{
    init(radius: Double) {
        self.radius = radius
    }
    var radius:Double = 100 // stored properties
    
    var area:Double{// computed Property
        return Double.pi * radius * radius //pi*r^2
    }
    lazy var circumfernce:Double = {
        print("Lazy property")
        return 2 * Double.pi * radius
    }()
}
 

//Genrnic

func doSumOfTwoNums(n1:Int , n2:Int){
    let res = n1 + n2
    print("Int res = \(res)")
}
func doSumOfDoubleTwoNums(n1:Double , n2:Double){
    let res = n1 + n2
    print("Double res = \(res)")
}
 
doSumOfTwoNums(n1: 1, n2: 1)
doSumOfDoubleTwoNums(n1: 1039.1, n2: 1)
//this way to get around type safety and it will read both kind of data types
func doSumOfTwoNumsGenric<N:Numeric>(n1:N, n2:N) ->N{
    let res = n1 + n2
    print(" Generic res = \(res)")
    return res
}
doSumOfTwoNumsGenric(n1: 1.2, n2: 1.3)



// creating for generic data
class Information<N>{
    var data:N
    
    init(data: N) {
        self.data = data
    }
    func displayTheData(){
        print("Data is = \(self.data)")
    }
}

let i1 = Information(data:"s")
i1.displayTheData()
 
struct MyQueue<T>{//first in first out
    var myqueue:[T]
    mutating func addElement(element:T){
        myqueue.append(element)
    }
    mutating func popElement(){
        myqueue.removeFirst()
    }
}

var numberQueue = MyQueue(myqueue: [])
numberQueue.addElement(element: "A")
numberQueue.addElement(element: 2)
print(numberQueue.myqueue)
numberQueue.popElement()
print(numberQueue.myqueue)


//closure - unamed block of code that can pass around and us in acn can return from a function also
//Closure are referne types like classess
//they caputre and store the reference to any constants and variable surrouding context

func addTwoNumber(n1:Int)->Int{
    return n1 * n1
}
let res = addTwoNumber(n1: 2)
let sayHello = {
    print("Hello Swift")
}
sayHello()
print(res)
let simpleClosuere:(()->())// unname simeple closeure
func doSquare(n1:Int, completion:(Int)->()){//trailing closure
    let result = n1 * n1
    completion(result)// this is need to finsh any closure
}//{} this is a way to put in a func or sometime without the key func
doSquare(n1: 5, completion: {output in print("doSquare -\(output)")})

//non-escaping Closure

//escapaing closure
func performApiCallTask(completion: @escaping ()->()){
    print("1.We are inside performApiCallTask func")
    
    DispatchQueue.global().async {
        print("2.We are inside global Queue")
        Thread.sleep(forTimeInterval: 4)
        DispatchQueue.main.async {
        print("3.We are inside DispactchQuene.main")
        print("4.After 4 secs delay")       }
        print("5. After dispatchQuenue main")
    }
}
performApiCallTask {
    print("once we get response preformApiCallTask")
}
//3.trailing Closure-whenever there is a closure which is last paratmer for a func then it will be call as trailing closure
func doSomeTask(Name:String, age:Int, onSuccess:(String)->Void, isValid:Bool){
    let bioData = "Name of Person is \(Name) and age is \(age)"
    onSuccess(bioData)
}
doSomeTask(Name: "Tony", age: 29) { Output in print(Output)
}, isValid:true
 
//4.auto Closure when a closure doesn't take any parameter not it returns anything from closure then it get self wraped when called is known as Auto Closure
func travelToDestination(action: ()->()){
    action()
}
travelToDestination {

}

//HigerOrder of functions
//1.Map it takes a collection and applies a function to each element
//MARK: MAP
let numberArray = [1,2,3,4,5,6,7]
var res = [Int]()
for num in numberArray{
    res.append(num*num)
}
print(res)

let sqaure = numberArray.map{$0 * $0}
print("squares- \(sqaure)")

//MARK: Filter
 
//Fliter take a collection applies a func and return a
let evenNumber = numberArray.filter{ $0 % 2 == 0}//<- this is a shorter way to create a func
print("Even Number-- \(evenNumber)")

//MARK: Reduce performs a task and return one value
let sum = numberArray.reduce(30, -)
print(sum)
//MARK: sort
let unsorted = [8,2,42,21,3,1,21, 4,2]
print(unsorted.sorted())

//MARK: FlapMap
let someWords = ["Hello", "B"]
let resu = someWords.flatMap{$0}//
print(resu)

print(duplicationNilArray)
//MARK: CompatMap
let duplicationNilArray = [123, 12334, nil, 0,0,1,3,5]
duplicationNilArray.compactMap{$0}
let arrays = [[123,555],nil,[0,0,1,4],nil,[6,555]]
print(arrays.compactMap{$0})

//MARK forEach
numberArray.forEach{print($0)}
//MARK Zip - combine two arrays
let num2 = ["a", "b", "c"]
let pairs = zip(num2,numberArray)
print(pairs)
 
//Error Handling
enum LoginError: Error{//Error is a protocal
    case accessDenied
    case dataNotFound
    case biometricAuthecationFailed
    case unknown
}

func doLogin(email:String, password:String, staticCode:Int) throws->Bool{//for error handling throws
    //assoscited data
    print("Doing login")//call api
    switch staticCode{
    case 200://meaning true
        print("login sucessful")
        return true
    case 300...309:
        throw LoginError.accessDenied
    case 400...409:
        throw LoginError.dataNotFound
    default:
        throw LoginError.unknown
    }
}
extension LoginError:LocalizedError{
    var errorDescription: String?{
        switch self{
        case .accessDenied:
            return NSLocalizedString("Login Failed, access denied", comment: "access denied")//NSlocalizedString is used to changed automacticaly to another langauge if another country wants to use the code
        case .dataNotFound:
            return NSLocalizedString("Server Data not found", comment: "data not found")
        case .biometricAuthecationFailed:
            return NSLocalizedString("biometric Failed, access denied", comment: "bio")
        case .unknown:
            return NSLocalizedString("Unknown Login Failed, access denied", comment: "access denied")
        }
    }
}
//do..try..catch
try doLogin(email: "email", password: "12323", staticCode: 200)
//try doLogin(email: "email", password: "12323", staticCode: 301)// will crash without a do catch
do{
    try doLogin(email: "email", password: "12323", staticCode: 404)
}catch let error{
    print("error: \(error.localizedDescription)")
}

//2 try? make it optional with nil only works in safe case
//try? doLogin(email: "email", password: "12323", staticCode: 200)

//3 try! do not forced unwrapped only works in safe case
//try! doLogin(email: "email", password: "12323", staticCode: 404)

//Access Specifiers
/*
 1.Internal - (Default) Anything which is defined in same moudle is accessable as along as it is in the same file
 2.Private- most restrictive one, only accessable by the define class or struct
 3.FilePrivate only allow to access if in the same file
 4.Public let have access you anywhere in the files or class or modules
 5.Open it similar like public but you can subclass here
 */
public class Movie{
    
}
 */
/*
 1.construct injection
 2.property injection
 3.method injection
 */

//memory managemnet
/*
 ARC- Automatic Reference Counting(garabage collection in Java)
 work ub ObjC and Swift
 -It keeps a track of reference to objects and release them when they are not needed
 weak var class make so that it break the cycle. doesn't increase refenece count
 Strong var class make it so it is the diform strong
 unowner similar to weak but the daata has to have a or the app will crash


class Person{
    var name:String?
    var age:Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        print("init")
    }
    deinit{
        self.name = nil
       print("deinit")
        
    }
}
//refernece count= zero before object is created
var person:Person? = Person(name: "Tony", age: 29)
var person2:Person? = person
//refernce count = 1 after object is created
//person = nil
//refeence count = -1 WHEN Object is deleted

 */
//Concurrany/ multitheading
/*
 1.GCD - Grand Central dispatch
 2.Operation and Operation Queues
 3.SwiftConcurreny - Await  Asyc
 4.Actor
 5.ThirdParty Framework- Combine,RXSwift, PromiseKit
 6.thread-(NSThread-) NameSpace -lowest level of api for threading/ multitasking
 7.Semaphoner
 */
//1.GCD- Grand Central Dispatch
//-Quenue BAsed Api that will allow us to execte tasks in FIFO order
// GCD is build on top of threads
/*
 3 typw of Queue
 1.main Queue - main thread - anything realted UI should be done
 2.Serial Qunue/ Custom Queue
 3.Global Queue


//Main Queue- Main thread
func Dotask(){
    print(Thread.isMainThread)
    DispatchQueue.main.async {
        print("Main thread")
        print(Thread.isMainThread)
    }
    print(Thread.isMainThread)
}
Dotask()
 
//2.serial Quenue
let queue = DispatchQueue(label: "my custom queue")
queue.async {
    print("Serial Queue/ Customer Queue")
}
queue.async {
    print("a task")
}
queue.async {
    print("b task")
}
queue.async {
    print("c task")
}


//b.concurrent queue
let concurrentQuenue = DispatchQueue(label: "concurrentQuenue", attributes: .concurrent)
concurrentQuenue.async {
    print("a task")
    for i in 1...100{
        print(i)
    }
}
concurrentQuenue.async {
    print("b task")
}
 */// using async and sync to mix the sqeunece and concurrent only one you can use mix
//global Quenue- this are systme provided queues and always concurrent
//Priority of this queuses is decided by factor called as QOS- Quality of Service
/*
DispatchQueue.global().async {
    print("globlal Quenue")
}//1.
DispatchQueue.global(qos: .userInteractive).async {
    print("userInteractice")// animation work, event handling or updating your appanything related to UI
}
DispatchQueue.global(qos: .userInitiated).async {
    print("userInitiated")// any work which user has started
    //user requires immedite results--> pull to refrsh
}//3.Utility
DispatchQueue.global(qos: .utility).async {
    print("Utlity")
    //any long running task which user is aware and those task are not that much proiorty
    //downloading songs, statemnets , movies
}
//4.
DispatchQueue.global(qos: .background).async {
    print("background")
    //this are task which user is not at all aware as well run in background
}
DispatchQueue.global(qos: .default).async{
    print("Default")
    //this falls in between userInited and utility
}
DispatchQueue.global(qos: .unspecified).async {
    print("unspecified")
    //this is the least proietey
}
//Operation Queues - were bulid on top of GCD
//it give more control to user
//pause, resume, stop, start task
//add or define dependacies with your task

let taskLettuce = BlockOperation{
    print("Adding Letture to Salad")
}
let taskTomato = BlockOperation{
    print("Adding Tomato to Salad")
}
let taskBacon = BlockOperation{
    print("Adding Bacon to Salad")
}
let operationQueue = OperationQueue()
taskLettuce.addDependency(taskTomato)
taskTomato.addDependency(taskBacon) //make puting bacon before tomato
operationQueue.addOperations([taskBacon,taskTomato,taskLettuce], waitUntilFinished: false)
operationQueue.maxConcurrentOperationCount = 1
operationQueue.cancelAllOperations()
operationQueue.isSuspended
operationQueue.name = "Salad BLT Queue"

func doAPIcall() async{
    
}
func task1() async-> Int{
    print("Task 1")
    for _ in 0...100{
        
    }
    return 1
}
func task2(param:Int) async{
    print("Task 2")
}
Task{
    let output = await task1()
    print("\(output)")
    await task2(param:output)
}
 
//if version < 13{
//
//}else{
//}
//Actors- iOS 13, 2019, swift 5.5
//class properties, function,initlizer, deinitilizer, reference type
//struct - properties, function, initilizers, deinitlizers, value types
//Actor dont support inheritance but are still a refernec types\
// actor will gurantee that its propertys and variable are modified one at a time
//are thread safe from deadlock
actor BankDetails{
    var balance:Double = 0.0
    
    init(balance: Double) {
        self.balance = balance
    }
    func deposit(amt:Double){
        self.balance = balance + amt
        print(balance)
    }
    func withdrew(amt:Double){
        self.balance = balance - amt
        print(balance)
    }
}
let bankDetails = BankDetails(balance: 10)
Task{// need to use wait when using actor
    await bankDetails.deposit(amt: 100)
    await bankDetails.withdrew(amt: 41)
}
 */

