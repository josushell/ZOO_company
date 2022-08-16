//
//  Ch1ViewController.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/08/14.
//

import UIKit

class Ch1ViewController: UIViewController {

    let layout = layout_home()
    var selected: Bool = false
    var select_index: Int = 0
    var tapGesture: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.initView(self.view)
        
        // 3초 뒤 실행
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            UIView.animate(withDuration: 2.0, delay: 0, options: .curveLinear ,animations: {
                self.layout.minimi_player.transform = CGAffineTransform(translationX: 0, y: 80)
            }, completion: { finished in
                self.registerGesture()
            })
        }
    }
    
    func registerGesture() {
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(backTouched(_:)))
        layout.backView.addGestureRecognizer(tapGesture!)
        
        layout.btn_choice1.addTarget(self, action: #selector(onBtnClicked), for: .touchUpInside)
        layout.btn_choice2.addTarget(self, action: #selector(onBtnClicked), for: .touchUpInside)
        layout.btn_choice3.addTarget(self, action: #selector(onBtnClicked), for: .touchUpInside)
    }
    
    @objc func onBtnClicked(_ sender: UIButton) {
        select_index = sender.tag
        selected = true
        layout.layout_choice.isHidden = true
        layout.layout_blackView.isHidden = true
        
        self.layout.text.text = layout.response.player_response[self.select_index]
        self.layout.profile_player.image = UIImage(named: layout.response.player_image[self.select_index])
    }
    
    @objc func backTouched(_ sender: UITapGestureRecognizer) {
        layout.textbox.isHidden = false
        layout.profile_player.isHidden = false
        
        // 선택지 전
        if (!selected){
            if (layout.layout_choice.isHidden == true) {
                if (layout.talkIndex[0] < layout.talks.player.count) {
                    self.layout.text.text = layout.talks.player[layout.talkIndex[0]]
                    self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[layout.talkIndex[0]])
                    layout.talkIndex[0] += 1
                }
                // 선택지 등장
                else {
                    layout.layout_blackView.isHidden = false
                    layout.layout_choice.isHidden = false
                }
            }
        }
        
        // 선택지 후
        else {
            self.layout.text.text = layout.response.player_response[self.select_index]
            self.layout.profile_player.image = UIImage(named: layout.response.player_image[self.select_index])
            
            //MARK: - fade in fade out
            //let vc = GameViewController()
            //self.presentFull(vc, animated: false, completion: nil)
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                //self.view?.window?.rootViewController?.dissmissAndPresent(SubwayViewController(), animated: true, completion: nil)
                self.presentFull(SubwayViewController(), animated: true, completion: nil)
            }
        }
    }
    
}

// MARK: - home layout
class layout_home {
    let vs = viewSize()
    
    let backView = UIView()
    let backgroundImg = UIImageView()
    let profile_player = UIImageView()
    let minimi_player = UIImageView()
    
    let textbox = UIImageView()
    let text = UILabel()
    
    let talks = TalkData_Ch1()
    let profileOrder = ImgOrderData_Ch1()
    var talkIndex: [Int] = [0, 0, 0]
    
    let layout_choice = UIView()
    let choiceView = UIImageView()
    let layout_blackView = UIView()
    let label_choicetitle = UILabel()
    let btn_choice1 = UIButton()
    let btn_choice2 = UIButton()
    let btn_choice3 = UIButton()
    let choices = ChoiceData_Ch1()
    let response = Response_Ch1()
    
