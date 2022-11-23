//
//  EndingViewController.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/09/21.
//

import Foundation
import UIKit

// MARK: - Ending View Controller
class EndingViewController: BaseViewController {
    var backImgArray = ["ending1", "ending2", "ending3-1", "ending4-1", "ending5"]
    var identity: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sound = Ending()
        (sound as! Ending).playHomeMusic()
        
        layout = layout_ending()
        
        layout.talks = TalkData_Ending()
        layout.choices = ChoiceData_Ending()
        (layout as! layout_ending).initView(self.view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            self.firstBackImgAnimation()
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.layout.textbox.isHidden = false
            
            self.showEndingText {
                self.registerGesture()
            }
        })
    }
    
    override func backTouched(_ sender: UITapGestureRecognizer) {
        self.layout.backView.isUserInteractionEnabled = false
        if (!identity) {
            self.layout.backgroundImg.transform = .identity
            self.layout.backgroundImg.snp.remakeConstraints() { make in
                make.edges.equalToSuperview()
            }
        }
        
        if (layout.talkIndex[0] < 5) {
            layout.backgroundImg.image = UIImage(named: self.backImgArray[layout.talkIndex[0]])
            
            if (backImgArray[layout.talkIndex[0]].contains("-")) {
                var Imgstr = backImgArray[layout.talkIndex[0]]
                Imgstr.removeLast()
                Imgstr += "2"
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {

                    UIView.transition(with: self.layout.backgroundImg, duration: 1, options: .transitionCrossDissolve, animations: {
                        self.layout.backgroundImg.image = UIImage(named: Imgstr)
                    }, completion: { _ in
                        //self.layout.backView.isUserInteractionEnabled = true
                    })
                })
            }
            
            if (layout.talkIndex[0] < layout.talks.player.count) {
                showEndingText {
                    self.layout.backView.isUserInteractionEnabled = true
                }
            }
            else {
                self.layout.textbox.isHidden = true
                //MARK: - fade in fade out: 2 sec
                (sound as! Ending).setVolumeFadeOut((sound as! Ending).bgm, completion: {
                    let reference = ReferenceViewController()
                    reference.modalTransitionStyle = .coverVertical
                    reference.modalPresentationStyle = .fullScreen
                    self.present(reference, animated: true, completion: nil)
                })
            }
        }
    }
    
    // MARK: - 첫번째 배경 이미지 이동 애니메이션
    func firstBackImgAnimation() {
        let diff = (UIImage(named: "ending1")?.size.width)! - FrameSize().width
        
        self.layout.backView.isUserInteractionEnabled = false
        UIView.animate(withDuration: 3, delay: 0, options: .curveEaseOut, animations: {
            self.layout.backgroundImg.transform = CGAffineTransform(translationX: -diff, y: 0)
        }, completion: { _ in
            self.layout.backView.isUserInteractionEnabled = true
        })
                       
    }
    
    // MARK: - show ending dialog text
    func showEndingText(_ completion: @escaping (() -> Void)) {
        self.layout.text.setText(self.layout.talks.player[self.layout.talkIndex[0]])
        self.layout.talkIndex[0] += 1
        completion()
    }
    
//    // MARK: - show ending background image with animation
//    func showEndingBackgroundImg () {
//        layout.backgroundImg.image = UIImage(named: self.backImgArray[layout.talkIndex[0]])
//
//        if (backImgArray[layout.talkIndex[0]].contains("-")) {
//            var Imgstr = backImgArray[layout.talkIndex[0]]
//            Imgstr.removeLast()
//            Imgstr += "2"
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
//                self.layout.backView.isUserInteractionEnabled = false
//                UIView.transition(with: self.layout.backgroundImg, duration: 1, options: .transitionCrossDissolve, animations: {
//                    self.layout.backgroundImg.image = UIImage(named: Imgstr)
//                }, completion: { _ in
//                    self.layout.backView.isUserInteractionEnabled = true
//                })
//            })
//        }
//    }
}
