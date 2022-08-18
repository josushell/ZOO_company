//
//  Ch4Part2ViewController.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import UIKit

class Ch4Part2ViewController: UIViewController {
    let layout = layout_Office_ch4()
    var select_index: Int = 0
    var selected: Bool = false
    var tapGesture: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layout.talks = TalkData_Ch4_part2()
        layout.choices = ChoiceData_Ch4_part2()
        layout.profileOrder = ImgOrderData_Ch4_part2()
        layout.response = Response_Ch4_part2()
        layout.initView(self.view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
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
        layout.backView.isUserInteractionEnabled = false
        layout.layout_blackView.isHidden = true
        select_index = sender.tag
        layout.layout_choice.isHidden = true
        
        self.layout.img_nametag.isHidden = true
        self.layout.profile_player.image = UIImage(named: layout.response.player_image[0][self.select_index])
        self.layout.text.setText(layout.response.player_response[0][self.select_index])
        
        selected = true
        layout.backView.isUserInteractionEnabled = true
    }
    
    @objc func backTouched(_ sender: UITapGestureRecognizer) {
        layout.backView.isUserInteractionEnabled = false
        layout.textbox.isHidden = false
        
        // 선택지 전
        if (!selected) {
            if (layout.talkIndex[0] < layout.talks.player.count) {
                self.layout.profile_player.isHidden = false
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[layout.talkIndex[0]])
                self.layout.text.setText(layout.talks.player[layout.talkIndex[0]])
                
                layout.talkIndex[0] += 1
            }
            else if (layout.talkIndex[1] < (layout.talks as! TalkData_Ch4_part2).pigeon.count) {
                self.layout.profile_player.image = UIImage(named: "suit_normal")
                self.layout.img_nametag.isHidden = false
                self.layout.text_nametag.text = "비둘기 사장"
                self.layout.profile_char.isHidden = false
                self.layout.profile_char.image = UIImage(named: (layout.profileOrder as! ImgOrderData_Ch4_part2).pigeon[layout.talkIndex[1]])
                self.layout.text.setText((layout.talks as! TalkData_Ch4_part2).pigeon[layout.talkIndex[1]])
                
                layout.talkIndex[1] += 1
            }
            else {
                self.view.bringSubviewToFront(layout.layout_choice)
                layout.layout_choice.isHidden = false
                layout.layout_blackView.isHidden = false
            }
        }
        
        // 선택지 후
        else {
            // fade in / fade out
        }
        
        layout.backView.isUserInteractionEnabled = true
    }

}
