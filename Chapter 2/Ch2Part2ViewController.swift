//
//  Ch2Part2ViewController.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/08/14.
//

import UIKit

class Ch2Part2ViewController: UIViewController {

    let layout = layout_Office_part2()
    var selected: [Bool] = [false, false]
    var selected_count = 0
    var select_index: Int = 0
    var count: Int = 0
    var tapGesture: UITapGestureRecognizer?
    
    var imgArray: [UIImage] = [UIImage(named: "office_on_1")!, UIImage(named: "office_on_2")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.initView(self.view)
        layout.backgroundImg.animationImages = imgArray
        layout.backgroundImg.animationDuration = 0.3
        
        self.layout.backgroundImg.startAnimating()
        // 0.5초 뒤 실행
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.registerGesture()
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
        layout.backView.isUserInteractionEnabled = false
        layout.layout_blackView.isHidden = true
        select_index = sender.tag
        layout.layout_choice.isHidden = true
        
        // 1번
        if (selected_count == 0) {
            self.layout.profile_player.image = UIImage(named: self.layout.response.player_image[self.selected_count][self.select_index])
            self.layout.text.setText(self.layout.response.player_response[self.selected_count][self.select_index])
        }
        
        // 2번
        else {
            self.layout.profile_char.image = UIImage(named: self.layout.response.char_image[self.selected_count][self.select_index])
            self.layout.profile_player.image = UIImage(named: self.layout.response.player_image[self.selected_count][self.select_index])
            self.layout.text.setText(self.layout.response.player_response[self.selected_count][self.select_index])
            
            if (select_index == 0) {
                self.layout.text_nametag.text = "펭귄 대리"
            }
            else if (select_index == 1) {
                self.layout.text_nametag.text = "뱁새 과장"
            }
            else {
                self.layout.img_nametag.isHidden = true
            }
        }
        selected[selected_count] = true
        layout.backView.isUserInteractionEnabled = true
    }
    
    @objc func backTouched(_ sender: UITapGestureRecognizer) {
        layout.textbox.isHidden = false
        layout.backView.isUserInteractionEnabled = false
        
        // 1번
        if (!selected[0] && selected_count == 0) {
            self.layout.backgroundImg.stopAnimating()
            self.layout.backgroundImg.image = UIImage(named: "office_alpaca_fire")
            // 알파카
            if (layout.talkIndex[0] < layout.talks.alpaca.count) {
                self.layout.profile_char.isHidden = false
                self.layout.img_nametag.isHidden = false
                self.layout.text_nametag.text = "알파카 대리"
                self.layout.profile_char.image = UIImage(named: layout.profileOrder.alpaca[layout.talkIndex[0]])
                self.layout.text.setText(layout.talks.alpaca[layout.talkIndex[0]])
                layout.talkIndex[0] += 1
            }
            // 주인공
            else if (layout.talkIndex[1] < 2) {
                self.layout.profile_player.isHidden = false
                self.layout.img_nametag.isHidden = true
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[layout.talkIndex[1]])
                self.layout.text.setText(layout.talks.player[layout.talkIndex[1]])
                layout.talkIndex[1] += 1
            }
            else {
                self.view.bringSubviewToFront(layout.layout_choice)
                layout.layout_choice.isHidden = false
                layout.layout_blackView.isHidden = false
            }
            
            layout.backView.isUserInteractionEnabled = true
        }
        
        // 1번 선택지 이후
        else if (selected[0] == true  && selected_count == 0) {
            print("yes 1")
            self.layout.img_nametag.isHidden = false
            self.layout.text_nametag.text = "알파카 대리"
            self.layout.profile_char.image = UIImage(named: self.layout.response.char_image[0][self.select_index])
            self.layout.text.setText(self.layout.response.alpaca_response[0][self.select_index])
            
            selected_count += 1
            
            layout.backView.isUserInteractionEnabled = true
        }
        
        // 2번
        else if (!selected[1] && selected_count == 1) {
            // 주인공
            if (layout.talkIndex[1] < 3) {
                self.layout.img_nametag.isHidden = true
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[layout.talkIndex[1]])
                self.layout.text.setText(layout.talks.player[layout.talkIndex[1]])
                layout.talkIndex[1] += 1
            }
            // 사자 부장
            else if (layout.talkIndex[2] < 1) {
                self.layout.img_nametag.isHidden = false
                
                self.layout.text_nametag.text = "사자 부장"
                self.layout.profile_char.image = UIImage(named: layout.profileOrder.lion[layout.talkIndex[2]])
                self.layout.text.setText(layout.talks.lion[layout.talkIndex[2]])
                layout.talkIndex[2] += 1
            }
            
