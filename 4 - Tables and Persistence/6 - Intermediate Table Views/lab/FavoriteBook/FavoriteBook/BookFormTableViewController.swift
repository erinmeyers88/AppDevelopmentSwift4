//
//  BookFormTableViewController.swift
//  FavoriteBooks
//
//  Created by Erin Vincent on 6/27/19.
//

import UIKit

class BookFormTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    struct PropertyKeys {
        static let unwind = "UnwindToBookTable"
    }
    
    var book: Book?

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var lengthTextField: UITextField!
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        print("save button pressed")
        guard let title = titleTextField.text,
            let author = authorTextField.text,
            let genre = genreTextField.text,
            let length = lengthTextField.text else {return}
        
        book = Book(title: title, author: author, genre: genre, length: length)
        performSegue(withIdentifier: PropertyKeys.unwind, sender: self)
    }
    
    func updateView() {
        guard let book = book else {return}
        
        titleTextField.text = book.title
        authorTextField.text = book.author
        genreTextField.text = book.genre
        lengthTextField.text = book.length
    }
}
