//
//  card.swift
//  Concentrate---sam
//
//  Created by Senthil Masilamani on 7/15/18.
//  Copyright © 2018 Inobus. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = 0
    }
}
