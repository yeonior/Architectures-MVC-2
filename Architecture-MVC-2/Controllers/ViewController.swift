//
//  ViewController.swift
//  Architecture-MVC-2
//
//  Created by ruslan on 07.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var touchLabel: UILabel!
    
    lazy var game = ConcentrationGame(numberOfPairsOfCards: (buttonCollection.count + 1) / 2)
    var emojiCollection = ["🏠", "🎭", "🩰", "🏄‍♀️", "🎤"]
    var emojiDicitonary = [Int:String]()
    var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func emojiIdentifier(for card: Card) -> String {
        if emojiDicitonary[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDicitonary[card.identifier] = emojiCollection.remove(at: randomIndex)
        }
        
        return emojiDicitonary[card.identifier] ?? ""
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

