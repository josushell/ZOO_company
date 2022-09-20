//
//  Ch3Data.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import Foundation
import UIKit

// MARK: - CH3 part1

// MARK: - dialog 데이터
class TalkData_Ch3_part1: TalkData {
    var lion: [String] = []
    var player_taskResponse: [String] = []
    
    override init() {
        super.init()
        
        player = ["거의 다 해가는데? 생각보다 할만한걸?!", "난 지금 맡은 업무가 거의 다 끝나가는데... 어떻게 할까?", "", "타닥..타닥...", "흠... 지금 이 업무 방식은 너무 비효율적인데...", "그렇다고 바꾸자니 이 방식이 더 익숙하긴 해... 어떻게 할까?"]
        lion = ["자자 여기 집중! 전달 사항이 있네.", "이번에 우리 팀으로 추가 업무가 배정 됐어.", "다들 지금 업무도 이미 벅찬 걸 알지만 누군가는 맡아서 해줬으면 하는데 말이야.", "여력이 되는 사람 없나?"]
        player_taskResponse = ["좋았어! 나의 능력을 보여주자!", "추가 업무라니. 진짜 망했다...", "추가 업무라니. 진짜 망했다..."]
    }
}

// MARK: - profile 순서
class ImgOrderData_Ch3_part1: ImgOrderData {
    var lion: [String] = []
    var player_taskResponse: [String] = []
    
    override init() {
        super.init()
        
        player = ["suit_normal", "suit_stare", "", "computer_tired", "computer_normal", "computer_normal"]
        lion = ["lion_normal", "lion_normal", "lion_laugh", "lion_normal"]
        player_taskResponse = ["suit_fire", "suit_sad", "suit_sad"]
    }
}

// MARK: - 선택지 데이터
class ChoiceData_Ch3_part1: ChoiceData {
    override init() {
        super.init()
        
        title = ["Q. 우리 팀에 추가 업무가 배정됐다! 어떻게 할까?", "Q. 어떤 방식으로 업무를 진행할까?"]
        choice1 = ["지금이 실력을 보여줄 기회! 내가 한다", "회사의 비효율적인 기존 방식으로 한다"]
        choice2 = ["굳이 나서지 않고 그냥 가만히 있는다", "어렵지만 효율적인 새로운 방식으로 한다"]
        choice3 = ["부장님께서 직접 하시라고 말한다", "주위 동료에게 조언을 구한다"]
    }
}

// MARK: - 선택지 반응
class Response_Ch3_part1: Response {
    var lion_response: [String] = []
    var char_image: [[String]] = [[]]
    
    override init() {
        super.init()
        
        player_response = [["부장님 제가 해내 보이겠습니다!!! 저만 믿고 맡겨주십시오!!", "난 그냥 조용히 하던 거나 해야겠다...", "지금 다들 바빠보이는데... 할 사람 없는 거 같은데요?"], ["괜히 회사가 이 방식을 고수해온 게 아닐거야\n바꾼다고 꼭 더 나아지리란 보장도 없고 그냥 이대로 가자", "언제까지고 이렇게 비효율적으로 일할 수는 없어!\n당장 힘들더라도 새롭게 가보자! 도전!", "역시 이런 건 잘 모르겠어... 일단 땃쥐 님한테 물어보자"]]
        
        lion_response = ["오 그러면 \(name)씨만 믿겠네! 신입의 자세가 아주 훌륭해!", "하여튼 요즘 애들은 열정이 없어! 쯧쯧, \(name)씨 이런 건 신입인 자네가 좀 해!", "그러면 이 건은 수석인 \(name)씨에게 한번 맡겨보겠네."]
        
        char_image = [["lion_laugh", "lion_fire", "lion_laugh"]]
        player_image = [["suit_fire", "suit_awkward", "suit_lauNawk"],
                        ["computer_tired", "computer_normal", "computer_normal"]]
    }
}

// MARK: - CH3 part2

// MARK: - dialog 데이터
class TalkData_Ch3_part2: TalkData {
    override init() {
        super.init()
        
        player = ["하암~~ 피곤하다~~ 벌써 오후 3시네.", "뭐라도 좀 마시고 해야지!", "탕비실에 가볼까?", "흠.. 종류가 많네. 무엇을 마셔볼까?"]
    }
}

// MARK: - profile 순서
class ImgOrderData_Ch3_part2: ImgOrderData {
    override init() {
        super.init()
        
        player = ["suit_tired", "suit_normal", "suit_normal", "suit_stare"]
    }
}

// MARK: - 선택지 데이터
class ChoiceData_Ch3_part2: ChoiceData {
    override init() {
        super.init()
        
        title = ["Q. 탕비실 자판기에 있는 음료들 중 무엇을 마실까?"]
        choice1 = ["에너지 드링크"]
        choice2 = ["초코 우유"]
        choice3 = ["보리차"]
    }
}

// MARK: - 선택지 반응
class Response_Ch3_part2: Response {
    override init() {
        super.init()
        
        player_response = [["이 카페인과 함께라면 야근도 문제 없어! 달려보자!", "역시 피곤할땐 당 충전이지~ 알파카 대리님 것도 뽑아가야지!", "휴~ 역시 보리차가 최고지! 퇴근은 언제쯤 하려나?"]]
        player_image = [["suit_fire", "suit_laugh", "suit_tired"]]
    }
}
