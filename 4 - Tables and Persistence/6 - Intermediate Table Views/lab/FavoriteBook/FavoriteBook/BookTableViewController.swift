
import UIKit

class BookTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let bookCell = "BookCell"
        static let addBookSegue = "AddBook"
        static let editBookSegue = "EditBook"
    }
    
    var books: [Book] = []
    
    var bookArchiveURL: URL {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsURL.appendingPathComponent("books")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.bookCell, for: indexPath)
        
        let book = books[indexPath.row]
        cell.textLabel?.text = book.title
        cell.detailTextLabel?.text = book.description
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    @IBAction func prepareForUnwindToBookList(segue: UIStoryboardSegue) {
        print("segue called")
        guard let source = segue.source as? BookFormTableViewController, let book = source.book else {return}
        if let indexPath = tableView.indexPathForSelectedRow {
            books[indexPath.row] = book
            tableView.reloadRows(at: [indexPath], with: .none)
        } else {
            let newIndexPath = IndexPath(row: books.count, section: 0)
            books.append(book)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bookFormViewController = segue.destination as? BookFormTableViewController else {return}
        
        if let indexPath = tableView.indexPathForSelectedRow,
            segue.identifier == PropertyKeys.editBookSegue {
            bookFormViewController.book = books[indexPath.row]
        }
    }
    
}
