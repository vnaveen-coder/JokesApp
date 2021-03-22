//
//  JokesManager.swift
//  Joke App
//
//  Created by Naveen on 23/03/21.
//

import UIKit

struct JokesManager {
    let JokesURL = "https://api.chucknorris.io/jokes/random?category="
    
    func fetchAPI(category : String) {
        let urlString = "\(JokesURL)=\(category)"
        print(urlString)
    }
}
