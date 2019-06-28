import UIKit

struct Note : Codable {
    let title: String
    let text: String
    let timestamp: Date
}

let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

let archiveURL = documentDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")

let newNote = Note(title: "My note", text: "hello world", timestamp: Date())

let plistEncoder = PropertyListEncoder()
let encodedNote = try? plistEncoder.encode(newNote)
try? encodedNote?.write(to: archiveURL, options: .noFileProtection)

let plistDecoder = PropertyListDecoder()
if let retrievedNoteData = try? Data(contentsOf: archiveURL), let decodedNote = try? plistDecoder.decode(Note.self, from: retrievedNoteData) {
    print(decodedNote)
}
