//
//  BarChartLayout.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/11/19.
//

import Foundation
import UIKit
import SnapKit
import Charts


// MARK: - 바 그래프 layout
class layout_BarChartLayout {
    let layout_bar = HorizontalBarChartView()
    var chartEntry: [BarChartDataEntry] = []
    let label_left = UILabel()
    
    func initViews(_ view: UIView) {
        view.addSubviews(label_left, layout_bar)
        layout_bar.snp.makeConstraints() { make in
            make.width.equalTo(200)
            make.height.equalTo(150)
            make.centerY.equalToSuperview()
            make.leading.equalTo(label_left.snp.trailing).offset(5)
        }
        setBarAttribute()
        
        label_left.snp.makeConstraints() { make in
            make.top.equalTo(layout_bar.snp.top)
            make.bottom.equalTo(layout_bar.snp.bottom)
            make.width.equalTo(50)
            make.leading.equalToSuperview().offset(10)
        }
        let str = "정신력\n인간관계\n도전의식\n효율성\n열정"
        label_left.setTextAttribute(str, 12, 12, .black)
        label_left.textAlignment = .right
    }
    
    func setBarAttribute(data: [Int] = [4, 1, 2, 3, 4]) {
        // chart data array 에 데이터 추가
        for i in 0..<data.count {
            let value = BarChartDataEntry(x: Double(data.count - i), y: Double(data[i]))
               chartEntry.append(value)
        }
       
        layout_bar.noDataText = "데이터가 없습니다."
        layout_bar.noDataFont = .systemFont(ofSize: 20)
        layout_bar.noDataTextColor = .lightGray
       // 줌 안되게
        layout_bar.doubleTapToZoomEnabled = false
       
       // 애니메이션
        layout_bar.animate(xAxisDuration: 0, yAxisDuration: 5, easingOptionX: .linear, easingOptionY: .easeOutCirc)
       
        layout_bar.leftAxis.enabled = false
        layout_bar.rightAxis.enabled = false
        layout_bar.leftAxis.axisMinimum = 0
        layout_bar.legend.enabled = false

        layout_bar.xAxis.drawLabelsEnabled = false
        layout_bar.xAxis.drawGridLinesEnabled = false
        layout_bar.xAxis.drawAxisLineEnabled = false
        layout_bar.drawBarShadowEnabled = true

       
        let chartset = BarChartDataSet(entries: chartEntry, label: nil)
        chartset.colors = [.referenceBlueBold]
        chartset.highlightEnabled = false
        chartset.drawValuesEnabled = false
        chartset.barShadowColor = .referenceBlue
    
        let data = BarChartData(dataSet: chartset)
        layout_bar.data = data
    }
}
