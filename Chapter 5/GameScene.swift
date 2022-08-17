//
//  GameScene.swift
//  prototype
//
//  Created by JOSUEYEON on 2022/05/16.
//

import SpriteKit
import GameplayKit

// bitmask
enum physicsCategory: UInt32 {
    case player = 1
    case apple = 2
}

// SKPhysicsContactDelegate 접촉 이벤트 발생 시 델리게이트
class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    var treeY: CGFloat = 0.0
    let player = Player()
    
    var eatenApple = 0
    
    var totalApple = 0
    
    override func didMove(to view: SKView) {
        self.anchorPoint = .zero
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
        // delegate 설정
        self.physicsWorld.contactDelegate = self
        
        self.treeY = self.size.height;
        let maxPos = (self.view?.frame.size.width) ?? 500
        
        let app1 = Apple(posX: 200, duration: 5, TreeY: self.treeY, maxPos: maxPos, parentView: self)
        self.addChild(app1)
        
        let app2 = Apple(posX: 300, duration: 2, TreeY: self.treeY, maxPos: maxPos, parentView: self)
        self.addChild(app2)
        
        let app3 = Apple(posX: 400, duration: 3, TreeY: self.treeY, maxPos: maxPos, parentView: self)
        self.addChild(app3)
        
        let app4 = Apple(posX: 600, duration: 7, TreeY: self.treeY, maxPos: maxPos, parentView: self)
        self.addChild(app4)
        
        self.addChild(player)
        
        let background = Background()
        background.spawn(parentNode: self, imageName: "back", zPosition: -5, movementMult: 0.75)
    
    }

    deinit {
        print("AppleGame deinit")
    }
    // 터치 이벤트
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            self.player.updateX(newX: location.x)
        }
    }
    
    // 접촉 이벤트 발생 시 delegate
    func didBegin(_ contact: SKPhysicsContact) {
        eatenApple += 1
        print("eatenApple: \(eatenApple)")
        
        // A가 apple, B가 player
        if (contact.bodyA.contactTestBitMask & physicsCategory.apple.rawValue > 0) {
            let apple = contact.bodyA.node as! SKSpriteNode
            print("here")
            apple.isHidden = true
            print(apple.isHidden)
        }
        else {
            let apple = contact.bodyB.node as! SKSpriteNode
            print("here")
            apple.isHidden = true
            print(apple.isHidden)
        }
        
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        print("end")

    }
    override func update(_ currentTime: TimeInterval){
        self.player.update()
    }
    
    func makeTree(posX: CGFloat)
    {
        let tree = SKSpriteNode(imageNamed: "tree")
        
        tree.size = CGSize(width: 300, height: 300)
        
        self.treeY = self.size.height;
        tree.position = CGPoint(x: posX, y: self.treeY - tree.size.height)
        
        self.addChild(tree)
    }
    /*
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
     */
}
