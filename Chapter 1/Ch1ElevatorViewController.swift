//
//  Ch1ElevatorViewController.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/19.
//

import UIKit

class Ch1ElevatorViewController: BaseViewController {
    let elevator_layout = layout_elevator()
    let elevator_sound = ElevatorSound()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        elevator_sound.playElevatorMusic()
        elevator_layout.initView(self.view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            self.textAnimation()
        })
    }
    
    func textAnimation() {
        UIView.animate(withDuration: 6, delay: 0, options: .curveLinear, animations: {
            self.elevator_layout.label.transform = CGAffineTransform(translationX: (self.elevator_layout.vs
                .width + self.elevator_layout.label.frame.width + 100) * -1, y: 0)
        }, completion: { _ in
            self.elevator_sound.setVolumeFadeOut(self.elevator_sound.elevator_bgm) {
                self.presentFull(Ch2Part1ViewController(), animated: false, completion: nil, transition: true)
            }
        })
    }

}
