import UIKit

var greeting = "Hello, playground"

struct s{
    var name:String = "tony"
}
var st = s()
var cl = c(peoplename: "tony")
print(st.name.utf8)//print out name
print(cl.peoplename.utf8)

protocol login{
    func loginUserName(name:String)
    func loginPassword(password:String)
}

class c:login{
    func loginUserName(name: String) {
        <#code#>
    }
    
    func loginPassword(password: String) {
        <#code#>
    }
    
    var peoplename:String
    init(peoplename: String) {
        self.peoplename = peoplename
    }
    
}
