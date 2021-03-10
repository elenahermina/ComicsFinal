//
//  DataProvider.swift
//  ComicsFinal
//
//  Created by elena hermina barbullushi on 06.03.21.
//

import Foundation
import CoreLocation
import UIKit
import Kingfisher

class DataProvider {
    
//    MARK: Properties
    
    private var database: Database? = nil
    private var mUserPreferences: UserDefaultsPreferences? = nil
    private let entityHeroe = "Heroe"
    private let entityVillain = "Villain"
    private let entityBattle = "Battle"
   
    
//    MARK: Lifecicle methods
    
    init() {
        database = Database()
        mUserPreferences = UserDefaultsPreferences()
    }
    
    deinit {
        database = nil
    }

// MARK: User Defaults methods
    
    func isFirstTime() -> Bool {
        guard let answer = mUserPreferences?.isfirstTime() else {return false}
        return answer
    }
    
    func saveFirstTime() {
        mUserPreferences?.setFirstTime()
    }
    
//    MARK: Dataprovider methods
    
//    create methods
    
    func createHeroe() -> Heroe? {
        return database?.createDataHeroe() as? Heroe
    }
    
    func createVillain() -> Villain? {
        return database?.createDataVillain() as? Villain
    }
    
    func createBattle() -> Battle? {
        return database?.createDataBattle() as? Battle
    }
    
//    load methods
    
    func loadAllHeroes() -> [Heroe] {
        guard let pathUrl = Bundle.main.url(forResource: "avengers_data", withExtension: "json") else {
            
            return []
        }
        
        var allHeroes: [Heroe] = []
        do {
            let data  =  try Data(contentsOf: pathUrl)
            allHeroes = try JSONDecoder().decode([HeroDAO].self, from: data).map { heroDAO in
                let hero = Heroe()
                hero.heroeName = heroDAO.name
                hero.heroeBio = heroDAO.biography
                hero.heroePower = Int16(heroDAO.power)
             //   hero.heroeImage = heroDAO.image
                return hero
            }
        } catch {
            print ("Can not find 'avengers_data' resource")
       
        
        }
          
        return allHeroes
    }

    
    func loadAllVillains() -> [Villain] {
        
        // Parse local json file
        
        // Get a url path to the json file
        
    
    
        
      
        guard let data = database?.fecthAllData(entityVillain) as? [Villain] else {
            return []
        }
        
        return data
    }
    
    func loadAllBattlesSortedById() -> [Battle] {
        guard let data = database?.fetchBattlesSortedbyId() as? [Battle] else {
            return []
        }
        return data
    }
    
    func deleteBattleById (id: Int) {
        database?.deleteBattlebyId(battleId: id)
        return
    }
    
//    save methods
    
    func saveChanges() {
        database?.persistAll()
    }
        
}
