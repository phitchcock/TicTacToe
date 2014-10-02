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

    //IBActions
    @IBAction func onLabelTapped(tapGesture: UITapGestureRecognizer) {
        var point: CGPoint = tapGesture.locationOfTouch(0.1, inView: self.view)

        self.findLabelUsingPoint(point)
        println("\(point)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    func findLabelUsingPoint(point: CGPoint) -> UILabel {

        if (CGRectContainsPoint(labelOne.frame, point)) {

            println("labelone")
            return labelOne

        }

        else if (CGRectContainsPoint(labelTwo.frame, point)) {

            println("labeltwo")
            return labelOne
        }

        return labelOne
    }


}

