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
    var controller: UIViewController?
    
    let gameDescription = SubwayDescription()
    let gameResult = SubwayGameResult()
    let lifeHUD = SubwayHUD()
    
    var gameNode: SKNode!
    var backgroundNode_back: SKNode!
    var backgroundNode_front: SKNode!
    
    var playerNode: SKNode!
    var playerSprite: SKSpriteNode!
    
    var obstacleNode: SKNode!
    
    var countDownNode: SKSpriteNode!
    
    let backgroundBackSpeed: CGFloat = 100
    let backgroundFrontSpeed: CGFloat = 200
    let groundHeight: CGFloat = 44
    var playerYposition: CGFloat = 44
    
    // collision mask
    let groundCategory = 1 << 0 as UInt32
    let playerCategory = 1 << 1 as UInt32
    let obstacleCategory = 1 << 2 as UInt32
    let playerNoDamageCategory = 1 << 4 as UInt32
    
    let foreground: CGFloat = 2
    let background: CGFloat = 1
    let bottomground: CGFloat = 0
    
    let playerJumpForce = 800 as Int
    
    var lifeCount: Int = 3
    var countDown: Int = 3
    var score: Int = 3
    
    var spawnRate = 2.0 as Double
    var timeSinceLastSpawn = 0.0 as Double
    
    var damaged: Bool = false
    var damageAnimation: SKAction!
    
    var gameEnded: Bool = false
    let appdel = UIApplication.shared.delegate as? AppDelegate
    
    let back_bgm = SKAudioNode(fileNamed: "subway_game")
    let gameover_win_bgm = SKAction.playSoundFileNamed("game_over", waitForCompletion: false)
    let gameover_lose_bgm = SKAction.playSoundFileNamed("you_lose", waitForCompletion: false)
    let button_bgm = SKAction.playSoundFileNamed("button_clicked", waitForCompletion: false)
    let jump_bgm = SKAction.playSoundFileNamed("jump", waitForCompletion: false)
    let countstart_bgm = SKAction.playSoundFileNamed("321start", waitForCompletion: false)
    let damage_bgm = SKAction.playSoundFileNamed("loss_heart", waitForCompletion: false)
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .black
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -9.8)
        
        gameDescription.initViews(view)
        gameDescription.btn_start.addTarget(self, action: #selector(setGameSettings(_:)), for: .touchUpInside)
        gameResult.initViews(view)
        gameResult.btn_start.addTarget(self, action: #selector(moveOnNextChapter(_:)), for: .touchUpInside)
        
        countdown(count: countDown)
        
        // MARK: background music
        self.addChild(back_bgm)
        back_bgm.run(SKAction.play())
    }
    
    func setBackground(_ fileName: String, _ speed: CGFloat, _ parentNode: SKNode) {
        let screenWidth = self.frame.width
        
        let groundTexture = SKTexture(imageNamed: fileName)
        groundTexture.filteringMode = .nearest
        
        let moveGroundLeft = SKAction.moveBy(x: -groundTexture.size().width,
                                             y: 0.0, duration: TimeInterval(screenWidth / speed))
        let resetGround = SKAction.moveBy(x: groundTexture.size().width, y: 0.0, duration: 0.0)
        let groundLoop = SKAction.sequence([moveGroundLeft, resetGround])
        
        
        let numberOfGroundNodes = 1 + Int(ceil((screenWidth) / groundTexture.size().width))
        
        for i in 0 ..< numberOfGroundNodes {
            let node = SKSpriteNode(texture: groundTexture)
            node.anchorPoint = CGPoint(x: 0.0, y: 0.0)
            node.position = CGPoint(x: CGFloat(i) * groundTexture.size().width, y: 0.5)
            node.size.height = self.frame.height
            parentNode.addChild(node)
            node.run(SKAction.repeatForever(groundLoop))
        }
    }
    
    func setPlayer() {
        let screenWidth = self.frame.width
        let playerScale = 1.0 as CGFloat
        var runArray: [SKTexture] = []
        
        for idx in [1, 3, 6, 4] {
            runArray.append(SKTexture(imageNamed: "run\(idx)"))
        }
        
        for item in runArray {
            item.filteringMode = .nearest
        }
        
        playerSprite = SKSpriteNode()
        playerSprite.size = CGSize(width: 64.4, height: 92)
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
        
        backgroundNode_front.addChild(groundContactNode)
    }
    
    func setObstacle() {
        let obstacles = ["two_1", "two_2", "two_3", "two_4", "two_5", "two_6", "two_7", "three_1", "three_2", "three_3", "three_4", "three_5", "three_6"]
        let Scale = 0.7
        
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
        let screenWidth = self.frame.width
        let distanceOffscreen = 0 as CGFloat
        let distanceToMove = screenWidth + distanceOffscreen + texture.size().width
        
        let moveObstacle = SKAction.moveBy(x: -distanceToMove, y: 0.0, duration: TimeInterval(screenWidth / backgroundFrontSpeed))
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
                self.run(self.jump_bgm, completion: {})
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
                spawnRate = Double.random(in: 1.5 ..< 3.5)
                setObstacle()
            }
        }
    }
    func didBegin(_ contact: SKPhysicsContact) {
        if(hitObstacle(contact)){
            setDamage()
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
        self.run(self.damage_bgm, completion: {})
        
        guard !self.damaged else {
            return
        }
        self.damaged = true
        
        self.lifeCount -= 1
        lifeHUD.setHealthDisplay(newHealth: lifeCount)
        if self.lifeCount == 0 {
            gameEND(isGameSuccess: false)
        }
        else {
            playerSprite.run(self.damageAnimation)
        }
    }
    
    func hitObstacle(_ contact: SKPhysicsContact) -> Bool {
        return contact.bodyA.categoryBitMask & obstacleCategory == obstacleCategory ||
        contact.bodyB.categoryBitMask & obstacleCategory == obstacleCategory
    }
    
    func gameEND(isGameSuccess: Bool) {
        if (!gameEnded) {
            gameEnded = true
            gameNode.speed = 0.0
            appdel?.subwaySuccess = isGameSuccess

            back_bgm.run(SKAction.changeVolume(to: 0, duration: 0.3))
            if (isGameSuccess) {
                self.run(self.gameover_win_bgm, completion: {
                })
            }
            else {
                self.run(self.gameover_lose_bgm, completion: {
                })
            }
            
            playerSprite.removeAllActions()
            let resultText = (isGameSuccess == true ? "YOU WIN!" : "YOU LOSE!")
            gameResult.openResult(resultTxt: resultText)
        }
    }
    // MARK: - edit here
    @objc func moveOnNextChapter(_ sender: UIButton) {
        self.run(SKAction.wait(forDuration: 1), completion: {
            self.controller?.dissmissAndPresent(Ch1Part3ViewController(), animated: false, completion: nil)
        })
    
        //self.controller?.dissmissAndPresent(Ch1Part3ViewController(), animated: false, completion: nil)
    }
}

