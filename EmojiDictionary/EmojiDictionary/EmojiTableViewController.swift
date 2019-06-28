//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Erin Vincent on 6/24/19.
//  Copyright © 2019 Erin Vincent. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
      var emojis : [Emoji] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let loadedEmojis = Emoji.loadFromFile() {
            print("loaded")
            emojis = loadedEmojis
        } else {
            print("samples")
            emojis = Emoji.loadSampleEmojis()
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
  
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return emojis.count
        } else {
            return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell
        
        let emoji = emojis[indexPath.row]
        
        cell.update(with: emoji)
        cell.showsReorderControl = true
        
        return cell
    }
    


    
    
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
        
        emojis.remove(at: indexPath.row)
        Emoji.saveToFile(emojis: emojis)
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
        
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
 
    
    
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     let movedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(movedEmoji, at: to.row)
        tableView.reloadData()
     }
 
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditEmoji" {
            let indexPath = tableView.indexPathForSelectedRow!
            let emoji = emojis[indexPath.row]
            let addEditEmojiTableViewController = segue.destination.children[0] as! AddEditEmojiTableViewController
            addEditEmojiTableViewController.emoji = emoji
        }
     }
    
    
    @IBAction func unwindToEmojiTableView(segue: UIStoryboardSegue)
    {
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as!
        AddEditEmojiTableViewController
        
        if let emoji = sourceViewController.emoji {
            if let selectedIndexPath =
                tableView.indexPathForSelectedRow {
                emojis[selectedIndexPath.row] = emoji
                tableView.reloadRows(at: [selectedIndexPath],
                                     with: .none)
            } else {
                let newIndexPath = IndexPath(row: emojis.count,
                                             section: 0)
                emojis.append(emoji)
                tableView.insertRows(at: [newIndexPath],
                                     with: .automatic)
            }
             Emoji.saveToFile(emojis: emojis)
        }
    }
    
    
}
