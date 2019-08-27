
import UIKit

class StoreItemListTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var filterSegmentedControl: UISegmentedControl!
    var storeItemController = StoreItemController()
    
    // add item controller property
    
    var items = [StoreItem]()
    
    let queryOptions = ["movie", "music", "software", "ebook"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func fetchMatchingItems() {
        
        self.items = []
        self.tableView.reloadData()
        
        let searchTerm = searchBar.text ?? ""
        let mediaType = queryOptions[filterSegmentedControl.selectedSegmentIndex]
        
        if !searchTerm.isEmpty {
            
            let query: [String: String] = [
                "term": searchTerm,
                "media": mediaType,
                "limit": "10",
                "lang": "en_us"
            ]
            
            // set up query dictionary
            
            storeItemController.fetchItems(matching: query, completion: ({ (storeItems) in
                
                
                if let storeItems = storeItems {
                    DispatchQueue.main.async {
                        self.items = storeItems
                        self.tableView.reloadData()
                    }
                } else {
                    print("error")
                }
                
                
            }))
            
            // use the item controller to fetch items
            // if successful, use the main queue to set self.items and reload the table view
            // otherwise, print an error to the console
        }
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.trackName
        cell.detailTextLabel?.text = item.collectionName
        cell.imageView?.image = UIImage(named: "gray")
        
        // set label to the item's name
        // set detail label to the item's subtitle
        // reset the image view to the gray image
        
        updateUI(url: item.artworkUrl30, cell: cell)
        
        // initialize a network task to fetch the item's artwork
        // if successful, use the main queue capture the cell, to initialize a UIImage, and set the cell's image view's image to the 
        // resume the task
    }
    
    func updateUI(url: URL, cell: UITableViewCell) {
        let task = URLSession.shared.dataTask(with: url, completionHandler: {
            (data, response, error) in
            if let data = data,
                let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    cell.imageView?.image = image
                }
            }
        })
        
        task.resume()
    }
    
    
    
    @IBAction func filterOptionUpdated(_ sender: UISegmentedControl) {
        
        fetchMatchingItems()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)

        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension StoreItemListTableViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        fetchMatchingItems()
        searchBar.resignFirstResponder()
    }
}
