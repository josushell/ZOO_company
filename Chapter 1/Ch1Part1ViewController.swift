//
//  Ch1ViewController.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/08/14.
//

import UIKit
import SpriteKit

class Ch1Part1ViewController: BaseViewController {
    var selected: Bool = false
    var minimi: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sound = HomeSound()
        (sound as! HomeSound).playHomeMusic()
        
        layout = layout_home()
        
        layout.talks = TalkData_Ch1_part1()
        layout.profileOrder = ImgOrderData_Ch1_part1()
        layout.choices = ChoiceData_Ch1_part1()
        layout.response = Response_Ch1_part1()
        (layout as! layout_home).initView(self.view)
        
        // 3초 뒤 실행
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            UIView.animate(withDuration: 2.0, delay: 0, options: .curveLinear ,animations: {
                (self.layout as! layout_home).minimi_player.transform = CGAffineTransform(translationX: 0, y: 80)
            }, completion: { finished in
                self.registerGesture()
            })
        }
    }
    
    @objc override func onBtnClicked(_ sender: UIButton) {
        super.onBtnClicked(sender)

        layout.backView.isUserInteractionEnabled = false
        selected = true
        
        self.layout.profile_player.image = UIImage(named: layout.response.player_image[0][self.select_index])
        self.layout.text.setText(layout.response.player_response[0][self.select_index])
        layout.backView.isUserInteractionEnabled = true
        
        // 엔딩 스탯 추가
        if (select_index == 0) {
            selectedStats = GameStats.Passion.rawValue
        }
        else if (select_index == 1) {
            selectedStats = GameStats.Mental.rawValue
        }
        else {
            selectedStats = GameStats.Diligent.rawValue
        }
        updateStat()
    }
    
    @objc override func backTouched(_ sender: UITapGestureRecognizer) {
        layout.textbox.isHidden = false
        layout.profile_player.isHidden = false
        layout.backView.isUserInteractionEnabled = false
        
        // 선택지 전
        if (!selected){
            if (layout.layout_choice.isHidden == true) {
                if (self.layout.talkIndex[0] < layout.talks.player.count) {
                    if (self.layout.talkIndex[0] == 2 && !minimi) {
                        minimi = true
                        minimiPlayerAnimation_JUMP()
                    }
                    self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[self.layout.talkIndex[0]])
                    self.layout.text.setText(layout.talks.player[self.layout.talkIndex[0]])
                    self.layout.talkIndex[0] += 1
                }
                // 선택지 등장
                else {
                    self.view.bringSubviewToFront(layout.layout_choice)
                    layout.layout_blackView.isHidden = false
                    layout.layout_choice.isHidden = false
                }
            }
            layout.backView.isUserInteractionEnabled = true
        }
        
        // 선택지 후
        else {
            layout.backView.isUserInteractionEnabled = false
            //MARK: - fade in fade out

            (sound as! HomeSound).setVolumeFadeOut((sound as! HomeSound).home_bgm, completion: {
                self.dissmissAndPresent(Ch1Part2ViewController(), animated: false, completion: nil)
            })
        }
    }
    
    func minimiPlayerAnimation_JUMP() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            (self.layout as! layout_home).minimi_player.transform = CGAffineTransform(translationX: 0, y: 50)
        }, completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
                (self.layout as! layout_home).minimi_player.transform = CGAffineTransform(translationX: 0, y: 80)
            }, completion: { _ in
                
            })
        })
    }
    
}
