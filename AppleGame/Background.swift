//
//  Background.swift
//  prototype
//
//  Created by JOSUEYEON on 2022/05/26.
//

import Foundation
import SpriteKit

class Background: SKSpriteNode {
    // 배경 이동 속도
    var movementMultiplier = CGFloat(1)
    // 배경이 앞으로 이동할 x좌표 위치 저장
    var jumpAdjustment = CGFloat(0)
    let backgroundSize = CGSize(width: 1024, height: 768)
    
    var textureAtlas = SKTextureAtlas(named: "objects")
    
    func spawn(parentNode: SKNode, imageName: String, zPosition: CGFloat, movementMult: CGFloat) {
        self.anchorPoint = CGPoint.zero
        self.position = CGPoint(x: 0, y: 0)
        self.zPosition = zPosition
        self.movementMultiplier = movementMult
        
        // parentNode에 배경 추가
        parentNode.addChild(self)
        let texture = textureAtlas.textureNamed(imageName)
        
        for i in -1...1 {
            let newBGNode = SKSpriteNode(texture: texture)
            newBGNode.size = backgroundSize
            newBGNode.anchorPoint = CGPoint.zero
            newBGNode.position = CGPoint(x: i * Int(backgroundSize.width), y: 0)
            self.addChild(newBGNode)
        }
    }
    
    func updatePosition(playerProgress: CGFloat) {
        let adjustedposition = jumpAdjustment + playerProgress * (1 - movementMultiplier)
        if playerProgress - adjustedposition > backgroundSize.width {
            jumpAdjustment += backgroundSize.width
        }
        self.position.x = adjustedposition
    }
}
