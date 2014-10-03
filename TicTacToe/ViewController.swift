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
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]

    //IBOutlets
    @IBOutlet weak var gameButton0: UIButton!

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

            startNumber++

            sender.setImage(changeImage, forState: .Normal)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

