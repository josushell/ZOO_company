//
//  SubwayHUD.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/23.
//

import Foundation
import SpriteKit

// MARK: - 남은 생명 표시
class SubwayHUD: SKNode {
    var heartNodes: [SKSpriteNode] = []
    
    func createHudNodes(screenSize: CGSize) {
        let texture = SKTexture(imageNamed: "life")
        for index in 0 ..< 3 {
            let newHeartNode = SKSpriteNode(texture: texture)
            newHeartNode.size = CGSize(width: 48 ,height: 46)

            let xPos = 10 + CGFloat(index * 55) + 33
            let yPos = screenSize.height - 45
            newHeartNode.position = CGPoint(x: xPos, y: yPos)
            newHeartNode.zPosition = 999

            heartNodes.append(newHeartNode)

            self.addChild(newHeartNode)
        }
    }
    
    func setHealthDisplay(newHealth: Int) {
        if (newHealth == 0) {
            heartNodes[0].alpha = 1
        }
        else {
            for index in 0 ..< heartNodes.count {
                if index < newHealth {
                    heartNodes[index].alpha = 1
                }
                else {
                    heartNodes[index].alpha = 0
                }
            }
        }
    }
}
