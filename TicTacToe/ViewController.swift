//
//  ViewController.swift
//  TicTacToe
//
//  Created by Peter Hitchcock on 10/2/14.
//  Copyright (c) 2014 Peter Hitchcock. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Variables
    var startNumber = 1
    var winner = 0
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    //IBOutlets
    @IBOutlet weak var gameButton0: UIButton!
    @IBOutlet weak var winnerLabel: UILabel!

    //IBActions
    @IBAction func onButtonPressed(sender: AnyObject) {

        if (gameState[sender.tag] == 0) {

            var changeImage = UIImage()

            if (startNumber % 2 == 0) {

                changeImage = UIImage(named: "x.png")
                gameState[sender.tag] = 2
                println("\(gameState)")

            } else {

                changeImage = UIImage(named: "o.png")
                gameState[sender.tag] = 1
                println("\(gameState)")

            }

            for combo in winningCombinations {
                if (gameState[combo[0]] == gameState[combo[1]] && gameState[combo[1]] == gameState[combo[2]] && gameState[combo[0]] != 0) {

                    winner = gameState[combo[0]]

                }
            }

            if (winner != 0) {

                if (winner == 1) {

                    winnerLabel.text = "zeros winner winner chicken dinner"
                    println("\(winner)")

                } else {

                    winnerLabel.text = "x's winner winner chicken dinner"
                    println("\(winner)")
                }

            }

            startNumber++

            sender.setImage(changeImage, forState: .Normal)
        }

    }

    @IBAction func playAgainButton(sender: AnyObject) {

        startNumber = 1
        winner = 0
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]

        var button : UIButton

        for var i = 0; i < 9; i++ {

            button = view.viewWithTag(i) as UIButton
            button.setImage(nil, forState: .Normal)

        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}

