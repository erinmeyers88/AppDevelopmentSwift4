//
//  FoodTableViewController.swift
//  MealTracker
//
//  Created by Erin Vincent on 6/24/19.
//  Copyright © 2019 Erin Vincent. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    var meals: [Meal] = [Meal(name: "Breakfast", food: [Food(name: "Cereal", description: "Life & Milk"), Food(name: "Toast", description: "Wheat bread, butter & jam"), Food(name: "Yogurt", description: "Strawberry with granola")]), Meal(name: "Lunch", food: [Food(name: "Sandwich", description: "Ham on French bread with dijon mustard"), Food(name: "Cobb Salad", description: "Romaine, hard-boiled egg, chicken, ranch"), Food(name: "Pho", description: "Rice noodles and beef")]), Meal(name: "Dinner", food:[Food(name: "Pizza", description: "Thin crust with mozarella, pepperoni, olives, green peppers"), Food(name: "Mac & Cheese", description: "Shells with gouda and cheddar"), Food(name: "Enchiladas", description: "Sweet pork, green chiles, corn tortilla and jack cheese")])]

    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals[section].food.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)

        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]
        
        cell.textLabel?.text = food.name
        cell.detailTextLabel?.text = food.description

        return cell
    }
 
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }

}
