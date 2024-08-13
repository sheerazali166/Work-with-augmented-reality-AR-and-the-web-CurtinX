//
//  Country.swift
//  CountriesOfTheWorld
//
//  Created by Sheeraz on 8/12/24.
//

import Foundation

class Country {
    
    var flag: String
    var name: String
    var region: String
    var population: String
    
    init(flag: String, name: String, region: String, population: String) {
        self.flag = flag
        self.name = name
        self.region = region
        self.population = population
    }
}
