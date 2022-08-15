//
//  Ch2ViewController.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/08/07.
//

import UIKit
import SnapKit


class Ch2Part1ViewController: UIViewController {
    
    let layout = layout_Office()
    var selected: Bool = false
    var minimi_lion: Bool = false
    var minimi_mouse: Bool = false
    var select_index: Int = 0
    var tapGesture: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.initView(self.view)
        
        // 3초 뒤 실행
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            UIView.animate(withDuration: 0.8, delay: 0, options: .curveLinear ,animations: {
                self.layout.minimi_player.transform = CGAffineTransform(translationX: 0, y: 66)
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
        print("\(sender.tag)")
        select_index = sender.tag
        selected = true
        layout.layout_choice.isHidden = true
        
        self.layout.backView.isUserInteractionEnabled = false
        self.layout.minimi_response.isHidden = false
        self.layout.minimi_response.image = UIImage(named: self.layout.response.minimi_image[self.select_index])
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveLinear  ,animations: {
            self.layout.minimi_response.transform = CGAffineTransform(translationX: 0, y: 70)
        }, completion: { _ in
            self.layout.backView.isUserInteractionEnabled = true
            
            self.layout.text_nametag.text = self.layout.response.label_nametag[self.select_index]
            self.layout.text.text = self.layout.response.char_response[self.select_index]
            self.layout.profile_char.image = UIImage(named: self.layout.response.char_image[self.select_index])
        })
        
    }
    
    @objc func backTouched(_ sender: UITapGestureRecognizer) {
        print("tap")
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
                else if (layout.talkIndex[1] < layout.talks.lion.count) {
                    
                    if (!minimi_lion) {
                        self.layout.backView.isUserInteractionEnabled = false
                        self.layout.minimi_lion.isHidden = false
                        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear  ,animations: {
                            self.layout.minimi_lion.transform = CGAffineTransform(translationX: 0, y: 130)
                        }, completion: { _ in
                            self.layout.minimi_lion.image = UIImage(named: "minimi_lion_left")
                            self.minimi_lion = true
                            self.layout.backView.isUserInteractionEnabled = true
                        })
                    }
                    else {
                        self.layout.profile_char.isHidden = false
                        self.layout.img_nametag.isHidden = false
                        self.layout.profile_player.image = UIImage(named: "suit_normal")
                        self.layout.text_nametag.text = "사자 부장"
                        self.layout.text.text = layout.talks.lion[layout.talkIndex[1]]
                        self.layout.profile_char.image = UIImage(named: layout.profileOrder.lion[layout.talkIndex[1]])
                        layout.talkIndex[1] += 1
                    }

                }
                else if (layout.talkIndex[2] < layout.talks.mouse.count) {
                    if (!minimi_mouse) {
                        self.layout.backView.isUserInteractionEnabled = false
                        self.layout.minimi_mouse.isHidden = false
                        UIView.animate(withDuration: 0.7, delay: 0, options: .curveLinear  ,animations: {
                            self.layout.minimi_mouse.transform = CGAffineTransform(translationX: 0, y: 60)
                        }, completion: { _ in
                            self.layout.minimi_mouse.image = UIImage(named: "minimi_mouse_left")
                            UIView.animate(withDuration: 0.7, delay: 0, options: .curveLinear, animations: {
                                self.layout.minimi_mouse.transform = CGAffineTransform(translationX: 50, y: 60)
                            }, completion: { _ in
                                self.minimi_mouse = true
                                self.layout.backView.isUserInteractionEnabled = true
                            })
                        })
                    }
                    else {
                        self.layout.text_nametag.text = "땃쥐 사원"
                        self.layout.text.text = layout.talks.mouse[layout.talkIndex[2]]
                        self.layout.profile_char.image = UIImage(named: layout.profileOrder.mouse[layout.talkIndex[2]])
                        layout.talkIndex[2] += 1
                    }

                }
                // 선택지 등장
                else {
                    layout.layout_choice.isHidden = false
                    let blackView = UIView()
                    let
                }
            }
        }
        
        // 선택지 후
        else {
            self.layout.img_nametag.isHidden = true
            self.layout.text.text = layout.response.player_response[self.select_index]
            self.layout.profile_player.image = UIImage(named: layout.response.player_image[self.select_index])
            
            //MARK: - fade in fade out
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                //self.view?.window?.rootViewController?.dissmissAndPresent(SubwayViewController(), animated: true, completion: nil)
                self.presentFull(Ch2Part2ViewController(), animated: true, completion: nil)
            }
        }
    }
    
}
// MARK: - 사무실 layout
class layout_Office {
    let vs = viewSize()
    
    let backView = UIView()
    let backgroundImg = UIImageView()
    let profile_player = UIImageView()
    let profile_char = UIImageView()
    
    let minimi_player = UIImageView()
    let minimi_lion = UIImageView()
    let minimi_mouse = UIImageView()
    let minimi_response = UIImageView()
    
    let textbox = UIImageView()
    let text = UILabel()
    let img_nametag = UIImageView()
    let text_nametag = UILabel()
    