            // 주인공
            else if (layout.talkIndex[1] < layout.talks.player.count) {
                self.layout.img_nametag.isHidden = true
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[layout.talkIndex[1]])
                self.layout.text.setText(layout.talks.player[layout.talkIndex[1]])
                layout.talkIndex[1] += 1
            }
            
            // 신원불명
            else if (layout.talkIndex[3] < layout.talks.anonymous.count) {
                self.layout.img_nametag.isHidden = false
                self.layout.text_nametag.text = "???"
                self.layout.profile_player.image = UIImage(named: "suit_normal")
                self.layout.profile_char.image = UIImage(named: layout.profileOrder.anonymous[layout.talkIndex[3]])
                self.layout.text.setText(layout.talks.anonymous[layout.talkIndex[3]])
                layout.talkIndex[3] += 1
            }
            else {
                self.layout.label_choicetitle.text = layout.choices.title[selected_count]
                self.layout.label_btn1.text = layout.choices.choice1[selected_count]
                self.layout.label_btn2.text = layout.choices.choice2[selected_count]
                self.layout.label_btn3.text = layout.choices.choice3[selected_count]
                
                self.view.bringSubviewToFront(layout.layout_choice)
                layout.layout_choice.isHidden = false
                layout.layout_blackView.isHidden = false
            }
            layout.backView.isUserInteractionEnabled = true
        }
        
        // 2번 선택지 이후
        else {
            self.layout.text.setText(layout.talks.final[self.select_index])
        }
    }

}

// MARK: - 사무실 layout 2
class layout_Office_part2 {
    let vs = viewSize()
    
    let backView = UIView()
    let backgroundImg = UIImageView()
    let profile_player = UIImageView()
    let profile_char = UIImageView()
    
    let textbox = UIImageView()
    let text = UILabel()
    let img_nametag = UIImageView()
    let text_nametag = UILabel()
    
    let talks = TalkData_Ch2_part2()
    let profileOrder = ImgOrderData_Ch2_part2()
    // [알파카, 주인공, 사자, 신원불명]
    var talkIndex: [Int] = [0, 0, 0, 0]
    
    let layout_choice = UIView()
    let choiceView = UIImageView()
    let layout_blackView = UIView()
    let label_choicetitle = UILabel()
    let btn_choice1 = UIButton()
    let btn_choice2 = UIButton()
    let btn_choice3 = UIButton()
    let label_btn1 = UILabel()
    let label_btn2 = UILabel()
    let label_btn3 = UILabel()
    let choices = ChoiceData_Ch2_part2()
    let response = Response_Ch2_part2()
    
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
        backgroundImg.image = UIImage(named: "office_on_1")
        
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
        
        textbox.addSubviews(text, img_nametag)
        text.snp.makeConstraints() { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(32)
        }
        text.setTextAttribute()
        text.preferredMaxLayoutWidth = self.textbox.frame.width
        
        img_nametag.snp.makeConstraints() {make in
            make.width.equalTo(74)
            make.height.equalTo(17)
            make.bottom.equalTo(textbox.snp.top)
            make.right.equalToSuperview().offset(-49)
        }
        img_nametag.image = UIImage(named: "nametag")
        img_nametag.isHidden = true
        img_nametag.layer.zPosition = 998
        
        img_nametag.addSubview(text_nametag)
        text_nametag.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        text_nametag.setNameTagText()
        
        // profile 설정
        view.addSubviews(profile_player, profile_char)
        profile_player.snp.makeConstraints() { make in
            make.bottom.equalTo(self.textbox.snp.top)
            make.left.equalToSuperview().offset(111)
        }
        profile_player.image = UIImage(named: "suit_normal")
        profile_player.isHidden = true
        
        profile_char.snp.makeConstraints() { make in
            make.bottom.equalTo(self.textbox.snp.top)
            make.right.equalToSuperview().offset(-111)
        }
        profile_char.isHidden = true
        
        // 선택지
        view.addSubviews(layout_choice, layout_blackView)
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
        label_choicetitle.setChoiceText(choices.title[0], 14, 4, isTitle: true)
        
        btn_choice1.snp.makeConstraints() { make in
            make.width.equalTo(329)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(72)
        }
        btn_choice1.setImage(UIImage(named: "choicebox_normal"), for: .normal)
        btn_choice1.setImage(UIImage(named: "choicebox_touched"), for: .focused)
        btn_choice1.tag = 0
        
        btn_choice1.addSubview(label_btn1)
        label_btn1.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        label_btn1.setChoiceText(choices.choice1[0], 12)
        
