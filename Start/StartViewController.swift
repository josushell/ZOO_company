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
        self.view.bounds = UIScreen.main.bounds
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupScene()
    }
    func setupScene() {
        if let view = self.view as! SKView?, scene == nil {
            let scene = StartScene(size: view.bounds.size)//SubwayScene(size: view.bounds.size) //OfficeScene()
            scene.controller = self
            view.presentScene(scene)
            self.scene = scene
        }
        else {
            
        }
    }
    
    deinit{
        print("StartViewController deinit")
    }

}
