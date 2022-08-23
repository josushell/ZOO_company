//
//  Ch1Data.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import Foundation

// MARK: - dialog 데이터
class TalkData_Ch1_part1: TalkData {
    override init() {
        super.init()
        
        player = ["드디어 기다리고 기다리던 첫 출근이야!", "당장 준비하고 출발해볼까?!", "잠깐! 1시간이나 일찍 일어났잖아?", "흠… 첫 출근에 일찍 일어났네 이제 어떻게 하지?"]
    }
}

// MARK: - profile 순서
class ImgOrderData_Ch1_part1: ImgOrderData{
    override init() {
        super.init()
        
        player = ["sleep_normal", "sleep_stare", "sleep_surprise", "sleep_stare"]
    }
}

// MARK: - 선택지 데이터
class ChoiceData_Ch1_part1: ChoiceData {
    override init() {
        super.init()
        
        title = ["Q.  출근 전 일찍 일어났을 때는 어떻게 할까?"]
        choice1 = ["1시간 일찍 간다"]
        choice2 = ["그냥 더 잔다"]
        choice3 = ["아침밥을 먹는다"]
    }
}

// MARK: - 선택지 반응
class Response_Ch1_part1: Response {
    override init() {
        super.init()
        
        player_response = [["일찍 일어난 새가 벌레를 잡는다고 하지!\n이왕 일찍 일어난 김에 1시간 먼저 나가서 청소도 하고 업무도 미리미리 해야지!", "내가 그렇게 까지 열심히 살아야 해? 일찍 일어나는 새는 일찍 피곤하다.. 더 자야지", "첫 출근이니까 완벽하게 준비를 해야지. 아침밥 먹고 힘내서 출근하자! "]]
        player_image = [["sleep_fire", "sleep_tired", "sleep_normal"]]
    }
}


// MARK: - dialog 데이터
class TalkData_Ch1_part2: TalkData {
    override init() {
        super.init()
        
        player = ["휴... 다행히 제 시간에 탔네\n제 시간에 내리기만 하면 늦진 않겠어!", "이번 역은 주 컴퍼니역입니다. 내리실 문은 왼쪽입니다", "벌써 도착이잖아!", "내려야 하는데... 사람이 왜 이리 많아!", "안돼 첫 날부터 늦을 수는 없어 어떻게든 여기서 나가야만 해!"]
    }
}

// MARK: - profile 순서
class ImgOrderData_Ch1_part2: ImgOrderData {
    override init() {
        super.init()
        
        player = ["suit_normal", "suit_normal", "suit_surprise", "suit_awkward", "suit_fire"]
    }
}

// MARK: - temp 선택지 데이터
class ChoiceData_Ch1_empty: ChoiceData {
    override init() {
        super.init()
        
        title = [""]
        choice1 = [""]
        choice2 = [""]
        choice3 = [""]
    }
}

class Response_Ch1_part3: Response {
    override init() {
        super.init()

        player_response = [["후 간신히 내렸네.. 역시 출근길 9호선 급행은 지옥이야", "헐 5분 밖에 안 남았잖아 이럴 시간이 없어 빨리 가자!"], ["결국 늦어버렸어... 하지만 첫날이니까 짤리지는 않겠지...?", "어쨌든 빨리 뛰어 가자!"]]
        player_image = [["suit_normal", "suit_surprise"], ["suit_sad", "suit_fire"]]
    }
}
