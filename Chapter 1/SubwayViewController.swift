//
//  SubwayViewController.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/08/14.
//

import UIKit

class SubwayViewController: UIViewController {

    let layout = layout_subway()
    var tapGesture: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        print("subway")
        super.viewDidLoad()
        
        layout.initView(self.view)
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(backTouched(_:)))
        layout.backView.addGestureRecognizer(tapGesture!)
    }
    
    @objc func backTouched(_ sender: UITapGestureRecognizer) {
        layout.backView.isUserInteractionEnabled = false
        layout.textbox.isHidden = false
        layout.profile_player.isHidden = false
        
        if (layout.talkIndex[0] < layout.talks.player.count) {
            self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[layout.talkIndex[0]])
            //self.layout.text.text = layout.talks.player[layout.talkIndex[0]]
            self.layout.text.setText(layout.talks.player[layout.talkIndex[0]])
            layout.talkIndex[0] += 1
            layout.backView.isUserInteractionEnabled = true
        }
        
        // subway game 시작
        else {
            //let vc = GameViewController()
            //self.presentFull(vc, animated: false, completion: nil)
            
            //self.view?.window?.rootViewController?.dissmissAndPresent(Ch2Part1ViewController(), animated: true, completion: nil)
            self.presentFull(Ch2Part1ViewController(), animated: true, completion: nil)
        }
    }
    
}


// MARK: - subway layout
class layout_subway {
    let vs = viewSize()
    
    let backView = UIView()
    let backgroundImg = UIImageView()
    let profile_player = UIImageView()
    
    let textbox = UIImageView()
    let text = UILabel()
    
    let talks = TalkData_Subway()
    let profileOrder = ImgOrderData_Subway()
    var talkIndex: [Int] = [0, 0, 0]

    func initView(_ view: UIView) {
        print("init views")
        talks.initTalks()
        
        view.addSubview(backView)
        backView.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        backView.backgroundColor = .black
        
        view.addSubview(backgroundImg)
        backgroundImg.snp.makeConstraints() { make in
            make.center.equalToSuperview()
            make.height.equalTo(vs.height)
            make.width.equalTo(vs.width)
        }
        backgroundImg.frame.size = CGSize(width: vs.width, height: vs.height)
        backgroundImg.image = UIImage(named: "subway")
        
        
        // text box
        view.addSubview(textbox)
        textbox.snp.makeConstraints() { make in
            make.bottom.centerX.equalTo(backgroundImg)
            make.height.equalTo(74)
            make.width.equalTo(backgroundImg.snp.width)
        }
        textbox.image = UIImage(named: "textback")
        textbox.isHidden = true
        textbox.layer.zPosition = 998
        
        textbox.addSubviews(text)
        text.snp.makeConstraints() { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(32)
        }
        text.setTextAttribute()
        text.preferredMaxLayoutWidth = self.textbox.frame.width
        
        // profile 설정
        view.addSubviews(profile_player)
        profile_player.snp.makeConstraints() { make in
            make.bottom.equalTo(self.textbox.snp.top)
            make.left.equalToSuperview().offset(111)
        }
        profile_player.image = UIImage(named: "suit_normal")
        profile_player.isHidden = true
        
    }
}

// MARK: - dialog 데이터
class TalkData_Subway {
    var player: [String] = []
    
    func initTalks() {

        player = ["휴... 다행히 제 시간에 탔네 제 시간에 내리기만 하면 늦진 않겠어!", "이번 역은 주 컴퍼니역입니다. 내리실 문은 왼쪽입니다", "벌써 도착이잖아!", "내려야 하는데… 사람이 왜 이리 많아!", "안돼 첫 날부터 늦을 순 없어! 어떻게든 여기서 나가야만 해!"]
    }
}

// MARK: - profile 순서
struct ImgOrderData_Subway{
    var player: [String] = ["suit_normal", "suit_normal", "suit_surprise", "suit_awkward", "suit_fire"]
}

