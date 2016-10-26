//
//  GameScene.swift
//  ballGame
//
//  Created by Juho Lahtinen on 26/10/16.
//  Copyright © 2016 Juho Lahtinen. All rights reserved.
//

import Foundation
import SpriteKit

class GameScene : SKScene {
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.white
        
        self.addChild(self.createJussi())
        self.addChild(self.createShootButton())
        
        
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = borderBody
        
        
    }
    
    // MARK: create methods
    
    func createJussi() -> SKSpriteNode {
        let jussiSprite = SKSpriteNode(imageNamed: "jussi")
        
        jussiSprite.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        jussiSprite.setScale(0.5)
        
        jussiSprite.physicsBody = SKPhysicsBody(texture: jussiSprite.texture!, size: jussiSprite.size)
        
        jussiSprite.physicsBody!.mass = 0.2
        
        jussiSprite.physicsBody!.restitution = 0.5
        
        jussiSprite.physicsBody!.restitution = 0.5
        
        jussiSprite.physicsBody!.friction = 0.5
        
        jussiSprite.name = "jussi"
        
        return jussiSprite
    }
    
    func createShootButton() -> SKSpriteNode {
        let shootSprite = SKSpriteNode(imageNamed: "shoot")
        shootSprite.position =
            CGPoint(x: self.frame.width - shootSprite.frame.width/2, y: shootSprite.frame.height/2)
        shootSprite.name = "fireButton"
        
        return shootSprite
    }
}
