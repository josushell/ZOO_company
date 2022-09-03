//
//  Ch5Data.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/09/02.
//

import Foundation
import UIKit

// MARK: - CH5 part1

// MARK: - dialog 데이터
class TalkData_Ch5_part1: TalkData {
    var penguin: [String] = []
   
    override init() {
        super.init()
        
        player = ["오늘 출근해서 한번도 메일을 못봤네...\n지금이라도 봐야겠다", "어라 땃쥐님께서 메일을 보내셨네?", "확인해볼까?", "벌써 30분 뒤면 회의 시작이잖아?!", "이 프로젝트를 실패하면 우리 회사의 미래는 없어! 반드시 성공해야 해!", "하지만 회사에서 처음 하는 프로젝트 발표라니... 너무 긴장되잖아!", "이럴 때는 뭘 하면 좋을까?", "아 네네! 알겠습니다!!", "좋아 연습한대로만 하는거야!"]
        penguin = ["\(name)씨 지금 대회의실 먼저 가서 미리 준비해야 할 것 같은데요?"]
    }
}

// MARK: - profile 순서
class ImgOrderData_Ch5_part1: ImgOrderData {
    var penguin: [String] = []
    
    override init() {
        super.init()
        
        player = ["computer_normal", "computer_surprise", "computer_surprise", "suit_surprise", "suit_fire", "suit_sad", "suit_sad", "suit_laugh", "suit_fire"]
        penguin = ["penguin_normal"]
    }
}

// MARK: - 선택지 데이터

class ChoiceData_Ch5_part1: ChoiceData {
    override init() {
        super.init()
        
        title = ["Q. 긴장되는 상황 속에서 어떻게 할까?"]
        choice1 = ["청심환을 먹는다"]
        choice2 = ["편안한 노래를 들으며 명상을 한다"]
        choice3 = ["실수하지 않도록 발표 연습을 다시 한다"]
    }
}

// MARK: - 선택지 반응
class Response_Ch5_part1: Response {
    override init() {
        super.init()
        
        player_response = [["역시 긴장 푸는 데에는 청심환이 최고지!\(name) 파이팅!", "일단 클래식을 들으면서 진정해보자...\n휴 마음이 편안해진다~", "이미 연습을 2394183번 정도 했지만 마지막으로 한번만 더 해야겠다\n저 빈 회의실 좀 쓸게요!"]]
        player_image = [["suit_laugh", "suit_laugh", "suit_fire"]]
    }
}


// MARK: - CH5 part2

// MARK: - dialog 데이터
class TalkData_Ch5_part2: TalkData {
    var pigeon: [String] = []
    var penguin: [String] = []
    
    override init() {
        super.init()

        penguin = ["지금부터 저희 부서에서 준비한 프로젝트 초안 발표회 시작하도록 하겠습니다", "먼저 프로젝트 개요에 대한 발표는 저희 부서 \(name) 신입 사원이 진행하도록 하겠습니다"]
        player = ["안녕하십니까! 저는 이번 발표를 맡은 \(name) 사원입니다", "지금부터 프로젝트 발표를 시작하도록 하겠습니다", "....해서 이번 구구테크 프로젝트는 이렇게 진행 될 예정입니다\n다음 그래프를 보시면....", "큰일났다! 사장님 화나신 것 같네", "누구의 생각이라고 해야하지?!", "...이상으로 발표를 마치도록 하겠습니다 감사합니다", "발표에서 궁금한 점들을 질문해주시면 답변해드리도록 하겠습니다", "다들 이렇게나 내 발표에 궁금한 점이 많다고?!\n내가 제대로 한게 맞는건가?", "그건 그렇고 어떤 분의 질문부터 먼저 받아야 할까?"]
        pigeon = ["아니, 잠깐 멈춰보게", "이거 도대체 누가 만든 기획인가!"]

    }
}

// MARK: - profile 순서
class ImgOrderData_Ch5_part2: ImgOrderData {
    var pigeon: [String] = []
    var penguin: [String] = []
    
    override init() {
        super.init()
        
        penguin = ["penguin_normal", "penguin_normal"]
        player = ["suit_laugh", "suit_normal", "suit_normal", "suit_awkward", "suit_awkward", "suit_laugh", "suit_normal", "suit_surprise", "suit_stare"]
        pigeon = ["pigeon_normal", "pigeon_normal"]
    }
}

// MARK: - 선택지 데이터
class ChoiceData_Ch5_part2: ChoiceData {
    override init() {
        super.init()
        
        title = ["Q. 프로젝트의 책임을 묻는 상황에서 어떻게 할까?", "Q. 다들 질문을 하는 상황에서 누구의 질문부터 받을까?"]
        choice1 = ["내 아이디어라고 한다", "제일 먼저 손을 든 뱁새 과장"]
        choice2 = ["다른 사람의 아이디어라고 한다", "쉬운 질문을 할 것 같은 원숭이 사원"]
        choice3 = ["팀 전체의 아이디어라고 한다", "가장 직급이 높은 비둘기 사장"]
    }
}

// MARK: - 선택지 반응
class Response_Ch5_part2: Response {
    var pigeon: [String] = []
    var alpaca: [String] = []
    var alpaca_image: [String] = []
    var pigeon_image: [String] = []
    var char_image: [String] = []
    
    override init() {
        super.init()
        
        player_response = [["제 아이디어입니다... 혹시 무슨 문제라도...?", "알파카 대리님의 아이디어입니다... 혹시 무슨 문제라도...?", "저희 부서가 회의를 통해 생각해낸 아이디어입니다...\n혹시 무슨 문제라도...?", "감사합니다!\n(휴.. 혼나는 줄 알았네)", "이럴줄 알았으면 솔직하게 내가 했다고 말할걸 그랬네...", "감사합니다!\n(휴.. 혼나는 줄 알았네)"], ["그래 역시 이런 건 순서대로 해야 제일 공정하지!", "다른 분들의 질문은 너무 무서워...\n일단 제일 대답하기 쉬운 원숭이 사원의 질문부터 받아야겠다", "역시 이럴 때는 가장 높은 분의 질문부터 먼저 받아야 해!", "가장 먼저 손을 드신 뱁새 과장님 질문부터 받도록 하겠습니다!", "저기 계신 원숭이 사원님 질문부터 받도록 하겠습니다!", "비둘기 사장님의 질문부터 받도록 하겠습니다!"]]
        pigeon = ["당연히 문제있지!\n너무 현실감 없게 잘한 거 아닌가?? 우리 회사에 이런 인재가 있었다니!!", "역시 우리 알파카 대리가 일처리 잘하는 건 내가 잘 알지!\n정말 잘했네!", "역시 이 부서가 일처리 잘하는 건 내가 잘 알지!\n정말 잘했네!"]
        alpaca = ["감사합니다 사장님!"]
        
        alpaca_image = ["alpaca_normal"]
        pigeon_image = ["pigeon_normal", "pigeon_normal", "pigeon_normal"]
        char_image = ["bird_normal", "monkey_normal", "pigeon_normal"]
        player_image = [["suit_awkward", "suit_awkward", "suit_awkward", "suit_lauNawk", "suit_lauNawk", "suit_lauNawk"],
                        ["suit_normal", "suit_normal", "suit_normal", "suit_laugh", "suit_laugh", "suit_laugh"]]
    }
}
