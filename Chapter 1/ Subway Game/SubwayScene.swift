//
//  Subway.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/07/09.
//

import Foundation
import GameplayKit
import SpriteKit
import UIKit


class SubwayScene: SKScene, SKPhysicsContactDelegate {
    let vs = viewSize()
    
    var gameNode: SKNode!
    var backgroundNode: SKNode!
    
    var playerNode: SKNode!
    var playerSprite: SKSpriteNode!
    
    var obstacleNode: SKNode!
    
    var countDownNode: SKSpriteNode!
    var preview_back: SKSpriteNode!
    var preview_player: SKSpriteNode!
    
    let groundSpeed: CGFloat = 200
    let groundHeight: CGFloat = 44
    var playerYposition: CGFloat = 44
    
    // collision mask
    let groundCategory = 1 << 0 as UInt32
    let playerCategory = 1 << 1 as UInt32
    let obstacleCategory = 1 << 2 as UInt32
    let playerNoDamageCategory = 1 << 4 as UInt32
    
    let foreground: CGFloat = 1
    let background: CGFloat = 0
    
    let playerJumpForce = 800 as Int
    
    var lifeCount: Int = 3
    var countDown: Int = 3
    var score: Int = 3
    
    var spawnRate = 2.0 as Double
    var timeSinceLastSpawn = 0.0 as Double
    
    var damaged: Bool = false
    var damageAnimation: SKAction!
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .white
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -9.8)
        
        self.isUserInteractionEnabled = false
        countdown(count: countDown)
    }
    
    func setBackground() {
        let screenWidth = vs.width

        let groundTexture = SKTexture(imageNamed: "subway_game")
        groundTexture.filteringMode = .nearest
        
        let moveGroundLeft = SKAction.moveBy(x: -groundTexture.size().width,
                                             y: 0.0, duration: TimeInterval(screenWidth / groundSpeed))
        let resetGround = SKAction.moveBy(x: groundTexture.size().width, y: 0.0, duration: 0.0)
        let groundLoop = SKAction.sequence([moveGroundLeft, resetGround])
        

        let numberOfGroundNodes = 1 + Int(ceil(screenWidth / groundTexture.size().width))
        
        for i in 0 ..< numberOfGroundNodes {
            let node = SKSpriteNode(texture: groundTexture)
            node.anchorPoint = CGPoint(x: 0.0, y: 0.0)
            node.position = CGPoint(x: CGFloat(i) * groundTexture.size().width, y: 0.5)
            backgroundNode.addChild(node)
            node.run(SKAction.repeatForever(groundLoop))
        }
    }
    
    func setPlayer() {
        let screenWidth = vs.width
        let playerScale = 1.0 as CGFloat
        var runArray: [SKTexture] = []
        
        for idx in [1, 3, 6, 4] {
            runArray.append(SKTexture(imageNamed: "run\(idx)"))
        }

        for item in runArray {
            item.filteringMode = .nearest
        }
        
        playerSprite = SKSpriteNode()
        playerSprite.size = SKTexture(imageNamed: "run1").size()
        playerNode.addChild(playerSprite)
        playerSprite.position = CGPoint(x: screenWidth * 0.2, y: playerYposition)
        
        let runningAnimation = SKAction.animate(with: runArray, timePerFrame: 0.1)
        
        let physicsBox = CGSize(width: runArray.first!.size().width * playerScale,
                                height: runArray.first!.size().height * playerScale)
        
        playerSprite.physicsBody = SKPhysicsBody(rectangleOf: physicsBox)
        playerSprite.physicsBody?.isDynamic = true
        playerSprite.physicsBody?.mass = 1.0
        playerSprite.physicsBody?.categoryBitMask = playerCategory
        playerSprite.physicsBody?.contactTestBitMask = obstacleCategory
        playerSprite.physicsBody?.collisionBitMask = groundCategory
        
        playerYposition = groundHeight + playerSprite.size.height
        playerSprite.run(SKAction.repeatForever(runningAnimation))
    }
    
    func addCollisionToGround() {
        let groundContactNode = SKNode()
        groundContactNode.position = CGPoint(x: 0, y: groundHeight - 30)
        groundContactNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.size.width * 3, height: groundHeight))
        groundContactNode.physicsBody?.friction = 0.0
        groundContactNode.physicsBody?.isDynamic = false
        groundContactNode.physicsBody?.categoryBitMask = groundCategory
        
        backgroundNode.addChild(groundContactNode)
    }
    
    func setObstacle() {
        let obstacles = ["two_1", "two_2", "two_3", "two_4", "three_1", "three_2", "three_3"]
        let Scale = 1.0
        
        let obstacleTexture = SKTexture(imageNamed: obstacles.randomElement()!)
        obstacleTexture.filteringMode = .nearest
        let obstacleSprite = SKSpriteNode(texture: obstacleTexture)
        obstacleSprite.setScale(Scale)
        
        let contactBox = CGSize(width: obstacleTexture.size().width * Scale,
                                height: obstacleTexture.size().height * Scale)
        obstacleSprite.physicsBody = SKPhysicsBody(rectangleOf: contactBox)
        obstacleSprite.physicsBody?.isDynamic = true
        obstacleSprite.physicsBody?.mass = 1.0
        obstacleSprite.physicsBody?.categoryBitMask = obstacleCategory
        obstacleSprite.physicsBody?.contactTestBitMask = playerCategory
        obstacleSprite.physicsBody?.collisionBitMask = groundCategory

        obstacleNode.addChild(obstacleSprite)
        animateObstacle(sprite: obstacleSprite, texture: obstacleTexture)
    }
    
    func animateObstacle(sprite: SKSpriteNode, texture: SKTexture) {
        let screenWidth = vs.width
        let distanceOffscreen = 0 as CGFloat
        let distanceToMove = screenWidth + distanceOffscreen + texture.size().width
        
        let moveObstacle = SKAction.moveBy(x: -distanceToMove, y: 0.0, duration: TimeInterval(screenWidth / groundSpeed))
        let removeObstacle = SKAction.removeFromParent()
        let moveAndRemove = SKAction.sequence([moveObstacle, removeObstacle])
        
        sprite.position = CGPoint(x: distanceToMove, y: groundHeight)
        sprite.run(moveAndRemove)
    }
}

