//
//  ViewController.swift
//  ballGame
//
//  Created by Juho Lahtinen on 26/10/16.
//  Copyright © 2016 Juho Lahtinen. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    var spriteView : SKView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.spriteView = self.view as? SKView
        self.spriteView.showsDrawCount = true
        self.spriteView.showsNodeCount = true
        self.spriteView.showsFPS = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: SKView methods

    override func viewWillAppear(_ animated: Bool) {
        let startScene = StartScene(size: self.spriteView.bounds.size)
        NSLog("Width = \(self.spriteView.bounds.width)")
        NSLog("Height = \(self.spriteView.bounds.height)")
        
        spriteView.presentScene(startScene)
    }
}

