//
//  Ch3Part2ViewController.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import UIKit

class Ch3Part2ViewController: UIViewController {
    
    let layout = layout_Office_ch3()
    var selected: Bool = false
    var select_index: Int = 0
    var tapGesture: UITapGestureRecognizer?
    let sound = Sound()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.talks = TalkData_Ch3_part2()
        layout.response = Response_Ch3_part2()
        layout.choices = ChoiceData_Ch3_part2()
        layout.profileOrder = ImgOrderData_Ch3_part2()
        
        layout.initView(self.view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.registerGesture()
        })
        
    }
    
    func registerGesture() {
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(backTouched))
        layout.backView.addGestureRecognizer(tapGesture!)
        
        layout.btn_choice1.addTarget(self, action: #selector(onBtnClicked), for: .touchUpInside)
        layout.btn_choice2.addTarget(self, action: #selector(onBtnClicked), for: .touchUpInside)
        layout.btn_choice3.addTarget(self, action: #selector(onBtnClicked), for: .touchUpInside)
    }
    
    
    @objc func onBtnClicked(_ sender: UIButton) {
        sound.playSelectSound()
        select_index = sender.tag
        selected = true
        layout.layout_choice.isHidden = true
        layout.layout_blackView.isHidden = true
        
        self.layout.profile_player.image = UIImage(named: layout.response.player_image[0][self.select_index])
        self.layout.text.setText(layout.response.player_response[0][self.select_index])
        
        layout.backView.isUserInteractionEnabled = true
    }
    
    @objc func backTouched(_ sender: UITapGestureRecognizer) {
        layout.backView.isUserInteractionEnabled = false
        layout.textbox.isHidden = false
        layout.profile_player.isHidden = false
        
        // 선택지 전
        if (!selected){
            if (layout.talkIndex[0] < layout.talks.player.count) {
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[layout.talkIndex[0]])
                // 자판기 이미지
                if (layout.talkIndex[0] == 3) {
                    self.layout.profile_char.isHidden = false
                    self.layout.profile_char.image = UIImage(named: "suit_normal")
                }
                
                self.layout.text.setText(layout.talks.player[layout.talkIndex[0]])
                layout.talkIndex[0] += 1
                
                layout.backView.isUserInteractionEnabled = true
            }
            
            // 선택지 등장
            else {
                self.view.bringSubviewToFront(layout.layout_choice)
                layout.layout_blackView.isHidden = false
                layout.layout_choice.isHidden = false
            }
        }
        
        // 선택지 후
        else {
            // ch4
            self.presentFull(Ch4Part1ViewController(), animated: false, completion: nil)
        }
    }
}
