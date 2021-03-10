//
//  HeroesRepositoryCoreData.swift
//  ComicsFinal
//
//  Created by elena hermina barbullushi on 09.03.21.
//

import Foundation

struct HeroesRepositoryCoreData: CoreDataRepository, HeroesRepository {
    
    // MARK: CoreDataRepository
    let database: CoreDataDatabase
    var entityName: String { "Heroe" }
    let entityNameKey: String = "name"

    // MARK: AvengersRepository
    func createHeroe() -> Heroe? {
        return database.createData(for: entityName) as? Heroe
    }
    
    func fetchAllHeroes() -> [Heroe] {
        return database.fetchAllData(for: entityName) as? [Heroe] ?? []
    }
    
    func fetchHeroeBy(name: String) -> Heroe? {
        let predicate = NSPredicate(format: "\(entityNameKey) = %@", name)
        let fetchLimit = 1

        return database.fetchDataBy(predicate: predicate, fetchLimit: fetchLimit, for: entityName)?.first as? Heroe
    }
    
    func saveHeroe(_ heroe: Heroe) {
        database.persistAllData()
    }
    
    func saveHeroes(_ heroes: [Heroe]) {
        database.persistAllData()
    }
    
    func deleteHeroe(_ heroe: Heroe) {
        database.delete(data: [heroe])
    }
    
    func deleteAllHeroes(_ heroes: [Heroe]) {
        database.delete(data: heroes)
    }
}

