//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by Erin Vincent on 8/27/19.
//  Copyright © 2019 Caleb Hicks. All rights reserved.
//

import Foundation

struct StoreItem : Codable {
    var trackName: String
    var collectionName: String
    var releaseDate: String
    var artworkUrl30: URL
    
    enum CodingKeys: String, CodingKey {
        case trackName
        case collectionName
        case releaseDate
        case artworkUrl30
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        self.trackName = try valueContainer.decode(String.self, forKey: CodingKeys.trackName)
        self.collectionName = try valueContainer.decode(String.self, forKey: CodingKeys.collectionName)
        self.releaseDate = try valueContainer.decode(String.self, forKey: CodingKeys.collectionName)
        self.artworkUrl30 = try valueContainer.decode(URL.self, forKey: CodingKeys.artworkUrl30)
        
    }
    
}

struct StoreItems : Codable {
    let results : [StoreItem]
}
