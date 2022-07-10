//
//  Tree.swift
//  prototype
//
//  Created by JOSUEYEON on 2022/05/16.
//

import Foundation
import SpriteKit

class Apple: SKSpriteNode, GameSprite {
    var count = 0
    
    var parentView: GameScene?
    
    var initialSize: CGSize = CGSize(width: 40, height: 40)
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "objects")
    func onTap() {
        
    }
    let apple = SKSpriteNode(imageNamed: "apple")
    
    var maxPos: CGFloat?
    let positionArr = [60, 110, 160, 200, 250, 300, 450]
    let timeArr = [3.0, 3.6, 3.9, 4.2, 4.5, 5.0]
    
    var H: CGFloat = 0.0
   
    init(posX: CGFloat, duration: TimeInterval, TreeY: CGFloat, maxPos: CGFloat, parentView: GameScene)
    {
        //let texture = textureAtlas.textureNamed("apple")
        super.init(texture: nil, color: .clear, size: initialSize)
        
        self.maxPos = maxPos
        self.apple.size = initialSize
        self.parentView = parentView

        apple.physicsBody = SKPhysicsBody(circleOfRadius: apple.size.width / 2)
        apple.zPosition = 100
        apple.physicsBody?.categoryBitMask = physicsCategory.apple.rawValue
        apple.physicsBody?.contactTestBitMask = physicsCategory.apple.rawValue
        apple.physicsBody?.collisionBitMask = physicsCategory.apple.rawValue
        //apple.physicsBody?.isDynamic = false
        apple.physicsBody?.mass = 5
        apple.physicsBody?.allowsRotation = false
        apple.physicsBody?.affectedByGravity = false

        apple.position = CGPoint(x: posX, y: TreeY)
        self.addChild(apple)

        let randomT = Int.random(in: 0...100) % 6
        self.H = TreeY
        
        createAnimations(posX: posX, duration: TimeInterval(timeArr[randomT]))
    }
    
    func createAnimations(posX: CGFloat, duration: TimeInterval) {
        self.apple.isHidden = false
        let drop = SKAction.move(to: CGPoint(x: posX, y: 0), duration: duration)
        let counterDecrement = SKAction.sequence([SKAction.wait(forDuration: 1.0), drop])
        self.apple.run(counterDecrement) { [self] in
            if (self.count == 10) {
                self.parentView?.totalApple += 10
                if (self.parentView?.totalApple == 40)
                {

                }
                self.apple.removeFromParent()
            }
            else {
                self.count += 1
                let randomX = CGFloat.random(in: 100...(self.maxPos ?? 200) - 100)
                let randomT = Int.random(in: 0...100) % 6
                self.apple.position = CGPoint(x: randomX, y: self.H + 100)

                createAnimations(posX: randomX, duration: TimeInterval(timeArr[randomT]))
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