    func initView(_ view: UIView) {
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
        backgroundImg.image = UIImage(named: "home")
        
        
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
        text.sizeToFit()
        text.text = "test"
        text.numberOfLines = 0
        text.textColor = UIColor.white
        text.font = UIFont(name: "NeoDunggeunmo-Regular", size: 15)
        text.preferredMaxLayoutWidth = self.textbox.frame.width
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        let attrStr = NSMutableAttributedString(string: text.text ?? "")
        attrStr.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, text.text?.count ?? 0))
        
        text.attributedText = attrStr
        text.layer.zPosition = 999
        
        // profile 설정
        view.addSubviews(profile_player, minimi_player)
        profile_player.snp.makeConstraints() { make in
            make.bottom.equalTo(self.textbox.snp.top)
//            make.width.equalTo(90)
//            make.height.equalTo(133)
            make.left.equalToSuperview().offset(111)
        }
        profile_player.image = UIImage(named: "sleep_normal")
        profile_player.isHidden = true
        
        minimi_player.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top).offset(71)
            make.trailing.equalTo(backgroundImg.snp.trailing).offset(-176)
        }
        minimi_player.image = UIImage(named: "minimi_player_sleep")
        
        // 선택지
        view.addSubviews(layout_choice,layout_blackView)
        layout_choice.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top)
            make.width.equalTo(445)
            make.bottom.equalTo(self.textbox.snp.top)
            make.centerX.equalToSuperview()
        }
        layout_choice.isHidden = true

        layout_blackView.snp.makeConstraints() { make in
            make.edges.equalTo(backgroundImg)
        }
        layout_blackView.backgroundColor = .black
        layout_blackView.alpha = 0.5
        layout_blackView.isHidden = true
        
        layout_choice.addSubviews(choiceView, label_choicetitle, btn_choice1, btn_choice2, btn_choice3)
        choiceView.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        choiceView.image = UIImage(named: "choiceframe")
        
        label_choicetitle.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(36)
            make.centerX.equalToSuperview()
        }
        label_choicetitle.text = choices.title
        label_choicetitle.font = UIFont(name: "NeoDunggeunmo-Regular", size: 14)
        
        btn_choice1.snp.makeConstraints() { make in
            make.width.equalTo(329)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(72)
        }
        btn_choice1.setImage(UIImage(named: "choicebox_normal"), for: .normal)
        btn_choice1.setImage(UIImage(named: "choicebox_touched"), for: .focused)
        btn_choice1.tag = 0
        
        let label_btn1 = UILabel()
        label_btn1.text = choices.choice1
        label_btn1.font = UIFont(name: "NeoDunggeunmo-Regular", size: 12)
        label_btn1.textAlignment = .center
        btn_choice1.addSubview(label_btn1)
        label_btn1.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        
        btn_choice2.snp.makeConstraints() { make in
            make.width.equalTo(329)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalTo(btn_choice1.snp.bottom).offset(10)
        }
        btn_choice2.setImage(UIImage(named: "choicebox_normal"), for: .normal)
        btn_choice2.setImage(UIImage(named: "choicebox_touched"), for: .focused)
        btn_choice2.setTitle(choices.choice2, for: .normal)
        btn_choice2.titleLabel?.font = UIFont(name: "NeoDunggeunmo-Regular", size: 15)
        btn_choice2.titleLabel?.textColor = .black
        btn_choice2.tag = 1
        
        let label_btn2 = UILabel()
        label_btn2.text = choices.choice2
        label_btn2.font = UIFont(name: "NeoDunggeunmo-Regular", size: 12)
        label_btn2.textAlignment = .center
        btn_choice2.addSubview(label_btn2)
        label_btn2.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        
        btn_choice3.snp.makeConstraints() { make in
            make.width.equalTo(329)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalTo(btn_choice2.snp.bottom).offset(10)
        }
        btn_choice3.setImage(UIImage(named: "choicebox_normal"), for: .normal)
        btn_choice3.setImage(UIImage(named: "choicebox_touched"), for: .selected)
        btn_choice3.setTitle(choices.choice3, for: .normal)
        btn_choice3.titleLabel?.font = UIFont(name: "NeoDunggeunmo-Regular", size: 15)
        btn_choice3.tag = 2
        
        let label_btn3 = UILabel()
        label_btn3.text = choices.choice3
        label_btn3.font = UIFont(name: "NeoDunggeunmo-Regular", size: 12)
        label_btn3.textAlignment = .center
        btn_choice3.addSubview(label_btn3)
        label_btn3.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        
    }
}

// MARK: - dialog 데이터
class TalkData_Ch1 {
    var player: [String] = []
    
    func initTalks() {
        player = ["드디어 기다리고 기다리던 첫 출근이야!", "당장 준비하고 출발해볼까?!", "잠깐! 1시간이나 일찍 일어났잖아?", "흠… 첫 출근에 일찍 일어났네 이제 어떻게 하지?"]
    }
}

// MARK: - profile 순서
struct ImgOrderData_Ch1 {
    var player: [String] = ["sleep_normal", "sleep_stare", "sleep_surprise", "sleep_stare"]
}

// MARK: - 선택지 데이터
struct ChoiceData_Ch1 {
    let title = "Q.  출근 전 일찍 일어났을 때는 어떻게 할까?"
    let choice1 = "1시간 일찍 간다"
    let choice2 = "그냥 더 잔다"
    let choice3 = "아침밥을 먹는다"
}

// MARK: - 선택지 반응
struct Response_Ch1 {
    let player_response = ["일찍 일어난 새가 벌레를 잡는다고 하지!\n이왕 일찍 일어난 김에 1시간 먼저 나가서 청소도 하고 업무도 미리미리 해야지!", "내가 그렇게 까지 열심히 살아야 해? 일찍 일어나는 새는 일찍 피곤하다.. 더 자야지", "첫 출근이니까 완벽하게 준비를 해야지. 아침밥 먹고 힘내서 출근하자! "]
    let player_image = ["sleep_fire", "sleep_tired", "sleep_normal"]
}

