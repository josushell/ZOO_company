//
//  Ch3Part2ViewController.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import UIKit

class Ch3Part2ViewController: BaseViewController {
    var selected: Bool = false
   
    override func viewDidLoad() {
        super.viewDidLoad()
        layout = layout_Office_ch3()
        
        layout.talks = TalkData_Ch3_part2()
        layout.response = Response_Ch3_part2()
        layout.choices = ChoiceData_Ch3_part2()
        layout.profileOrder = ImgOrderData_Ch3_part2()
        
        (layout as! layout_Office_ch3).initView(self.view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.registerGesture()
        })
        
    }
    
    @objc override func onBtnClicked(_ sender: UIButton) {
        super.onBtnClicked(sender)
        selected = true
        
        self.layout.profile_player.image = UIImage(named: layout.response.player_image[0][self.select_index])
        self.layout.text.setText(layout.response.player_response[0][self.select_index])
        
        layout.backView.isUserInteractionEnabled = true
    }
    
    @objc override func backTouched(_ sender: UITapGestureRecognizer) {
        layout.backView.isUserInteractionEnabled = false
        layout.textbox.isHidden = false
        layout.profile_player.isHidden = false
        
        // 선택지 전
        if (!selected){
            if (self.layout.talkIndex[0] < layout.talks.player.count) {
                (self.layout as! layout_Office_ch3).profile_player.image = UIImage(named: layout.profileOrder.player[self.layout.talkIndex[0]])
                // 자판기 이미지
                if (self.layout.talkIndex[0] == 3) {
                    self.layout.profile_char.isHidden = false
                    self.layout.profile_char.image = UIImage(named: "vending")
                }
                
                self.layout.text.setText(layout.talks.player[self.layout.talkIndex[0]])
                self.layout.talkIndex[0] += 1
                
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
            self.dissmissAndPresent(Ch4Part1ViewController(), animated: false, completion: nil)
        }
    }
}
