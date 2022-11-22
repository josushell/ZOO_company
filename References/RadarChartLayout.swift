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
    private let labels = ["정신력", "인간관계", "도전의식", "효율성", "열정"]
    var radar = RadarChartView()
    var radarEntry: [RadarChartDataEntry] = []
    
    // 반시계
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    let label4 = UILabel()
    let label5 = UILabel()
    
    func initViews(_ view: UIView) {
        view.addSubviews(radar,label1,label2,label3,label4,label5)
        
        radar.snp.makeConstraints() { make in
            make.centerX.equalToSuperview().offset(-7)
            make.centerY.equalToSuperview().offset(10)
            make.size.equalTo(120)
        }
        
        label1.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalTo(radar)
        }
        label1.setTextAttribute("정신력", 11, 8, .black)
        
        label2.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(59)
            make.leading.equalToSuperview().offset(12)
        }
        label2.setTextAttribute("열정", 11, 8, .black)
        
        label3.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(135)
            make.leading.equalToSuperview().offset(22)
        }
        label3.setTextAttribute("효율성", 11, 8, .black)
        
        label4.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(135)
            make.leading.equalToSuperview().offset(127)
        }
        label4.setTextAttribute("도전의식", 11, 8, .black)
        
        label5.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(59)
            make.leading.equalToSuperview().offset(146)
        }
        label5.setTextAttribute("인간관계", 11, 8, .black)
        // 레이더 차트
        radar.webLineWidth = 1
        radar.innerWebLineWidth = 2
        radar.webColor = .clear
        radar.innerWebColor = .referenceBlueBold
        radar.legend.enabled = false
        radar.rotationEnabled = false
        
        radar.animate(xAxisDuration: 0, yAxisDuration: 5, easingOption: .easeOutCirc)

        let xAxis = radar.xAxis
        xAxis.enabled = false
        xAxis.labelTextColor = .black
        xAxis.labelFont = UIFont(name: "NeoDunggeunmo-Regular", size: 9)!
        xAxis.valueFormatter = self
        
         let yAxis = radar.yAxis
        yAxis.labelCount = 4
         yAxis.axisMinimum = 0
         yAxis.drawLabelsEnabled = false
    }
    
    func setRadarAttribute(data: [Int] = [30, 20, 20, 15, 15]) {
        // chart data array 에 데이터 추가
        for i in 0..<data.count {
            let value = RadarChartDataEntry(value: Double(data[i]))
            radarEntry.append(value)
        }
        
        let set = RadarChartDataSet(entries: radarEntry, label: nil)
        set.colors = [.radarBlueBold]
        set.fillColor = .radarBlue
        set.fillAlpha = 0.7
        set.drawValuesEnabled = false
        set.drawFilledEnabled = true
        set.lineWidth = 1
        
        set.highlightCircleStrokeColor = .white
        set.drawHighlightCircleEnabled = true
        set.highlightCircleStrokeWidth =  5
        set.highlightCircleFillColor = .white
        set.highlightCircleOuterRadius = 4
        set.highlightCircleInnerRadius = 4
        set.highlightCircleStrokeAlpha = 1
               
        let datas = RadarChartData(dataSet: set)
        radar.data = datas
    }
}

extension layout_RadarChartLayout: IAxisValueFormatter{
    func stringForValue(_ value: Double, axis: Charts.AxisBase?) -> String {
        return labels[Int(value) % labels.count]
    }
}
