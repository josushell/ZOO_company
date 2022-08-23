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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupScene()
    }
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        setupScene()
//    }
    func setupScene() {
        if let view = self.view as! SKView?, scene == nil {
            let scene = SubwayScene(size: view.bounds.size)
            scene.controller = self
            view.presentScene(scene)
            self.scene = scene
        }
        else {
            print("subway game setupscene failed")
        }
    }

    deinit{
        print("GameViewController deinit")
    }

}
