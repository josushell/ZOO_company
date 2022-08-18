//
//  SubwayViewController.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/08/14.
//

import UIKit

class Ch1Part2ViewController: UIViewController {

    let layout = layout_subway()
    var tapGesture: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        print("subway")
        super.viewDidLoad()
        
        layout.initView(self.view)
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(backTouched(_:)))
        layout.backView.addGestureRecognizer(tapGesture!)
    }
    
    @objc func backTouched(_ sender: UITapGestureRecognizer) {
        layout.backView.isUserInteractionEnabled = false
        layout.textbox.isHidden = false
        layout.profile_player.isHidden = false
        
        if (layout.talkIndex[0] < layout.talks.player.count) {
            self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[layout.talkIndex[0]])
            //self.layout.text.text = layout.talks.player[layout.talkIndex[0]]
            self.layout.text.setText(layout.talks.player[layout.talkIndex[0]])
            layout.talkIndex[0] += 1
            layout.backView.isUserInteractionEnabled = true
        }
        
        // subway game 시작
        else {
            //let vc = GameViewController()
            //self.presentFull(vc, animated: false, completion: nil)
            
            //self.view?.window?.rootViewController?.dissmissAndPresent(Ch2Part1ViewController(), animated: true, completion: nil)
            self.presentFull(Ch2Part1ViewController(), animated: true, completion: nil)
        }
    }
    
}
