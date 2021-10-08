//
//  ConcentrationGame.swift
//  MVC-Storyboard
//
//  Created by ruslan on 08.10.2021.
//

import Foundation

class ConcentrationGame {
    
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
    }
}
