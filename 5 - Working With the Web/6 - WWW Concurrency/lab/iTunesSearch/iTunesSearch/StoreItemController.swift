//
//  StoreItemController.swift
//  iTunesSearch
//
//  Created by Erin Vincent on 8/27/19.
//  Copyright © 2019 Caleb Hicks. All rights reserved.
//

import Foundation

class StoreItemController {
    
    func fetchItems(matching query: [String:String], completion: @escaping ([StoreItem]?) -> Void) {
        let baseUrl = URL(string: "https://itunes.apple.com/search")!
        
        
        let url = baseUrl.withQueries(query)!
        
        let jsonDecoder = JSONDecoder()
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let storeItems = try? jsonDecoder.decode(StoreItems.self, from: data) {
                completion(storeItems.results)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
    
}
