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
    
    @IBAction func pic1move(_ sender: UIPanGestureRecognizer) {
        var point = sender.location(in: view)
        pic1.center = CGPoint(x: point.x, y: point.y)
    }
    
 

}
