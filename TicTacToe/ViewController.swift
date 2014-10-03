//
//  ViewController.swift
//  TicTacToe
//
//  Created by Peter Hitchcock on 10/2/14.
//  Copyright (c) 2014 Peter Hitchcock. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Vars
    var center: CGPoint?
    var playerNames:[String] = []
    var playerOne:String!
    var playerTwo:String!
    var labels:[UILabel] = []




    //IBOutlets
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    @IBOutlet weak var labelSix: UILabel!
    @IBOutlet weak var labelSeven: UILabel!
    @IBOutlet weak var labelEight: UILabel!
    @IBOutlet weak var labelNine: UILabel!
    @IBOutlet weak var whichPlayerLabel: UILabel!
    @IBOutlet weak var playerNameTextField: UITextField!

    //var ticTacLabels = [labelOne, labelTwo, labelThree, labelFour, labelFive, labelSix, labelSeven, labelEight, labelNine]

    //IBActions
    @IBAction func onLabelTapped(tapGesture: UITapGestureRecognizer) {
        var point: CGPoint = tapGesture.locationOfTouch(0.1, inView: self.view)

        self.findLabelUsingPoint(point)
        println("\(point)")

        if (tapGesture.state == UIGestureRecognizerState.Ended) {

            if (playerNames[0] == playerOne) {
                self.findLabelUsingPoint(point).text = "X"
                self.findLabelUsingPoint(point).textColor = UIColor.blueColor()
            }
            else if (playerNames[1] == playerTwo){
                self.findLabelUsingPoint(point).text = "O"
            }
        }

    }
    @IBAction func addPlayerButton(sender: AnyObject) {

        if (playerNames.count == 0) {
            playerOne = playerNameTextField.text
            playerNames.append(playerOne)
            playerNameTextField.text = ""

        }

        else if (playerNames.count == 1) {
            playerTwo = playerNameTextField.text
            playerNames.append(playerTwo)
            playerNameTextField.text = ""

        } else {

            println("we have 2 players")
        }

        println("\(playerNames)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    func startPlayerTurn() {

    }

    func startGame() {

    }

    func findLabelUsingPoint(point: CGPoint) -> UILabel {

        for label in labels {
            if (CGRectContainsPoint(label.frame, point)) {
                return label
            }
        }

        return labelOne
    }


}

