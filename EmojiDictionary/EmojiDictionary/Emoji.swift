//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Erin Vincent on 6/24/19.
//  Copyright © 2019 Erin Vincent. All rights reserved.
//

import Foundation

class Emoji : Codable {
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
    
    static let sampleEmojis: [Emoji] = [
        Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
        Emoji(symbol: "👮", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority"),
        Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),
        Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
        Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
        Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
        Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
        Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
        Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
        Emoji(symbol: "💤", name: "Snore", description:"Three blue \'z\'s.", usage: "tired, sleepiness"),
        Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion")]
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let archiveURL = documentsDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
    
    static func saveToFile(emojis: [Emoji]) {
        print("saving")
        let plistEncoder = PropertyListEncoder()
        let encodedEmojis = try? plistEncoder.encode(emojis)
        try? encodedEmojis?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile () -> [Emoji]? {
        guard let retrievedEmojis = try? Data(contentsOf: archiveURL) as Data? else {return nil}
        let plistDecoder = PropertyListDecoder()
        return try? plistDecoder.decode(Array<Emoji>.self, from: retrievedEmojis)
    }
    
    static func loadSampleEmojis() -> [Emoji] {
        return sampleEmojis
    }
}
