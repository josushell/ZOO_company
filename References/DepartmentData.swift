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
    var deptName: String
    var AnimalType: String
    var userName: String
    var startDate: String
    var gameStat: [Double] = []
    var mlClassificationResult: MLResult
    var prediction: Int
    
    init() {
        if let appdel = UIApplication.shared.delegate as? AppDelegate {
            self.gameStat =  appdel.GameStat
        }
        self.userName = Name().name
        
        self.mlClassificationResult = MLResult()
        self.prediction = self.mlClassificationResult.predictDept()
        
        self.deptName = Department().getDeptStr(prediction)
        //print(deptName)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.startDate = dateFormatter.string(from: Date())
        
        self.AnimalType = Department().getAnimalType(prediction)
        //print(AnimalType)
        
    }
}
