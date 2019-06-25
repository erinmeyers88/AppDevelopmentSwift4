//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Erin Vincent on 6/24/19.
//  Copyright © 2019 Erin Vincent. All rights reserved.
//

import Foundation

class Emoji {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    init(symbol: String, name: String, description: String,
         usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}
