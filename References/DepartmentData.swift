//
//  DepartmentData.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/11/18.
//

import Foundation
import UIKit

// MARK: - 결과 부서 데이터 클래스
// 유저 이름, 부서 이름, 능력치(백분율), 입사일(플레이 시간), 게임 분류 결과
class DepartmentData {
    var animalType: AnimalType
    var startDate: String
    var gameStat: [Int] = []
    var mlClassificationResult: MLResult
    var prediction: Int
    
    init() {
        self.mlClassificationResult = MLResult()
        self.prediction = self.mlClassificationResult.predictDept()
        
        self.animalType = Department().getAnimalType(prediction)
     
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.startDate = dateFormatter.string(from: Date())
        
        var newStat: [Double] = []
        if let appdel = UIApplication.shared.delegate as? AppDelegate {
            newStat =  appdel.GameStat
        }
        for stat in newStat {
            let value = Int((stat / 13) * 100)
            self.gameStat.append(value)
        }
    }
}
