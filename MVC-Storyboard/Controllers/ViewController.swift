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
    
    let emojiCollection = ["🏄‍♀️", "🎭", "🏄‍♀️", "🎭"]
    var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func flipButton(emoji: String, button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = .systemBlue
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .white
        }
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            flipButton(emoji: emojiCollection[buttonIndex], button: sender)
        }
    }
}

