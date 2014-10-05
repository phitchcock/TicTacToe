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
    var timer = NSTimer()
    var counter = 0
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var changeImage = UIImage()
    var selectImage = UIImage()

    //IBOutlets
    @IBOutlet weak var gameButton0: UIButton!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var selectionButton: UIButton!

    //IBActions
    @IBAction func onButtonPressed(sender: AnyObject) {

        self.gameLogic(sender)

    }

    @IBAction func playAgainButton(sender: AnyObject) {

        startNumber = 1
        winner = 0
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        clearCounterPressed(sender)
        winnerLabel.text = "Player O Turn"
        playAgain.alpha = 0.01

        var button : UIButton

        for var i = 0; i < 9; i++ {

            button = view.viewWithTag(i) as UIButton
            button.setImage(nil, forState: .Normal)
        }
    }

    @IBAction func onDrag(panGesture: UIPanGestureRecognizer) {
        var point: CGPoint = panGesture.locationInView(self.view)

        selectionButton.center = point
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        selectImage = UIImage(named: "o.png")
        winnerLabel.text = "Player O Turn"
        timerLabel.text = String(counter)
        selectionButton.setImage(selectImage, forState: .Normal)
        //selectionButton

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidAppear(animated: Bool) {
        playAgain.alpha = 0
    }

    func gameLogic(sender: AnyObject) {
        if (gameState[sender.tag] == 0 && winner == 0) {

            if (startNumber % 2 == 0) {

                changeImage = UIImage(named: "x.png")
                selectImage = UIImage(named: "o.png")
                gameState[sender.tag] = 2
                self.startTimer(sender)
                navigationItem.title = "Player O Turn"
                selectionButton.setImage(selectImage, forState: .Normal)



            } else {

                changeImage = UIImage(named: "o.png")
                selectImage = UIImage(named: "x.png")
                gameState[sender.tag] = 1
                self.startTimer(sender)
                navigationItem.title = "Player X Turn"
                selectionButton.setImage(selectImage, forState: .Normal)
            }

            for combo in winningCombinations {
                if (gameState[combo[0]] == gameState[combo[1]] && gameState[combo[1]] == gameState[combo[2]] && gameState[combo[0]] != 0) {


                    winner = gameState[combo[0]]

                    println(String(winner))

                }
            }

            if (winner != 0) {
                if (winner == 1) {
                    winnerLabel.text = "zeros winner winner chicken dinner"
                    //self.stopCounterPressed(sender)

                }
                else if (winner == 2) {
                    winnerLabel.text = "x's winner winner chicken dinner"
                    //self.stopCounterPressed(sender)

                }
                /*
                else {

                    var alert = UIAlertController(title: "Start Over", message: "No Player won!", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Yep!", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)

                    self.clearCounterPressed(sender)

                }
*/

                UIView.animateWithDuration(0.4, animations: {
                    self.playAgain.alpha = 1
                })
            }
            startNumber++
            sender.setImage(changeImage, forState: .Normal)
        }
    }

    //Timer functions
    @IBAction func startTimer(sender: AnyObject) {
        timer.invalidate()
        counter = 0
        timerLabel.text = String(counter)
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    }

    func update() {
        timerLabel.text = String(counter++)
    }

    @IBAction func stopCounterPressed(sender: AnyObject) {
        timer.invalidate()

    }

    @IBAction func clearCounterPressed(sender: AnyObject) {
        timer.invalidate()
        counter = 0
        timerLabel.text = String(counter)
    }

    func turnOverPlay(sender: AnyObject) {

        if (timerLabel.text?.toInt() > 2) {
            println("timer")
            timer.invalidate()
            counter = 0
            timerLabel.text = String(counter)

            var alert = UIAlertController(title: "FAIL", message: "You ran out of time!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "BOOM!", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)

        } else {
            self.startTimer(sender)
        }
    }
}

