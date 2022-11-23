//
//  DepartmentData.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/11/18.
//

import Foundation
import UIKit

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
