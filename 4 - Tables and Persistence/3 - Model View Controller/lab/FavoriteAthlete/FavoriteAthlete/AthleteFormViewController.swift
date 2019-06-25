//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Erin Vincent on 6/20/19.
//

import UIKit

class AthleteFormViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var leagueTextField: UITextField!
    @IBOutlet weak var teamTextField: UITextField!
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, let age = ageTextField.text, let league = leagueTextField.text, let team = teamTextField.text else {return}
        
        athlete = Athlete(name: name, age: age, league: league, team: team)
        
        performSegue(withIdentifier: "returnToAthleteTable", sender: self)
        
    }
    var athlete: Athlete?
    
    func updateView() {
        if let athlete = athlete {
            nameTextField.text = athlete.name
            ageTextField.text = athlete.age
            leagueTextField.text = athlete.league
            teamTextField.text = athlete.team
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
