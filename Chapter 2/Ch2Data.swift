//
//  Ch2Data.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import Foundation
import UIKit

// MARK: - dialog 데이터
class TalkData_Ch2_part1: TalkData {
    var lion: [String] = []
    var mouse: [String] = []
    
    override init() {
        super.init()
        
        player = [ "여기가 사무실인가..!",
                   "내 자리는 어디지?"
        ]
        
        lion = ["\(name)씨 어서 와요! 우리 구구테크에 온걸 환영해요!",
                "이번에 우리 구구테크에서 아주 큰 프로젝트가 진행되고 있는 건 알죠?",
                "뭐 그래도 내 지휘에 따르면 대성공일테니 걱정하지 말어요 허허 ^^",
                 "너무 부담 갖지는 말고 이번 프로젝트 잘 부탁해요~",
                "앞으로 궁금하거나 필요한 게 있으면 언제든 땃쥐 사원에게 물어봐요~"
                ]
        
        mouse = ["안녕하세요! 함께 하게 된 땃쥐입니다~! \(name)씨 자리는 여기에요!",
                 "왼쪽 자리는 알파카 대리님이에요!\n평소에는 좋은 분이지만 본인 기분이 안 좋으면 침을 자주 뱉으니 조심하세요",
                 "앗? 저기에 \(name)씨와 함께 입사한 동기분이 계시네요!"
                 ]
    }
}

// MARK: - profile 순서
class ImgOrderData_Ch2_part1: ImgOrderData {
    var lion: [String] = []
    var mouse: [String] = []
    
    override init() {
        super.init()
        
        lion = ["lion_laugh", "lion_normal", "lion_laugh", "lion_normal", "lion_laugh"]
        mouse = ["mouse_normal", "mouse_normal", "mouse_normal"]
        player = ["suit_shy", "suit_stare"]
    }
}

// MARK: - 선택지 데이터
class ChoiceData_Ch2_part1: ChoiceData {
    override init() {
        super.init()
        
        title = ["Q. 첫 출근을 하게 된 주인공 같이 입사한 동기 사원은 누구일까?"]
        choice1 = ["속도는 느리지만 일 처리 확실한 나무늘보"]
        choice2 = ["인사성 밝고 친화력 좋은 인싸 원숭이"]
        choice3 = ["딱 봐도 초 엘리트! 스펙왕 개미"]
        
    }
}

// MARK: - 선택지 반응
class Response_Ch2_part1: Response {
    var char_response: [String] = []
    var label_nametag: [String] = []
    var char_image: [String] = []
    var minimi_image: [String] = []
    
    override init() {
        super.init()
        
        player_response = [["뭔가 느리지만 그래도 좋은 사람같아~", "약간 부담스럽지만 그래도 좋은 사람같아..ENFP일까?", "앗.. 내 인사를 무시했네.. 좀 차갑지만 그래도 좋은 사람같아~"]]
        char_response = ["친....하게....지내보..아요..", "만나서 반가워요! 저희 잘 지내봐요~ 파이팅 파이팅!", "(꾸벅)"]
        label_nametag = ["늘보 사원", "원숭 사원", "개미 사원"]
        char_image = ["sloth_normal", "monkey_normal", "ant_normal"]
        minimi_image = ["minimi_sloth", "minimi_monkey", "minimi_ant"]
        player_image = [["suit_laugh", "suit_laugh", "suit_laugh"]]
        
    }
}

// MARK: - dialog 데이터
class TalkData_Ch2_part2: TalkData {
    var lion: [String] = []
    var alpaca: [String] = []
    var anonymous: [String] = []
    var final: [String] = []
    
    override init() {
        super.init()
        
        player = ["알파카 대리님 기분이 많이 안좋으신가 침을 너무 뱉네;;", "열심히 일을 하던 도중 옆에서 튀는 물방울로 젖고 있는 우리의 신입사원 \(name)씨...",
                  "앗;; 실수했다..! 어떡하지...","휴.. 다행히 벌써 점심시간이네", "시간이 왜 이렇게 빨리 가지?"]
        lion = ["자~ 슬슬 밥이나 먹으러 갑시다~"]
        alpaca = ["아니 2 + 2가 왜 5가 되냐구요~! 당신 일 처음 해봐?! !@#!@$!@~!~!## "]
        anonymous = ["\(name)씨! 오늘 점심 같이 먹을래요? "]
        final = ["그렇게 \(name)씨는 펭귄에게 PT를 권유받으며 밥을 먹었다...", "그렇게 \(name)씨는 뱁새의 훈수를 들으며 밥을 먹었다...", "그렇게 \(name)씨는 입사 첫날부터 혼자 점심을 먹었다..."]
    }
}

// MARK: - profile 순서
class ImgOrderData_Ch2_part2: ImgOrderData {
    var lion: [String] = []
    var alpaca: [String] = []
    var anonymous: [String] = []
    
    override init() {
        super.init()
        
        player = ["suit_awkward", "suit_awkward", "suit_awkward", "suit_lauNawk", "suit_stare"]
        lion = ["lion_laugh"]
        alpaca = ["alpaca_fire"]
        anonymous = ["anonymous"]
        
    }
}

// MARK: - 선택지 데이터
class ChoiceData_Ch2_part2 : ChoiceData {
    override init() {
        super.init()
        
        title = ["Q. 침을 너무 많이 뱉는 옆사원 알파카에 대한 내 반응은?", "Q. 입사 후 회사에서 처음 갖는 점심 시간!\n처음으로 함께 점심을 먹을 사원은?"]
        choice1 = ["불편한 티를 낸다", "너무 활기차서 가끔 기빨리는 펭귄"]
        choice2 = ["웃어넘긴다", "현실적인 조언을 주는 뱁새"]
        choice3 = ["말 없이 알파카 옆에 마스크를 놔준다", "밥을 꼭 같이 먹어야 하나? 난 내 갈 길을 간다"]
    }
}

// MARK: - 선택지 반응
class Response_Ch2_part2: Response {
    var alpaca_response: [[String]] = [[]]
    var char_image: [[String]] = [[]]
    
    override init() {
        super.init()
        
        player_response = [["알파카 대리님 장난하세요? 침으로 샤워하겠어요.", "알파카 대리님 완전 미스트가 따로없네요! 하하!", "(슬쩍)"],
                               ["좋아요 펭귄님 같이 먹어요~ ", "좋아요 뱁새님 같이 먹어요~", "전 혼자 먹을게요~\n이 근처에 혼밥 가능한 맛집이.. 어디보자"]]
        alpaca_response = [["뭐?! 하여튼 요즘 애들은 너무 자기 할말을 막 한다니까?! 나때는 어쩌고 저쩌고~ %$!@#!$$", "뭐?! 신입이 참 긍정적이야 못하는 말이 없어~!;;", "신입 지금 이걸 나한테 쓰라고 주는건가?!"]]
        
        char_image = [["alpaca_little_fire", "alpaca_little_fire", "alpaca_little_fire"],
                          ["penguin_normal", "bird_normal", ""]]
        player_image = [["suit_angry", "suit_lauNawk", "suit_normal"],
                            ["suit_laugh", "suit_laugh", "suit_normal"]]
    }
}
