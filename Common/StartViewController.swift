//
//  StartViewController.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/08/07.
//

import UIKit

class StartViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        self.view.backgroundColor = .white
        let vc = GameViewController()
        self.add(vc)
        //self.presentFull(vc, animated: false, completion: nil)
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