// MARK: - event handling
extension SubwayScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for _ in touches {
            if playerSprite.position.y <= playerYposition && gameNode.speed > 0 {
                playerSprite.physicsBody?.applyImpulse(CGVector(dx: 0, dy: playerJumpForce))
                // run(jumpSound)
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        guard let _ = gameNode else {
            return
        }
        
        if(gameNode.speed > 0){
            
            if(currentTime - timeSinceLastSpawn > spawnRate){
                timeSinceLastSpawn = currentTime
                spawnRate = Double.random(in: 1.5 ..< 4.5)
                setObstacle()
            }
        }
    }
    func didBegin(_ contact: SKPhysicsContact) {
        if(hitObstacle(contact)){
            setDamage()
            setHealthStatus()
        }
    }
    
    func setDamageAnimation() {
               let damageStart = SKAction.run {

                   self.physicsBody?.categoryBitMask = self.playerNoDamageCategory
               }

               let slowFade = SKAction.sequence([
                   SKAction.fadeAlpha(to: 0.3, duration: 0.35),
                   SKAction.fadeAlpha(to: 0.7, duration: 0.35)
                   ])
               let fastFade = SKAction.sequence([
                   SKAction.fadeAlpha(to: 0.3, duration: 0.2),
                   SKAction.fadeAlpha(to: 0.7, duration: 0.2)
                   ])
               let fadeOutAndIn = SKAction.sequence([
                   SKAction.repeat(slowFade, count: 2),
                   SKAction.repeat(fastFade, count: 5),
                   SKAction.fadeAlpha(to: 1, duration: 0.15)
                   ])
               
               let damageEnd = SKAction.run {
                   self.physicsBody?.categoryBitMask = self.playerCategory
                   self.damaged = false
               }
              
               self.damageAnimation = SKAction.sequence([
                   damageStart,
                   fadeOutAndIn,
                   damageEnd
            ])
    }
    
