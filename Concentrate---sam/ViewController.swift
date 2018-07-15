//
//  ViewController.swift
//  Concentrate---sam
//
//  Created by Senthil Masilamani on 7/15/18.
//  Copyright © 2018 Inobus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips : \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        print("In touchCard sender is : \(sender)")
        if let cardNumber = cardButtons.index(of: sender) {
            print("In touchCard cardNumber is : \(cardNumber)")
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print ("Chosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[ index ]
            let card = game.cards[ index ]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for:
                    UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎"]
    
    var emoji = [Int:String]()
    
    func emoji(for card:Card) -> String {
        print ("card.identifier \(card.identifier)")
        print ("emoji[card.identifier] \(emoji[card.identifier])")
        if emoji[card.identifier] == nil, emojiChoices.count  > 0 {
            print("emoji[card.identifier] == nil")
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            print("randomIndex = \(randomIndex)")
            print(UInt32(emojiChoices.count))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        else {
            print("emoji[card.identifier] != nil")
        }
        print ("emoji[card.identifier] \(emoji[card.identifier])")
        return emoji[card.identifier] ?? "?"
    }

}