    let talks = TalkData_Ch2_part1()
    let profileOrder = ImgOrderData_Ch2_part1()
    var talkIndex: [Int] = [0, 0, 0]
    
    let layout_choice = UIView()
    let choiceView = UIImageView()
    let label_choicetitle = UILabel()
    let btn_choice1 = UIButton()
    let btn_choice2 = UIButton()
    let btn_choice3 = UIButton()
    let choices = ChoiceData_Ch2_part1()
    let response = Response_Ch2_part1()
    
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
        backgroundImg.image = UIImage(named: "office_off")
        
        
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
        text_nametag.textColor = .white
        text_nametag.textAlignment = .center
        text_nametag.font = UIFont(name: "NeoDunggeunmo-Regular", size: 11)
        text_nametag.layer.zPosition = 999
        
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
        
        // minimi 설정
        view.addSubviews(minimi_player, minimi_lion, minimi_mouse, minimi_response)
        minimi_player.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top).offset(81)
            make.centerX.equalTo(backgroundImg.snp.centerX)
        }
        minimi_player.image = UIImage(named: "minimi_player_suit")
        
        minimi_lion.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top).offset(26)
            make.leading.equalTo(backgroundImg.snp.leading).offset(240)
        }
        minimi_lion.image = UIImage(named: "minimi_lion_front")
        minimi_lion.isHidden = true
        
        minimi_mouse.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top).offset(26)
            make.leading.equalTo(backgroundImg.snp.leading).offset(240)
        }
        minimi_mouse.image = UIImage(named: "minimi_mouse_front")
        minimi_mouse.isHidden = true
        
        minimi_response.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top).offset(68)
            make.leading.equalTo(backgroundImg.snp.leading).offset(440)
        }
        minimi_response.isHidden = true
        
        // 선택지
        view.addSubview(layout_choice)
        layout_choice.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top)
            make.width.equalTo(445)
            make.bottom.equalTo(self.textbox.snp.top)
            make.centerX.equalToSuperview()
        }
        layout_choice.isHidden = true

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
class TalkData_Ch2_part1 {
    var name: String {
        if let appdel = UIApplication.shared.delegate as? AppDelegate {
            return appdel.name
        }
        return "anonymous"
    }
    var lion: [String] = []
    var mouse: [String] = []
    var player: [String] = []
    
    func initTalks() {
        player = [ "여기가 사무실인가..!",
                   "내 자리는 어디지?"
        ]
        
        lion = ["\(name)씨 어서 와요! 우리 구구테크에 온걸 환영해요!",
                "이번에 우리 구구테크에서 아주 큰 프로젝트가 진행되고 있는 건 알죠?",
                "뭐 그래도 내 지휘에 따르면 대성공일테니 걱정하지 말어요 허허 ^^",
                 "너무 부담 갖지는 말고 이번 프로젝트 잘 부탁해요~",
                "앞으로 궁금하거나 필요한 게 있으면 언제든 땃쥐 사원에게 물어봐요~"
                ]
        
        mouse = ["안녕하세요! 함께 하게 된 땃쥐입니다~! OO씨 자리는 여기에요!",
                 "왼쪽 자리는 알파카 대리님이에요!\n평소에는 좋은 분인데 본인 기분이 안 좋으면 침을 자주 뱉으니 조심하세요",
                 "앗? 저기에 \(name)씨와 함께 입사한 동기분이 계시네요!"
                 ] 
    }
}

// MARK: - profile 순서
struct ImgOrderData_Ch2_part1 {
    var lion: [String] = ["lion_laugh", "lion_normal", "lion_laugh", "lion_normal", "lion_laugh"]
    var mouse: [String] = ["mouse_normal", "mouse_normal", "mouse_normal"]
    var player: [String] = ["suit_shy", "suit_stare"]
}

// MARK: - 선택지 데이터
struct ChoiceData_Ch2_part1 {
    let title = "Q. 첫 출근을 하게 된 주인공 같이 입사한 동기 사원은 누구일까?"
    let choice1 = "속도는 느리지만 일 처리 확실한 나무늘보"
    let choice2 = "인사성 밝고 친화력 좋은 인싸 원숭이"
    let choice3 = "딱 봐도 초 엘리트! 스펙왕 개미"
    
}

// MARK: - 선택지 반응
struct Response_Ch2_part1 {
    let player_response = ["뭔가 느리지만 좋은 사람같아~", "약간 부담스럽지만 좋은 사람같아..ENFP일까?", "앗.. 내 인사를 무시했네..좀 차갑지만 그래도 좋은 사람같아~"]
    let char_response = ["친....하게....지내보..아요..", "만나서 반가워요! 저희 잘 지내봐요~ 파이팅 파이팅!", "(꾸벅)"]
    let label_nametag = ["늘보 사원", "원숭 사원", "개미 사원"]
    let char_image = ["sloth_normal", "monkey_normal", "ant_normal"]
    let player_image = ["suit_laugh", "suit_laugh", "suit_laugh"]
    let minimi_image = ["minimi_sloth", "minimi_monkey", "minimi_ant"]
}
