//
//  Ch4Part2ViewController.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import UIKit

class Ch4Part2ViewController: BaseViewController {
    var selected: Bool = false
    var minimi: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sound = Ch4_part2()
        (sound as! Ch4_part2).playHomeMusic()
        
        layout = layout_Office_ch4()
        
        layout.talks = TalkData_Ch4_part2()
        layout.choices = ChoiceData_Ch4_part2()
        layout.profileOrder = ImgOrderData_Ch4_part2()
        layout.response = Response_Ch4_part2()
        (layout as! layout_Office_ch4).initView(self.view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.registerGesture()
        })
        
    }

    @objc override func onBtnClicked(_ sender: UIButton) {
        super.onBtnClicked(sender)
        
        layout.backView.isUserInteractionEnabled = false
        
        self.layout.img_nametag.isHidden = true
        self.layout.profile_player.image = UIImage(named: layout.response.player_image[0][self.select_index])
        self.layout.text.setText(layout.response.player_response[0][self.select_index])
        
        selected = true
        layout.backView.isUserInteractionEnabled = true
        
        // 엔딩 스탯 추가
        if (select_index == 0) {
            selectedStats = GameStats.Passion.rawValue
        }
        else if (select_index == 1) {
            selectedStats = GameStats.Efficiency.rawValue
        }
        else {
            selectedStats = GameStats.Relationship.rawValue
        }
        updateStat()
    }
    
    @objc override func backTouched(_ sender: UITapGestureRecognizer) {
        layout.backView.isUserInteractionEnabled = false
        layout.textbox.isHidden = false
        
        // 선택지 전
        if (!selected) {
            if (self.layout.talkIndex[0] < layout.talks.player.count) {
                if (self.layout.talkIndex[0] == 2 && !minimi) {
                    pigeonMinimiAnimation_IN()
                    minimi = true
                }
                else {
                    self.layout.revealAfterAnim()
                    self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[self.layout.talkIndex[0]])
                    self.layout.text.setText(layout.talks.player[self.layout.talkIndex[0]])
                    
                    self.layout.talkIndex[0] += 1
                    layout.backView.isUserInteractionEnabled = true
                }
            }
            else if (self.layout.talkIndex[1] < (layout.talks as! TalkData_Ch4_part2).pigeon.count) {
                self.layout.profile_player.image = UIImage(named: "suit_normal")
                self.layout.setNametag(nametagHidden: false, "비둘기 사장")
                self.layout.profile_char.isHidden = false
                self.layout.profile_char.image = UIImage(named: (layout.profileOrder as! ImgOrderData_Ch4_part2).pigeon[self.layout.talkIndex[1]])
                self.layout.text.setText((layout.talks as! TalkData_Ch4_part2).pigeon[self.layout.talkIndex[1]])
                
                self.layout.talkIndex[1] += 1
                layout.backView.isUserInteractionEnabled = true
            }
            else {
                self.view.bringSubviewToFront(layout.layout_choice)
                layout.layout_choice.isHidden = false
                layout.layout_blackView.isHidden = false
            }
        }
        
        // 선택지 후
        else {
            //MARK: - ch4 part1 fade in fade out
            (sound as! Ch4_part2).setVolumeFadeOut((sound as! Ch4_part2).bgm, completion: {
                self.presentFull(Ch5Part1ViewController(), animated: false, completion: nil)
            })
            //self.dissmissAndPresent(Ch5Part1ViewController(), animated: false, completion: nil)
        }

    }
    
    // 비둘기 미니미 애니메이션
    func pigeonMinimiAnimation_IN() {
        self.layout.hideBeforeAnim()
        self.layout.backView.isUserInteractionEnabled = false
        (self.layout as! layout_Office_ch4).minimi_char1.isHidden = false
        (self.layout as! layout_Office_ch4).minimi_char1.image = UIImage(named: "minimi_pigeon")
        UIView.animate(withDuration: 1.2, delay: 0, options: .curveLinear, animations: {
            (self.layout as! layout_Office_ch4).minimi_char1.transform = CGAffineTransform(translationX: 0, y: 70)
        }, completion: { _ in
            self.playerMinimiAnimation_JUMP() {
                self.layout.backView.isUserInteractionEnabled = true
            }
        })
    }
    
    func playerMinimiAnimation_JUMP(_ completion: @escaping (() -> Void)) {
        UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveLinear, animations: {
            (self.layout as! layout_Office_ch4).minimi_player.transform = CGAffineTransform(translationX: 0, y: -20)
        }, completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
                (self.layout as! layout_Office_ch4).minimi_player.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: { _ in
                completion()
            })
        })
    }

}
