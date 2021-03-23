//
//  JokesManager.swift
//  Joke App
//
//  Created by Naveen on 23/03/21.
//

import UIKit

protocol JokesManagerDelegate {
    func didUpdateJokes(JokesPassed : JokeModel)
}
struct JokesManager {
    
    var delegate : JokesManagerDelegate?
    
    let Category : [String] = ["Animal","Career","Celebrity","Dev","Explicit","Fashion","Food","History","Money","Movie","Music","Political","Religion","Science","Sport","Travel"]
    let JokesURL = "https://api.chucknorris.io/jokes/random?category"
    
    func fetchAPI(category : String) {
        let urlString = "\(JokesURL)=\(category)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString : String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safedata = data {
                    if let JokesData = self.parseJSON(JokesData: safedata){
                        self.delegate?.didUpdateJokes(JokesPassed: JokesData)
                    }
                }
            }
            task.resume()
        }
    }
    func parseJSON(JokesData : Data) -> JokeModel? {
        let decoder = JSONDecoder()
        do{
          let decodedData = try decoder.decode(JokeData.self, from: JokesData)
            let CategoryString = decodedData.value
            let jokes = JokeModel(Name: CategoryString)
            return jokes
        }
        catch{
            print(error)
            return nil
        }
    }
    
    func getCategoryName(CategoryName : String) -> String {
        switch CategoryName {
        case "Animal":
            return "animal"
        case "Career":
            return "career"
        case "Celebrity":
            return "celebrity"
        case "Dev":
            return "dev"
        case "Explicit":
            return "explicit"
        case "Fashion":
            return "fashion"
        case "Food":
            return "food"
        case "History":
            return "history"
        case "Money":
            return "money"
        case "Movie":
            return "movie"
        case "Music":
            return "music"
        case "Political":
            return "political"
        case "Religion":
            return "religion"
        case "Science":
            return "science"
        case "Sport":
            return "sport"
        case "Travel":
            return "travel"
        default:
            return "animal"
        }
    }
}
