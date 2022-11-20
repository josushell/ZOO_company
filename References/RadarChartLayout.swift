//
//  RadarChartLayout.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/11/20.
//

import Foundation
import UIKit
import SnapKit
import Charts


// MARK: - 레이더 그래프 layout
class layout_RadarChartLayout {
    private let labels = ["A", "B", "C", "D", "E"]
    let data: [Int] = [30, 20, 20, 15, 15]
    
    var radar = RadarChartView()
    var radarEntry: [RadarChartDataEntry] = []
    
    
    func initViews(_ view: UIView) {
        view.addSubview(radar)
        
        // 레이더 차트
        radar.webLineWidth = 1
        radar.innerWebLineWidth = 1
        radar.webColor = .green
        radar.innerWebColor = .blue
        radar.legend.enabled = false

         let xAxis = radar.xAxis
         xAxis.labelFont = UIFont.systemFont(ofSize: 11, weight: .semibold)
         xAxis.xOffset = 0
         xAxis.yOffset = 0
        xAxis.labelTextColor = .black
        xAxis.valueFormatter = self

         let yAxis = radar.yAxis
         yAxis.labelCount = 5
        yAxis.labelFont = UIFont.systemFont(ofSize: 11, weight: .semibold)
        yAxis.labelTextColor = .black
         yAxis.axisMinimum = 0
         yAxis.drawLabelsEnabled = false
        
        let set = RadarChartDataSet(entries: radarEntry, label: nil)
        set.colors = [.systemBlue]
        set.highlightEnabled = false
        set.fillColor = .cyan
        set.fillAlpha = 0.5
        set.drawValuesEnabled = false
        set.drawFilledEnabled = true
        set.lineWidth = 0
        set.drawHighlightCircleEnabled = true
        set.setDrawHighlightIndicators(true)
               
        let datas = RadarChartData(dataSet: set)
        radar.data = datas
    }
}

extension layout_RadarChartLayout: IAxisValueFormatter{
    func stringForValue(_ value: Double, axis: Charts.AxisBase?) -> String {
        return labels[Int(value) % labels.count]
    }
}
