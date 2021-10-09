//
//  ViewController.swift
//  MVC-Storyboard
//
//  Created by ruslan on 07.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var touchLabel: UILabel!
    
    lazy var game = ConcentrationGame(numberOfPairsOfCards: (buttonCollection.count + 1) / 2)
    
    let emojiCollection = ["🏄‍♀️", "🎭", "🏄‍♀️", "🎭"]
    var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func emojiIdentifier(for card: Card) -> String {
        
        return ""
    }
    
    func updateViewModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : .systemBlue
            }
        }
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateViewModel()
        }
    }
}

