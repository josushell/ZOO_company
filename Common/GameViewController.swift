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
    var scene: SubwayScene?
    
    override func loadView() {
        super.loadView()
        self.view = SKView()
        self.view.bounds = UIScreen.main.bounds
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupScene()
    }
    func setupScene() {
        if let view = self.view as! SKView?, scene == nil {
            let scene = SubwayScene(size: view.bounds.size) // StartScene()//OfficeScene()
            view.presentScene(scene)
            self.scene = scene
        }
        else {
            print("failed")
        }
    }
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//
//        if let view = self.presentingViewController?.view as! SKView? {
//
//            var scene: SKScene?
//            scene = SubwayScene()//StartScene()//OfficeScene()
//
//            view.ignoresSiblingOrder = true
//            scene?.scaleMode = .aspectFill
//            scene?.size = view.bounds.size
//
//            view.presentScene(scene)
//        }
//        else {
//            print("failed")
//        }
//
//    }
    
    deinit{
        print("GameViewController deinit")
    }

}
