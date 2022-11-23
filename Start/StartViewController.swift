//
//  StartViewController.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/08/07.
//

import UIKit
import SpriteKit
import GameplayKit

class StartViewController: UIViewController {
    var scene: StartScene?
    
    override func loadView() {
        super.loadView()
        self.view = SKView()
        self.view.backgroundColor = .black
        self.view.bounds = UIScreen.main.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupScene()
    }

    func setupScene() {
        if let view = self.view as! SKView?, scene == nil {
            let scene = StartScene(size: view.bounds.size)
            scene.controller = self
            view.presentScene(scene)
            self.scene = scene
        }
        else {
            
        }
    }
    
    deinit{
    }

}
