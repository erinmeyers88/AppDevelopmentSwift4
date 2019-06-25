//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Erin Vincent on 6/20/19.
//

import Foundation

struct Athlete {
    var name: String
    var age: String
    var league: String
    var team: String
    var description: String {
        return "\(name) is \(age) uears old and play for the \(team) in the \(league)."
    }
}