// MARK: - Extension: count down
extension SubwayScene {
    private func countdownAction() {
        if (countDown > 0) {
            countDown -= 1
            
            let texture = SKTexture(imageNamed: "count_\(countDown)")
            texture.filteringMode = .nearest
            countDownNode.texture = texture
            countDownNode.size = texture.size()
            if (countDown == 0) {
                countDownNode.position.x = self.frame.width / 2 - (texture.size().width / 2)
                countDownNode.position.y = self.frame.height / 2 - (texture.size().height / 2)
            }
        }
    }
    
    private func endCountdown() {
        countDownNode.removeFromParent()
        self.isUserInteractionEnabled = true
        gameNode.speed = 1
    }
    
    private func startGame()
    {
        setDamageAnimation()
        
        gameNode = SKNode()
        
        backgroundNode_back = SKNode()
        backgroundNode_back.zPosition = bottomground
        
        backgroundNode_front = SKNode()
        backgroundNode_front.zPosition = background
        setBackground("subway_back", backgroundBackSpeed, backgroundNode_back)
        setBackground("subway_front", backgroundFrontSpeed, backgroundNode_front)
        addCollisionToGround()
        
        gameNode.addChild(backgroundNode_front)
        gameNode.addChild(backgroundNode_back)
        
        playerNode = SKNode()
        playerNode.zPosition = foreground
        setPlayer()
        gameNode.addChild(playerNode)
        
        obstacleNode = SKNode()
        obstacleNode.zPosition = foreground
        gameNode.addChild(obstacleNode)
        
        self.addChild(gameNode)
    }
    
    func countdown(count: Int) {
        self.isUserInteractionEnabled = false
        
        lifeHUD.createHudNodes(screenSize: CGSize(width: self.frame.width, height: self.frame.height))
        self.addChild(lifeHUD)
        
        startGame()
        gameNode.speed = 0
        
        let texture = SKTexture(imageNamed: "count_3")
        countDownNode = SKSpriteNode(texture: texture)
        countDownNode.anchorPoint = CGPoint.zero
        countDownNode.size = texture.size()
        countDownNode.position = CGPoint(x: self.frame.width / 2 - texture.size().width / 2, y: self.frame.height / 2 - texture.size().height / 2)
        countDownNode.zPosition = 999
        
        self.addChild(countDownNode)
    }
    
    @objc func setGameSettings(_ sender: UIButton) {
        gameDescription.layout_main.removeFromSuperview()
        
        let counterDecrement = SKAction.sequence([SKAction.wait(forDuration: 1.0), SKAction.run(countdownAction)])
        
        run(SKAction.sequence([SKAction.repeat(counterDecrement, count: countDown + 1), SKAction.run(endCountdown)]))
        
        // 60 secs
        let successTime = SKAction.sequence([SKAction.wait(forDuration: 1.0)])
        run(SKAction.sequence([SKAction.repeat(successTime, count: 60), SKAction.run {
            self.gameEND(isGameSuccess: true)
        }]))
        self.run(self.countstart_bgm, completion: {})
    }
}
