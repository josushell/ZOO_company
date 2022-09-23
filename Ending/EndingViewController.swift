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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout = layout_ending()
        
        layout.talks = TalkData_Ending()
        layout.choices = ChoiceData_Ending()
        (layout as! layout_ending).initView(self.view)

        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.layout.textbox.isHidden = false
            self.showEndingText {
                self.registerGesture()
            }
        })
    }
    
    override func backTouched(_ sender: UITapGestureRecognizer) {
        self.layout.backView.isUserInteractionEnabled = false
        
        if (layout.talkIndex[0] < 5) {
            showEndingBackgroundImg()
            showEndingText {
                self.layout.backView.isUserInteractionEnabled = true
            }
        }
    }
    
    // MARK: - show ending dialog text
    func showEndingText(_ completion: @escaping (() -> Void)) {
        layout.text.setText(layout.talks.player[layout.talkIndex[0]])
        layout.talkIndex[0] += 1
        completion()
    }
    
    // MARK: - show ending background image with animation
    func showEndingBackgroundImg () {
        layout.backgroundImg.image = UIImage(named: self.backImgArray[layout.talkIndex[0]])
        
        if (backImgArray[layout.talkIndex[0]].contains("-")) {
            var Imgstr = backImgArray[layout.talkIndex[0]]
            Imgstr.removeLast()
            Imgstr += "2"
            
            UIView.transition(with: self.layout.backgroundImg, duration: 1, options: .transitionCrossDissolve, animations: {
                self.layout.backgroundImg.image = UIImage(named: "Imgstr")
            }, completion: { _ in
                self.layout.backView.isUserInteractionEnabled = true
            })
        }
    }
}