        btn_choice2.snp.makeConstraints() { make in
            make.width.equalTo(329)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalTo(btn_choice1.snp.bottom).offset(10)
        }
        btn_choice2.setImage(UIImage(named: "choicebox_normal"), for: .normal)
        btn_choice2.setImage(UIImage(named: "choicebox_touched"), for: .focused)
        btn_choice2.tag = 1
        
        btn_choice2.addSubview(label_btn2)
        label_btn2.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        label_btn2.setChoiceText(choices.choice2[0], 12)
        
        btn_choice3.snp.makeConstraints() { make in
            make.width.equalTo(329)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalTo(btn_choice2.snp.bottom).offset(10)
        }
        btn_choice3.setImage(UIImage(named: "choicebox_normal"), for: .normal)
        btn_choice3.setImage(UIImage(named: "choicebox_touched"), for: .focused)
        btn_choice3.tag = 2
        
        btn_choice3.addSubview(label_btn3)
        label_btn3.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        label_btn3.setChoiceText(choices.choice3[0], 12)
        
    }
}


// MARK: - dialog 데이터
class TalkData_Ch2_part2 {
    var name: String {
        if let appdel = UIApplication.shared.delegate as? AppDelegate {
            return appdel.name
        }
        return "anonymous"
    }
    var lion: [String] = []
    var alpaca: [String] = []
    var player: [String] = []
    var anonymous: [String] = []
    var final: [String] = []
    
    func initTalks() {
        player = ["알파카 대리님 기분이 많이 안좋으신가 침을 너무 뱉네;;", "열심히 일을 하던 도중 옆에서 튀는 물방울로 젖고 있는 우리의 신입사원 \(name)씨...",
                  "앗;; 실수했다..! 어떡하지...","휴.. 다행히 벌써 점심시간이네", "시간이 왜 이렇게 빨리 가지?"]
        lion = ["자~ 슬슬 밥이나 먹으러 갑시다~"]
        alpaca = ["아니 2 + 2가 왜 5가 되냐구요~! 당신 일 처음 해봐?! !@#!@$!@~!~!## "]
        anonymous = ["\(name)씨! 오늘 점심 같이 먹을래요? "]
        final = ["그렇게 \(name)씨는 펭귄의 폭풍질문을 들으며 밥을 먹었다...", "그렇게 \(name)씨는 뱁새의 훈수를 들으며 밥을 먹었다...", "그렇게 \(name)씨는 입사 첫날부터 혼자 점심을 먹었다..."]
    }
}

// MARK: - profile 순서
struct ImgOrderData_Ch2_part2 {
    var lion: [String] = ["lion_laugh"]
    var alpaca: [String] = ["alpaca_fire"]
    var player: [String] = ["suit_awkward", "suit_awkward", "suit_awkward", "suit_lauNawk", "suit_stare"]
    var anonymous: [String] = ["anonymous"]
}

// MARK: - 선택지 데이터
struct ChoiceData_Ch2_part2 {
    let title = ["Q. 침을 너무 많이 뱉는 옆사원 알파카에 대한 내 반응은?", "Q. 입사 후 회사에서 처음 갖는 점심 시간!\n처음으로 함께 점심을 먹을 사원은?"]
    let choice1 = ["불편한 티를 낸다", "너무 활기차서 가끔 기빨리는 귀염둥이 펭귄"]
    let choice2 = ["웃어넘긴다", "현실적인 조언을 주는 젊은 꼰대 뱁새"]
    let choice3 = ["말 없이 알파카 옆에 마스크를 놔준다", "밥을 꼭 같이 먹어야 하나? 난 내 갈 길을 간다"]
    
}

// MARK: - 선택지 반응
struct Response_Ch2_part2 {
    let player_response = [["알파카 대리님 장난하세요? 침으로 샤워하겠어요.", "알파카 대리님 완전 미스트가 따로없네요! 하하!", "(슬쩍)"],
                           ["좋아요 펭귄님 같이 먹어요~ ", "좋아요 뱁새님 같이 먹어요~", "전 혼자 먹을게요~\n이 근처에 혼밥 가능한 맛집이.. 어디보자"]]
    
    let alpaca_response = [["뭐?! 요즘 애들은 너무 자기 할말을 어쩌고 저쩌고 나때는 어쩌고 저쩌고", "뭐?! 신입이 참 긍정적이야 못하는 말이 없어~!;;", "신입 지금 이걸 나한테 쓰라고 주는건가?!"]]
    
    let char_image = [["alpaca_little_fire", "alpaca_little_fire", "alpaca_little_fire"],
                      ["penguin_normal", "bird_normal", ""]]
    let player_image = [["suit_angry", "suit_lauNawk", "suit_normal"],
                        ["suit_laugh", "suit_laugh", "suit_normal"]]
}
