//
//  Scenes.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/07/09.
//

import Foundation
import SpriteKit

// MARK: - SKView extension
class Back: SKScene, callback {
    var callbackMethod: ((Set<UITouch>, UIEvent?) -> Void)?
    
    func setCallback(callback: @escaping ((_ touches: Set<UITouch>, _ event: UIEvent?) -> Void)) {
        self.callbackMethod = callback
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("yes back")
        callbackMethod?(touches, event)
    }
    
    let chartexture = SKTextureAtlas(named: "Char")
    let backtexture = SKTextureAtlas(named: "Back")
    let choicetexture = SKTextureAtlas(named: "Choices")
    let profileAtlas = SKTextureAtlas(named: "Profile")
    
    var backgroundImg = SKSpriteNode()
    
    let char = SKSpriteNode()
    let box = SKSpriteNode()
    let profile = SKSpriteNode()
    let dialog = SKLabelNode(fontNamed: "NeoDunggeunmo-Regular")
    
    // MARK: - background 설정
    func setBackground(backImgName: String, charImgName: String, width: CGFloat, height: CGFloat) {
        // 배경 이미지 설정
        backgroundImg.texture = backtexture.textureNamed(backImgName)
        backgroundImg.size = CGSize(width: width, height: height)
        self.addChild(backgroundImg)
        
        // player 설정
        char.texture = chartexture.textureNamed(charImgName)
        char.size = CGSize(width: 60.23, height: 68)
        char.position = CGPoint(x: 130, y: -50)
        char.zPosition = 995
        self.addChild(char)
    }
    
}
