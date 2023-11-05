import UIKit

var greeting = "Hello, playground"
let concurrentQuenue = DispatchQueue(label: "concurrentQuenue", attributes: .concurrent)
concurrentQuenue.sync {//sync makes it so that the concurrent run as a serial Quenue so meaning it make sure that a task is run first before starting b and c
    print("a task")
    for _ in 1...100{
    }
}
concurrentQuenue.async {
    print("concurrent b task")
}
concurrentQuenue.async {
    print("concurrent c task")
}
//Operation Queues - were bulid on top of GCD
//it give more control to user
//pause, resume, stop, start task
//add or define dependacies with your task

let taskLettuce = BlockOperation{
    print("Adding Letture to BLT")
}
let taskTomato = BlockOperation{
    print("Adding Tomato to BLT")
}
let taskBacon = BlockOperation{
    print("Adding Bacon to BLT")
}
let operationQueue = OperationQueue()
taskLettuce.addDependency(taskTomato)// make putting tomato before the lettuce
taskTomato.addDependency(taskBacon) //make puting bacon before tomato
operationQueue.addOperations([taskBacon,taskTomato,taskLettuce], waitUntilFinished: false)
operationQueue.maxConcurrentOperationCount = 1
operationQueue.cancelAllOperations()
operationQueue.isSuspended
operationQueue.name = "BLT Queue"

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
//Actor dont support inheritance but are still a refernec types
// actor will gurantee that its propertys and variable are modified one at a time but cannot inheritence
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
/*shows example of why inheritance doesn't work with actor
actor CBS:BankDetails{
    var bankname:String
    
    init(bankname: String) {
        self.bankname = bankname
    }
}*/
