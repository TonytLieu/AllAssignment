import UIKit
/*
 Memory Managment
 1.ARC - Show how it works
 2. Strong , Weak vs Unowned Refreces
 3. Retain Cycle ,  how to resolve retain cycle
 Concurrency
   GCD
 1.Main thread use
 2.Serial queue
 3.Concurrent Queue
 */
class Person{
    var name:String? //default strong variable
    var age:Int
    weak var chair: Chairs?
  // unowned var DL:Driver //it the same as weak but will alawasys have a value
    init(name: String, age: Int, chair:Chairs) {
        self.name = name
        self.age = age
        self.chair = chair
        print("init")
    }
    //this one show owned
  /*  init(name: String, age: Int, chair:Chairs,DL:Driver) {
        self.name = name
        self.age = age
        self.chair = chair
        self.DL = DL
        print("init")
    }
   */
    deinit{
        self.name = nil
       print("Person deinit")
    }
}
class Chairs{
    var numberChair:String?
    var owned:Bool
    init(numberChair: String, owned: Bool) {
        self.numberChair = numberChair
        self.owned = owned
    }
    deinit{
        self.numberChair = nil
       print(" Chair deinit")
    }
}
class Driver{
    var Dnumber:Int
    init(Dnumber: Int) {
        self.Dnumber = Dnumber
    }
}
//refernece count = zero before object is created
var chairs1:Chairs? = Chairs(numberChair: "1", owned: true)
var DL1:Driver = Driver(Dnumber: 1234)
var person:Person? = Person(name: "Tony", age: 29,chair: chairs1 ?? <#default value#>)//everyone can have a chair but not every chair will have a person
//var person:Person? = Person(name: "Tony", age: 29,chair: chairs1,DL: DL1)//this one is part of the owned example
//refernce count = 1 after object is created
person = nil //this will -1 to the refernce count and put it in the ARC
chairs1 = nil
/*
func Dotask(){
    print("it working")
    DispatchQueue.main.async {
        print("Main thread")
        print("it working")
    }
    print(Thread.isMainThread)
}
Dotask()
*/
//2.serial Quenue
let queue = DispatchQueue(label: "my custom queue")// this show that the quenue wont go to b unless a is finshed
queue.async {
    print("Serial Queue/ Customer Queue")
}
queue.async {
    print("a task started")
    for _ in 1...10000{
    }
    print("a task ended")
}
queue.async {
    print("b task started")
    print("b task ended")
}
queue.async {
    print("c task started")
    print("c task ended")
}
//concurrent


let concurrentQuenue = DispatchQueue(label: "concurrentQuenue", attributes: .concurrent)
concurrentQuenue.async {
    print("Ca task started")
    for _ in 1...10000{//to delay the concurrent Quenue
    }
    print("Ca task ended")
}
concurrentQuenue.async {
    print("Cb task started")
    print("Cb task ended")
}


