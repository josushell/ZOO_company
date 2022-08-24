//
//  Ch1ElevatorViewController.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/19.
//

import UIKit

class Ch1ElevatorViewController: UIViewController {
    let layout = layout_elevator()
    let sound = ElevatorSound()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sound.playElevatorMusic()
        
        layout.initView(self.view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            self.textAnimation()
        })
    }
    
    func textAnimation() {
        UIView.animate(withDuration: 6, delay: 0, options: .curveLinear, animations: {
            self.layout.label.transform = CGAffineTransform(translationX: (self.layout.vs
                .width + self.layout.label.frame.width + 100) * -1, y: 0)
        }, completion: { _ in
            self.sound.setVolumeFadeOut(self.sound.elevator_bgm) {
                self.presentFull(Ch2Part1ViewController(), animated: false, completion: nil, transition: false)
            }
        })
    }

}
