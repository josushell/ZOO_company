//
//  EndingData.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/09/21.
//

import Foundation
import UIKit

// MARK: - Ending part1

// MARK: - dialog 데이터
class TalkData_Ending: TalkData {
    override init() {
        super.init()

        player = ["그렇게 우리의 신입사원 \(name)씨는 첫 발표를 성공적으로 마쳤다.", "실수도 많았지만 \(name)씨는 이 경험을 바탕으로 회사 생활을 더 잘해낼 것이다.", "많은 일들이 있었지만, 앞으로의 회사 생활은 더 만만치 않을 것이다.", "그리고 오늘은 대망의 신입 부서 배치되는 날! \(name)씨의 밝은 미래를 응원하며...."]
    }
}

// MARK: - 선택지 데이터
class ChoiceData_Ending: ChoiceData {
    override init() {
        super.init()
        
        title = [""]
        choice1 = [""]
        choice2 = [""]
        choice3 = [""]
    }
}
