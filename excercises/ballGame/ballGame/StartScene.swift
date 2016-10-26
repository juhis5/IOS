//
//  StartScene.swift
//  ballGame
//
//  Created by Juho Lahtinen on 26/10/16.
//  Copyright © 2016 Juho Lahtinen. All rights reserved.
//

import Foundation
import SpriteKit

class StartScene : SKScene {
    let title = "Ball Game!!"
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.blue
        
        self.addChild(self.createTitle())
        
    }
    
    func createTitle() -> SKLabelNode {
        let helloNode = SKLabelNode(fontNamed: "Chalkduster")
        helloNode.name = self.title
        helloNode.text = self.title
        helloNode.fontSize = 50
        
        helloNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        return helloNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let helloNode = self.childNode(withName: self.title)
        
        if let hello = helloNode {
            hello.name = "";
            
            let zoom = SKAction.scale(to: 2.0, duration: 0.5)
            let fadeAway = SKAction.fadeOut(withDuration: 0.5)
            let remove = SKAction.removeFromParent()
            
            let paraller = SKAction.group([zoom, fadeAway])
            let sequence = SKAction.sequence([paraller, remove])
            
            hello.run(sequence, completion: {
                let gameScene = GameScene(size: self.size)
                let transition = SKTransition.doorsOpenVertical(withDuration: 0.5)
                self.view?.presentScene(gameScene, transition: transition)
            })
        }
    }
}
