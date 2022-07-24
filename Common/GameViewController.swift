//
//  GameViewController.swift
//  prototype
//
//  Created by JOSUEYEON on 2022/05/16.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if let view = self.view as! SKView? {
            
            var scene: SKScene?
            scene = SubwayScene()//StartScene()//OfficeScene()
            
            view.ignoresSiblingOrder = true
            scene?.scaleMode = .aspectFill
            scene?.size = view.bounds.size

            view.presentScene(scene)
        }
        
    }
    deinit{
        print("GameViewController deinit")
    }
  
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
