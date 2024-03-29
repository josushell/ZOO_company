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
        
        sound = Ch3_part2()
        (sound as! Ch3_part2).playHomeMusic()
        
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
        
        // 엔딩 스탯 추가
        if (select_index == 0) {
            selectedStats = GameStats.Passion.rawValue
        }
        else if (select_index == 1) {
            selectedStats = GameStats.Relationship.rawValue
        }
        else {
            selectedStats = GameStats.Mental.rawValue
        }
        updateStat()
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
                    fadeIntoLounge()
                }
                else {
                    self.layout.text.setText(self.layout.talks.player[self.layout.talkIndex[0]])
                    self.layout.talkIndex[0] += 1
                    self.layout.backView.isUserInteractionEnabled = true
                }
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
            sound.setVolumeFadeOut((sound as! Ch3_part2).bgm, completion: {
                self.presentFull(Ch4Part1ViewController(), animated: false, completion: nil)
            })
            //self.dissmissAndPresent(Ch4Part1ViewController(), animated: false, completion: nil)
        }
    }
    
    func fadeIntoLounge() {
        self.layout.hideBeforeAnim()
        UIView.transition(with: self.layout.backgroundImg, duration: 2, options: .transitionCrossDissolve, animations: {
            self.layout.backgroundImg.image = UIImage(named: "lounge")
        }, completion: { _ in
            self.minimiPlayerAnimation_IN() {                    self.layout.revealAfterAnim()
                self.layout.profile_char.image = UIImage(named: "vending")
                self.layout.text.setText(self.layout.talks.player[self.layout.talkIndex[0]])
                self.layout.talkIndex[0] += 1
                self.layout.backView.isUserInteractionEnabled = true
            }
        })
    }
    
    func minimiPlayerAnimation_IN(_ completion: @escaping (() -> Void)) {
        (self.layout as! layout_Office_ch3).minimi_palyer.isHidden = false
        UIView.animate(withDuration: 1.7, delay: 0, options: .curveLinear, animations: {
            (self.layout as! layout_Office_ch3).minimi_palyer.transform = CGAffineTransform(translationX: -186, y: 0)
        }, completion: { _ in
            UIView.animate(withDuration: 1.2, delay: 0, options: .curveLinear, animations: {
                (self.layout as! layout_Office_ch3).minimi_palyer.transform = CGAffineTransform(translationX: -186, y: 100)
            }, completion: { _ in
                UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                    (self.layout as! layout_Office_ch3).minimi_palyer.transform = CGAffineTransform(translationX: -270, y: 100)
                }, completion: { _ in
                    completion()
                })
            })
            
        })
        
    }
}
