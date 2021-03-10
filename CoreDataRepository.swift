//
//  CoreDataRepository.swift
//  ComicsFinal
//
//  Created by elena hermina barbullushi on 09.03.21.
//

import Foundation

protocol CoreDataRepository {
    var database: CoreDataDatabase { get }
    var entityName: String { get }
}

