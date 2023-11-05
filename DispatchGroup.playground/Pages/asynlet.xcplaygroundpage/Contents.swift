//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

func getDataFromAPI(url: URL) async -> String{
    print("Data from \(url)")
    return ""
}

let apiURL1 = URL(string: "https://reqres.in/api/users")!
let apiURL2 = URL(string: "https://reqres.in/api/users")!
let apiURL3 = URL(string: "https://reqres.in/api/users")!

async{
    async let data1 = getDataFromAPI(url: apiURL1)
    async let data2 = getDataFromAPI(url: apiURL2)
    async let data3 = getDataFromAPI(url: apiURL3)

    await [data1, data2, data3]
    print("All api done")
}
