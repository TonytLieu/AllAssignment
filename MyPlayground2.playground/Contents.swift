import UIKit
/*
1.Constants
2.Variables
3.functions in swift(different types of functions)
4.Type Inference
5.Type Safety
7.Arrays
8.Tuples and its different types and use
9.Prepare Theoretical part for above topics as well, I will be asking questions on above topics and everyone should be able to ans those.
 */

//constants
let name = "Tony"
let age = 29

//Variables
var lastName = "Lieu"
var job:String = "software tech consulting"
var money:Double = 70000.2
var moneySave:Double = 2000
var results:Double = 0
print(name + " " + lastName)
print(job + " " + String(money))

//function
func doStuff(){
    print("hey you")
}
doStuff()

func doAddBetterStuff(N1:Double, N2:Double)->Double{
    results = N1 + N2
    return results
}
print(doAddBetterStuff(N1: money, N2: moneySave))
//Type Inference

var name2 = "Tony" //String
var age2 = 54 //int
var living = true //boolean
var avg = 65.32 //Double

//Type Safety
//this is an example of type safety because you can't add fish to a number
//var total = 1 + "fish"

//Arrays
var arrayOFString = ["Anna","Betta","Corrt"]
print(arrayOFString)
print(arrayOFString[2])
var arrayOFInt = [1,3,5,7]
// append = added to the end of array
arrayOFInt.append(9)
print(arrayOFInt)

//Turples and collations
var list = ("Tony",1, true)
print(list)
var list2 = ("Tom", 1, false)
print(list2)
 list2 = list
print(list2)
var collection:[Any] = [1, "a", false, 100]
print(collection)
