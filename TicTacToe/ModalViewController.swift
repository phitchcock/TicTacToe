//
//  ModalViewController.swift
//  TicTacToe
//
//  Created by Peter Hitchcock on 10/3/14.
//  Copyright (c) 2014 Peter Hitchcock. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController, UIWebViewDelegate {

    //IBOutlets
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!


    //IBActinos
    @IBAction func dismissModalButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    func loadUrl(urlString: NSString) {
        let url = NSURL(string: urlString)
        let urlRequest = NSURLRequest(URL: url!)
        self.webView.loadRequest(urlRequest)
    }

    func homeScreen() {
        self.loadUrl("http://en.wikipedia.org/wiki/Tic-tac-toe")
    }

    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        
    }

    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
}
