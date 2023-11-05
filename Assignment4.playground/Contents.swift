import UIKit

// protocals - Interface

 //protocols- list of rules or blueprint which  class or structs or anyone who adopts/comfirms it,needs to give implemation for functions

protocol Drive{
    //defualt func for protocol
    func acclerate(speed:Int)
    func applyBreaks()
    func stearing(direction:String)
    
    //Properties does not own memory
    //we can't store data in protocol
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
    // all implemencation in the protocol needs to be place in all sub classes and struct
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
// enums usable
enum DriveDirection:Drive{

    //switch case for the directional
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
// exampe of us for extension for a created class
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
    lazy var circumfernce:Double = {// lazy property needs both a = and () in it to function
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
//this way to get around type safety and it will read both kind of data types. this use of generic is a way so that if the data type that it take in is of certin types it will beable to function
func doSumOfTwoNumsGenric<N:Numeric>(n1:N, n2:N){
    let res = n1 + n2
    print(" Generic res = \(res)")
}
doSumOfTwoNumsGenric(n1: 1, n2: 1.3)