    func setDamage() {
        if self.damaged { return }
        self.damaged = true
        
        self.lifeCount -= 1
        if self.lifeCount == 0 {
            gameFail()
        }
        else {
            playerSprite.run(self.damageAnimation)
        }
    }
    func setHealthStatus() {
        // Create a fade SKAction to fade out any lost hearts:
        let fadeAction = SKAction.fadeAlpha(to: 0.2,
                                            duration: 0.3)
        // Loop through each heart and update its status:
//        for index in 0 ..< lifeCount {
//            if index < newHealth {
//                // This heart should be full red:
//                heartNodes[index].alpha = 1
//            }
//            else {
//                // This heart should be faded:
//                heartNodes[index].run(fadeAction)
//            }
//        }
    }
    
    func hitObstacle(_ contact: SKPhysicsContact) -> Bool {
        return contact.bodyA.categoryBitMask & obstacleCategory == obstacleCategory ||
            contact.bodyB.categoryBitMask & obstacleCategory == obstacleCategory
    }
    
    func gameFail() {
        if let appdel = UIApplication.shared.delegate as? AppDelegate {
            appdel.subwayFail = true
        }
        gameOver()
    }
    
    func gameSucess() {
        if let appdel = UIApplication.shared.delegate as? AppDelegate {
            appdel.subwayFail = false
        }
        gameOver()
    }
    
    func gameOver() {
        gameNode.speed = 0.0
        
        playerSprite.removeAllActions()
        self.view?.window?.rootViewController?.dissmissAndPresent(Ch1Part3ViewController(), animated: false, completion: nil)
    }
}

// MARK: - Extension: count down
extension SubwayScene {
    private func countdownAction() {
        countDown -= 1

        let texture = SKTexture(imageNamed: "count_\(countDown)")
        texture.filteringMode = .nearest
        countDownNode.texture = texture
        countDownNode.size = texture.size()
        if (countDown == 0) {
            countDownNode.position.x = vs.width / 2 - (texture.size().width / 2) + 30
            countDownNode.position.y = vs.height / 2
        }
    }

    private func endCountdown() {
        countDownNode.removeFromParent()
        preview_player.removeFromParent()
        preview_back.removeFromParent()
        startGame()
    }
    
    private func startGame()
    {
        setDamageAnimation()
        
        gameNode = SKNode()
        
        backgroundNode = SKNode()
        backgroundNode.zPosition = background
        setBackground()
        addCollisionToGround()
        
        gameNode.addChild(backgroundNode)
        
        playerNode = SKNode()
        playerNode.zPosition = foreground
        setPlayer()
        gameNode.addChild(playerNode)
        
        obstacleNode = SKNode()
        obstacleNode.zPosition = foreground
        gameNode.addChild(obstacleNode)
        
        self.addChild(gameNode)
        self.isUserInteractionEnabled = true
    }
    
    func countdown(count: Int) {
        preview_back = SKSpriteNode(imageNamed: "subway_game")
        preview_back.anchorPoint = CGPoint.zero
        preview_back.position = CGPoint.zero
        self.addChild(preview_back)
        
        preview_player = SKSpriteNode(imageNamed: "run1")
        preview_player.anchorPoint = CGPoint.zero
        preview_player.position = CGPoint(x: vs.width * 0.2, y: playerYposition)
        self.addChild(preview_player)
        
        let texture = SKTexture(imageNamed: "count_3")
        countDownNode = SKSpriteNode(texture: texture)
        countDownNode.anchorPoint = CGPoint.zero
        countDownNode.size = texture.size()
        countDownNode.position = CGPoint(x: vs.width / 2, y: vs.height / 2)
        self.addChild(countDownNode)

        let counterDecrement = SKAction.sequence([SKAction.wait(forDuration: 1.0), SKAction.run(countdownAction)])

        run(SKAction.sequence([SKAction.repeat(counterDecrement, count: count + 1), SKAction.run(endCountdown)]))
    }
}
