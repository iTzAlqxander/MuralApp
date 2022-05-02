//
//  pictureViewController.swift
//  MuralSwitcharoo
//
//  Created by Alexander Masztak on 4/26/22.
//

import UIKit

class pictureViewController: UIViewController {

    @IBOutlet weak var pic1: UIImageView!
    @IBOutlet weak var pic2: UIImageView!
    @IBOutlet weak var pic3: UIImageView!
    @IBOutlet weak var pic4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //goes off the screen at point.x = 122. Fix
    
    @IBAction func pic1move(_ sender: UIPanGestureRecognizer) {
        var point = sender.location(in: view)
        self.view.bringSubviewToFront(pic1)
        pic1.center = CGPoint(x: point.x, y: 430)
    }
    
    @IBAction func pic2move(_ sender: UIPanGestureRecognizer) {
        var point = sender.location(in: view)
        self.view.bringSubviewToFront(pic2)
        pic2.center = CGPoint(x: point.x, y: 430)
    }
    
    @IBAction func pic3move(_ sender: UIPanGestureRecognizer) {
        var point = sender.location(in: view)
        self.view.bringSubviewToFront(pic3)
        pic3.center = CGPoint(x: point.x, y: 430)
    }
    
    @IBAction func pic4move(_ sender: UIPanGestureRecognizer) {
        var point = sender.location(in: view)
        self.view.bringSubviewToFront(pic4)
        pic4.center = CGPoint(x: point.x, y: 430)
    }
    
}
