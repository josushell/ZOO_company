//
//  Ch4Data.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import Foundation
import UIKit

// MARK: - CH4 part1

// MARK: - dialog 데이터
class TalkData_Ch4_part1: TalkData {
    var bat: [String] = []
    var mouse: [String] = []
    
    override init() {
        super.init()
        
        player = ["정신없이 근무를 하던 중...", "벌써 퇴근시간이 지났네. 다들 집에 안가시나?", "아니 이분은 초엘리트 구구대 수석 졸업 박사 출신 박쥐 이사님이잖아?!", "헉 안녕하십니까!", "와! 감사합니다!", "내가 박쥐 이사님과 대화를 했다니...! 좋아 완벽히 해내겠어!", "네 지금 바로 보내드릴게요!", "앗 아까 졸면서 모르고 백 스페이스를 계속 눌러버렸잖아?!", "파일이 다 사라져버렸어! 어떡하지?"]
        bat = ["이번에 새로 오셨다는 \(name)씨?"]
        mouse = ["\(name)씨! 프로젝트 발표 준비 다 끝냈다면서요?", "수고하셨어요! 저한테도 메일로 발표 자료 보내주세요."]
    }
}

// MARK: - profile 순서
class ImgOrderData_Ch4_part1: ImgOrderData {
    var bat: [String] = []
    var mouse: [String] = []
    
    override init() {
        super.init()
        
        mouse = ["mouse_normal", "mouse_laugh"]
        player = ["", "suit_normal", "suit_surprise", "suit_surprise", "suit_laugh", "suit_fire", "suit_laugh", "suit_surprise", "suit_sad"]
        bat = ["bat_normal"]
    }
}

// MARK: - 선택지 데이터

class ChoiceData_Ch4_part1: ChoiceData {
    override init() {
        super.init()
        
        title = ["Q. 이때 박쥐 상사에게 듣고 싶은 말은?", "Q. 실수를 했을 때 어떻게 할까?"]
        choice1 = ["성과에 대한 칭찬", "최대한 기억나는 부분만이라도 복구한다"]
        choice2 = ["노력에 대한 칭찬", "솔직하게 실수를 말하고 다시 처음부터 만든다"]
        choice3 = ["현실적인 피드백과 조언", "당장 보내야 하니 대충 다시 해서 제출한다"]
    }
}

// MARK: - 선택지 반응
class Response_Ch4_part1: Response {
    var bat_response: [[String]] = [[]]
    var char_image: [[String]] = [[]]

    override init() {
        super.init()
        
        player_response = [["후... 일단 기억을 더듬어서 최대한 복구해보자!", "땃쥐님 정말 죄송하지만 착오가 생겨서... 다시 해야될 것 같습니다ㅠㅠ", "이걸 또 처음부터 하라고? 피곤한데 그냥 했던 부분을 요약해서 보내드리자."]]
        
        bat_response = [["\(name)씨 벌써 다 끝내셨어요? 결과물 보니 첫날인데도 잘하신 것 같네요.", "\(name)씨 첫날부터 야근이라니 정말 열심히 하시네요.\n열정이 느껴져서 좋아요.", "음... 이 부분은 자료 줄테니까 다른 방식으로 해서 올려볼래요?"]]
        
        char_image = [["bat_laugh", "bat_laugh", "bat_normal"]]
        player_image = [["suit_normal", "suit_awkward", "suit_tired"]]
    }
}


// MARK: - CH4 part2

// MARK: - dialog 데이터
class TalkData_Ch4_part2: TalkData {
    var pigeon: [String] = []
    
    override init() {
        super.init()

        player = ["휴... 간신히 다 했다.", "잠시만, 벌써 새벽 1시? 집에는 언제 가지..", "으악!! 깜짝이야!!! 누구세요?!", "엇 비둘기 사장님?"]
        pigeon = ["\(name)씨 늦은 시간까지 고생이 많네요.", "오늘까지 발표 준비 마무리해서 다행이에요.", "내일 발표 기대할게요."]
    }
}

// MARK: - profile 순서
class ImgOrderData_Ch4_part2: ImgOrderData {
    var pigeon: [String] = []
    
    override init() {
        super.init()
        
        player = ["suit_tired", "suit_awkward", "suit_surprise", "suit_normal"]
        pigeon = ["pigeon_normal", "pigeon_normal", "pigeon_normal"]
    }
}

// MARK: - 선택지 데이터
class ChoiceData_Ch4_part2: ChoiceData {
    override init() {
        super.init()
        
        title = ["Q. 비둘기 사장에 대한 나의 반응은?"]
        choice1 = ["자신감을 갖는다"]
        choice2 = ["걱정을 한다"]
        choice3 = ["감사한 척 한다"]
    }
}

// MARK: - 선택지 반응
class Response_Ch4_part2: Response {
    override init() {
        super.init()
        
        player_response = [["감사합니다. 내일 발표 잘 해내겠습니다!", "감사합니다! (기대라니... 내가 잘 할 수 있을까?)", "감사합니다! (첫 날부터 야근이라니 이 미친 회사... 빨리 퇴사해야지.)"]]
        player_image = [["suit_laugh", "suit_laugh", "suit_lauNawk"]]
    }
}
