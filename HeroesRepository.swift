//
//  HeroesRepository.swift
//  ComicsFinal
//
//  Created by elena hermina barbullushi on 09.03.21.
//

import Foundation

protocol HeroesRepository {
    // MARK: Creates
    func createHeroe() -> Heroe?
    
    // MARK: Fetchs
    func fetchAllHeroes() -> [Heroe]
    func fetchHeroeBy(name: String) -> Heroe?
    
    // MARK: Saves
    func saveHeroe(_ heroe: Heroe)
    func saveHeroes(_ heroes: [Heroe])
    
    // MARK: Deletes
    func deleteHeroe(_ heroe: Heroe)
    func deleteAllHeroes(_ heroes: [Heroe])
}

