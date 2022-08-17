//
//  player.swift
//  prototype
//
//  Created by JOSUEYEON on 2022/05/19.
//

import Foundation
import SpriteKit

class Player: SKSpriteNode, GameSprite, SKPhysicsContactDelegate {
    var initialSize = CGSize(width: 100, height: 100)
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "objects")
    
    let player = SKSpriteNode(imageNamed: "basket")
    
    func updateX(newX: CGFloat){
        player.position = CGPoint(x: newX, y: 100)
    }
    
    func update(){
    }

    init() {
        super.init(texture: nil, color: .clear, size: initialSize)
        
        //let texture = textureAtlas.textureNamed("basket")
        
        player.position = CGPoint(x: 200, y: 100)
        player.size = initialSize
        
        player.zPosition = 100
        player.physicsBody = SKPhysicsBody(circleOfRadius: player.size.width / 2)
        player.physicsBody?.isDynamic = false
        player.physicsBody?.categoryBitMask = physicsCategory.player.rawValue
        player.physicsBody?.contactTestBitMask = physicsCategory.player.rawValue
        player.physicsBody?.collisionBitMask = physicsCategory.player.rawValue
        player.physicsBody?.mass = 10
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.allowsRotation = false
        
        self.addChild(player)
        //let bodyTextrue = textureAtl
    }
    
    func onTap() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
