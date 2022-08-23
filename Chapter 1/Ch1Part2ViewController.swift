//
//  SubwayViewController.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/08/14.
//

import UIKit

class Ch1Part2ViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout = layout_subway()
        
        layout.talks = TalkData_Ch1_part2()
        layout.profileOrder = ImgOrderData_Ch1_part2()
        layout.choices = ChoiceData_Ch1_empty()
        (layout as! layout_subway).initView(self.view)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.registerGesture()
        })
    }
    
    override func registerGesture() {
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(backTouched(_:)))
        layout.backView.addGestureRecognizer(tapGesture!)
    }
    
    @objc override func backTouched(_ sender: UITapGestureRecognizer) {
        layout.backView.isUserInteractionEnabled = false
        layout.textbox.isHidden = false
        layout.profile_player.isHidden = false
        
        if (self.layout.talkIndex[0] < layout.talks.player.count) {
            self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[self.layout.talkIndex[0]])
            self.layout.text.setText(layout.talks.player[self.layout.talkIndex[0]])
            self.layout.talkIndex[0] += 1
            layout.backView.isUserInteractionEnabled = true
        }
        
        // subway game 시작
        else {
            self.presentFull(GameViewController(), animated: false, completion: nil)
        }
    }
    
}
