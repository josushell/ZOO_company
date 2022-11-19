//
//  MLResult.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/11/12.
//

import Foundation
import UIKit
import CoreML

// coreML classification ML import
class MLResult {
    let config = MLModelConfiguration()
    var model: ResultDeptClassification_2?
    var result: [Double] = []
    
    func predictDept() -> Int {
        do {
            model = try ResultDeptClassification_2(configuration: config)
        }
        catch {
            // todo: error 처리
        }
        
        // 사용자 선택지 가져오기
        if let appdel = UIApplication.shared.delegate as? AppDelegate {
            self.result = appdel.GameStat
        }
        
        // ML 예측
        guard let predict = try? model?.prediction(M: result[GameStats.Mental.rawValue], r: result[GameStats.Relationship.rawValue], d: result[GameStats.Diligent.rawValue], e: result[GameStats.Efficiency.rawValue], p: result[GameStats.Passion.rawValue]) else {
            return -1 // error
        }
        return Int(predict.dept)
    }
}
