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
        
        layout = layout_subway()
        
        layout.response = Response_Ch1_part3()
        layout.choices = ChoiceData_Ch1_empty()
        (layout as! layout_subway).initView(self.view)
        
        if let appdel = UIApplication.shared.delegate as? AppDelegate {
            // 실패
            if (appdel.subwayFail) {
                self.subwayIdx = 1
            }
            // 성공
            else {
                self.subwayIdx = 0
            }
        }
        
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
        
        if (self.layout.talkIndex[0] < layout.response.player_response[self.subwayIdx].count) {
            self.layout.profile_player.image = UIImage(named: layout.response.player_image[self.subwayIdx][self.layout.talkIndex[0]])
            self.layout.text.setText(layout.response.player_response[self.subwayIdx][self.layout.talkIndex[0]])
            self.layout.talkIndex[0] += 1
            layout.backView.isUserInteractionEnabled = true
        }
        
        // subway game 시작
        else {
            //let vc = GameViewController()
            //self.presentFull(vc, animated: false, completion: nil)
            
            //self.view?.window?.rootViewController?.dissmissAndPresent(Ch2Part1ViewController(), animated: true, completion: nil)
            self.presentFull(Ch1ElevatorViewController(), animated: false, completion: nil)
        }
    }

}
