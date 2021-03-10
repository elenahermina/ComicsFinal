//
//  UserDefaultsPreferences.swift
//  ComicsFinal
//
//  Created by elena hermina barbullushi on 06.03.21.
//

import Foundation

class UserDefaultsPreferences {
    
    private let keyItsFirstTime = "ITS_FIRST_TIME"
    
    
    func setFirstTime() {
        UserDefaults.standard.set(true, forKey: keyItsFirstTime)
    }
    
    func isfirstTime() -> Bool {
        if UserDefaults.standard.bool(forKey: keyItsFirstTime) {return false} else {return true}
    }
    
}

