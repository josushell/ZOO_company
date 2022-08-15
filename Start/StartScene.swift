//
//  StartScene.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/06/01.
//

import Foundation
import SpriteKit

// MARK: 시작 scene
class StartScene: SKScene {
    let textureAtlas = SKTextureAtlas(named: "start")
    // MARK: 시작 버튼
    let startBtn = SKSpriteNode()
    
    // MARK: - entry point
    override func didMove(to view: SKView) {

        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.backgroundColor = UIColor(red: 255, green: 255, blue: 255)
        
        // MARK: 배경 이미지 애니메이션
        let backFrame: [SKTexture] = [textureAtlas.textureNamed("1"), textureAtlas.textureNamed("2"),
                                     textureAtlas.textureNamed("3"), textureAtlas.textureNamed("4")]
        let backAction = SKAction.animate(with: backFrame, timePerFrame: 0.5)
        let backgroundImg = SKSpriteNode(imageNamed: "1")
        
        var mainAnim = SKAction()
        mainAnim = SKAction.repeatForever(backAction)
        
        backgroundImg.run(mainAnim)
        self.addChild(backgroundImg)
        
        // MARK: Start button settings
        startBtn.texture = textureAtlas.textureNamed("startbtn")
        startBtn.size = CGSize(width: 200, height: 100)
        startBtn.position = CGPoint(x: 0.5, y: -140)
        startBtn.name = "StartBtn"
        self.addChild(startBtn)
        
        // MARK: Start button animation
    }
    
    // MARK: - start button touch event delegate
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let nodeTouched = atPoint(location)
            
            // 화면 전환
            if nodeTouched.name == "StartBtn" {
                self.view?.presentScene(UsernameScene(size: self.size))
            }
        }
    }
}
