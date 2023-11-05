import UIKit

var greeting = "Hello, playground"

//DispatchGroups
func getDataFromAPI(url: URL, completionHandler: @escaping (Result<Data, Error>) -> Void){
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            completionHandler(.failure(error))
            print(error.localizedDescription)
        }

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("Got invalid response")
            return
        }

        guard let rawData = data else{
            print("Couldn't get the data")
            return
        }

        do{
            completionHandler(.success(rawData))
        }catch{
            completionHandler(.failure(error))
            print(error.localizedDescription)
        }
    }
    task.resume()
}

let apiURL1 = URL(string: "https://reqres.in/api/users")!
let apiURL2 = URL(string: "https://reqres.in/api/users")!
let apiURL3 = URL(string: "https://reqres.in/api/users")!

let foodAPIGroup = DispatchGroup()

foodAPIGroup.enter()
getDataFromAPI(url: apiURL1) { result in
    print("URL 1 Done")
    foodAPIGroup.leave()
}

foodAPIGroup.enter()
getDataFromAPI(url: apiURL2) { result in
    print("URL 2 Done")
    foodAPIGroup.leave()
}

foodAPIGroup.enter()
getDataFromAPI(url: apiURL3) { result in
    print("URL 3 Done")
    foodAPIGroup.leave()
}

foodAPIGroup.notify(queue: .main){
    DispatchQueue.main.async{
        print("All api's are done")
    }
}
