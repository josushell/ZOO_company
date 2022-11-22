//
//  Ch1Part3ViewController.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/22.
//

import UIKit

class Ch1Part3ViewController: BaseViewController {
    var subwayIdx: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sound = Ch1_part3()
        (sound as! Ch1_part3).playHomeMusic()
        
        layout = layout_subway()
        
        layout.response = Response_Ch1_part3()
        layout.choices = ChoiceData_Ch1_empty()
        (layout as! layout_subway).initView(self.view)
        
        if let appdel = UIApplication.shared.delegate as? AppDelegate {
            // 성공
            if (appdel.subwaySuccess) {
                self.subwayIdx = 0
            }
            // 실패
            else {
                self.subwayIdx = 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.layout.textbox.isHidden = false
            self.layout.profile_player.isHidden = false
            self.layout.profile_player.image = UIImage(named: self.layout.response.player_image[self.subwayIdx][self.layout.talkIndex[0]])
            self.layout.text.setText(self.layout.response.player_response[self.subwayIdx][self.layout.talkIndex[0]])
            self.layout.talkIndex[0] += 1
            
            self.registerGesture()
        })
    }
    
    override func registerGesture() {
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(backTouched(_:)))
        layout.backView.addGestureRecognizer(tapGesture!)
    }
    
    @objc override func backTouched(_ sender: UITapGestureRecognizer) {
        layout.backView.isUserInteractionEnabled = false
        
        if (self.layout.talkIndex[0] < layout.response.player_response[self.subwayIdx].count) {
            self.layout.profile_player.image = UIImage(named: layout.response.player_image[self.subwayIdx][self.layout.talkIndex[0]])
            self.layout.text.setText(layout.response.player_response[self.subwayIdx][self.layout.talkIndex[0]])
            self.layout.talkIndex[0] += 1
            layout.backView.isUserInteractionEnabled = true
        }
        
        else {
            (sound as! Ch1_part3).setVolumeFadeOut((sound as! Ch1_part3).bgm, completion: {
                self.presentFull(Ch1ElevatorViewController(), animated: false, completion: nil, transition: false)
            })
            //self.presentFull(Ch1ElevatorViewController(), animated: false, completion: nil, transition: false)
        }
    }

}
