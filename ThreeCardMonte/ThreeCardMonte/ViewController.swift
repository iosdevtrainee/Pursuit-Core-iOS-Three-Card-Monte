//
//  ViewController.swift
//  ThreeCardMonte
//
//  Created by Alex Paul on 11/5/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let backOfCard:String = "cardBackRed"
  let kingCard:String = "kingCard"
  let threeCard:String = "threeCard"
  //  let kingCard: UIImage! = UIImage(named:"kingCard")
//  let threeCard: UIImage! = UIImage(named:"threeCard")
//  let backOfCard: UIImage! = UIImage(named:"cardBackRed")
  @IBOutlet weak var firstCard: UIButton!
  @IBOutlet weak var secondCard: UIButton!
  @IBOutlet weak var thirdCard: UIButton!
  @IBOutlet weak var gameStatus: UILabel!
  var cardArray : [UIButton?]!
  
  
//  let cards: [UIImage] = [kingCard,threeCard,backOfCard]
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
//    firstCard.setImage(UIImage.init(named: backOfCard), for: .normal)
//    secondCard.setImage(UIImage(named:bathckOfCard), for: .normal)
//  thirdButton.setImage(UIImage(named: backOfCard), for: .normal)
//    firstCard.imageView.set
    cardArray = [firstCard,secondCard,thirdCard]
    cardArray.map{(card:UIButton?) in
      card?.isHidden = true
      card?.isEnabled = false
    }
  }
  func checkCard(test:UIButton?,randomCard:UIButton){
    if test?.tag == randomCard.tag {
      randomCard.setImage(UIImage(named:kingCard), for: .normal)
      gameStatus.text = "You win!"
      endGame()
      return
    }
    randomCard.setImage(UIImage(named:threeCard), for: .normal)
    test?.setImage(UIImage(named:kingCard), for: .normal)
    gameStatus.text = "You lose!"
    endGame()
    return
  }
  
  @IBAction func filpCard(_ sender: UIButton) {
    switch sender.tag {
    case 0:
      let card = cardArray[sender.tag]
      checkCard(test: card, randomCard: sender)
    case 1:
      let card = cardArray[sender.tag]
      checkCard(test: card, randomCard: sender)
    case 2:
      let card = cardArray[sender.tag]
      checkCard(test: card, randomCard: sender)
    default:
      return
    }
  }

  @IBAction func playGame(_ sender: UIButton) {
    cardArray.map {(card:UIButton?) in
      card?.isEnabled = true
      card?.isHidden = false
      card?.setImage(UIImage(named: backOfCard), for: .normal)
    }
    cardArray = cardArray.shuffled()
  }
  func endGame(){
    cardArray.map {$0?.isEnabled = false}
  }
  
  }
