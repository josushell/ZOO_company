//
//  ReferenceLayout.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/11/09.
//

import Foundation
import UIKit
import SnapKit
import Charts

// MARK: - Reference layout:
class layout_reference {
    let layout_scroll = UIScrollView()
    let layout_main = UIView()

    let layout_profile = UIImageView()
    let layout_name = UIView()

    let layout_bargraph = UIView()
    let barGraph = layout_BarChartLayout()
    
    let layout_radergraph = UIView()
    let radarGraph = layout_RadarChartLayout()
    
    let layout_explain = UIView()

    let layout_goodDept = UIImageView()
    let layout_badDept = UIImageView()
    let layout_goodname = UIView()
    let layout_badname = UIView()

    let layout_maskingRader = UIImageView()
    let layout_maskingBar = UIImageView()
    let layout_maskingExplain = UIImageView()
    let layout_maskingGood = UIImageView()
    let layout_maskingBad = UIImageView()
    
    let layout_doodleBad = UIImageView()
    let layout_doodleGood = UIImageView()
    
    let btn_next = UIImageView()
    let layout_stamp = UIImageView()
    
    let label_dept = UILabel()
    let label_explain = UILabel()
    let label_goodDept = UILabel()
    let label_badDept = UILabel()
    let label_lion = UILabel()
    
    let label_postitGood = UILabel()
    let label_postitBad = UILabel()
    
    let vs = ViewSize()
    let fs = FrameSize()

    func initViews(_ view: UIView) {
        view.backgroundColor = .referenceBlue
        
        // auto layout 적용
        layout_scroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(layout_scroll)
        layout_scroll.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        layout_scroll.frameLayoutGuide.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        layout_scroll.showsHorizontalScrollIndicator = true
        layout_scroll.isDirectionalLockEnabled = true
        //layout_scroll.alwaysBounceVertical = true
        
        layout_scroll.addSubview(layout_main)
        layout_main.snp.makeConstraints() { make in
            make.top.leading.trailing.bottom.equalTo(layout_scroll.contentLayoutGuide)
            make.height.equalTo(780)
            make.width.equalTo(845)
        }
        layout_main.layer.zPosition = layout_scroll.layer.zPosition + 1
        layout_main.backgroundColor = .referenceBlue
        
        layout_main.addSubviews(layout_profile, layout_bargraph, layout_radergraph, layout_explain, layout_goodDept, layout_badDept, layout_goodname, layout_badname, layout_name)
        layout_main.addSubviews(layout_maskingRader, layout_maskingBar, layout_maskingExplain, layout_maskingGood, layout_maskingBad)
        layout_main.addSubviews(layout_doodleBad, layout_doodleGood)
        layout_scroll.addSubviews(btn_next, layout_stamp)
        
        layout_profile.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(33)
            make.leading.equalToSuperview().offset(48)
            make.height.equalTo(260)
            make.width.equalTo(245)
        }
        layout_profile.image = UIImage(named: "team_hr")
        setBlueShadow(layout_profile)
        
        layout_name.snp.makeConstraints() { make in
            make.leading.width.equalTo(layout_profile)
            make.top.equalTo(layout_profile.snp.bottom).offset(18)
            make.height.equalTo(45)
        }
        layout_name.backgroundColor = .white
        setBlueShadow(layout_name)
        
        layout_name.addSubview(label_dept)
        label_dept.snp.makeConstraints() { make in
            make.center.equalToSuperview()
            make.width.lessThanOrEqualTo(240)
        }
        label_dept.setTextAttribute("", 24, 8, .black)
        label_dept.lineBreakMode = .byTruncatingTail
        
        layout_maskingRader.snp.makeConstraints() { make in
            make.top.equalTo(layout_profile.snp.top)
            make.leading.equalTo(layout_profile.snp.trailing).offset(30)
            make.width.equalTo(94)
            make.height.equalTo(14)
        }
        layout_maskingRader.image = UIImage(named: "masking")
        
        layout_radergraph.snp.makeConstraints() { make in
            make.top.equalTo(layout_maskingRader.snp.bottom)
            make.leading.equalTo(layout_maskingRader.snp.leading)
            make.width.equalTo(196)
            make.height.equalTo(156)
        }
        layout_radergraph.backgroundColor = .white
        setBlueShadow(layout_radergraph)
        radarGraph.initViews(layout_radergraph)
        
        layout_maskingBar.snp.makeConstraints() { make in
            make.top.equalTo(layout_profile.snp.top)
            make.leading.equalTo(layout_radergraph.snp.trailing).offset(15)
            make.width.equalTo(94)
            make.height.equalTo(14)
        }
        layout_maskingBar.image = UIImage(named: "masking")
        
        layout_bargraph.snp.makeConstraints() { make in
            make.top.equalTo(layout_maskingBar.snp.bottom)
            make.leading.equalTo(layout_maskingBar.snp.leading)
            make.width.equalTo(262)
            make.height.equalTo(156)
        }
        layout_bargraph.backgroundColor = .white
        setBlueShadow(layout_bargraph)
        barGraph.initViews(layout_bargraph)
        
        layout_maskingExplain.snp.makeConstraints() { make in
            make.top.equalTo(layout_radergraph.snp.bottom).offset(7)
            make.leading.equalTo(layout_radergraph.snp.leading)
            make.width.equalTo(94)
            make.height.equalTo(14)
        }
        layout_maskingExplain.image = UIImage(named: "masking")
        
        layout_explain.snp.makeConstraints() { make in
            make.top.equalTo(layout_maskingExplain.snp.bottom)
            make.leading.equalTo(layout_maskingExplain.snp.leading)
            make.width.equalTo(473)
            make.height.equalTo(132)
        }
        layout_explain.backgroundColor = .white
        setBlueShadow(layout_explain)
        
        layout_explain.addSubview(label_explain)
        label_explain.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(12)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
        }
        label_explain.setTextAttribute("", 15, 8, .black)
        
        layout_maskingGood.snp.makeConstraints() { make in
            make.top.equalTo(layout_explain.snp.bottom).offset(65)
            make.leading.equalToSuperview().offset(139)
            make.width.equalTo(111)
            make.height.equalTo(22)
        }
        layout_maskingGood.image = UIImage(named: "maskingGood")
        layout_maskingGood.addSubview(label_postitGood)
        label_postitGood.snp.makeConstraints() { make in
            make.center.equalToSuperview()
        }
        label_postitGood.setTextAttribute("잘 맞는 부서", 15)
        
        layout_badDept.snp.makeConstraints() { make in
            make.top.equalTo(layout_goodDept.snp.top)
            make.width.equalTo(217)
            make.height.equalTo(230)
            make.leading.equalTo(layout_goodDept.snp.trailing).offset(135)
        }
        layout_badDept.backgroundColor = .white
        setBlueShadow(layout_badDept)
        
        layout_badname.snp.makeConstraints() { make in
            make.top.equalTo(layout_badDept.snp.bottom).offset(20)
            make.leading.equalTo(layout_badDept.snp.leading)
            make.height.equalTo(50)
            make.width.equalTo(216)
        }
        layout_badname.backgroundColor = .white
        setBlueShadow(layout_badname)
        
        layout_badname.addSubview(label_badDept)
        label_badDept.snp.makeConstraints() { make in
            make.center.equalToSuperview()
        }
        label_badDept.setTextAttribute("", 24, 8, .black)
        
        layout_goodDept.snp.makeConstraints() { make in
            make.top.equalTo(layout_maskingGood.snp.bottom)
            make.leading.equalTo(layout_maskingGood.snp.leading)
            make.width.equalTo(217)
            make.height.equalTo(230)
        }
        layout_goodDept.backgroundColor = .white
        setBlueShadow(layout_goodDept)
        
        layout_maskingBad.snp.makeConstraints() { make in
            make.bottom.equalTo(layout_badDept.snp.top)
            make.leading.equalTo(layout_badDept.snp.leading)
            make.width.equalTo(111)
            make.height.equalTo(22)
        }
        layout_maskingBad.image = UIImage(named: "maskingBad")
        layout_maskingBad.addSubview(label_postitBad)
        label_postitBad.snp.makeConstraints() { make in
            make.center.equalToSuperview()
        }
        label_postitBad.setTextAttribute("안 맞는 부서", 15)
        
        layout_goodname.snp.makeConstraints() { make in
            make.top.equalTo(layout_badname.snp.top)
            make.leading.equalTo(layout_goodDept.snp.leading)
            make.height.equalTo(50)
            make.width.equalTo(216)
        }
        layout_goodname.backgroundColor = .white
        setBlueShadow(layout_goodname)
        
        layout_goodname.addSubview(label_goodDept)
        label_goodDept.snp.makeConstraints() { make in
            make.center.equalToSuperview()
        }
        label_goodDept.setTextAttribute("", 24, 8, .black)
        
        layout_doodleGood.snp.makeConstraints() { make in
            make.centerX.equalTo(layout_goodDept)
            make.centerY.equalTo(layout_goodDept).offset(23)
            make.width.equalTo(298)
            make.height.equalTo(370)
        }
        layout_doodleGood.image = UIImage(named: "goodDoodle")
        
        layout_doodleBad.snp.makeConstraints() { make in
            make.centerX.equalTo(layout_badDept)
            make.centerY.equalTo(layout_badDept).offset(23)
            make.width.equalTo(253)
            make.height.equalTo(370)
        }
        layout_doodleBad.image = UIImage(named: "badDoodle")
        
        btn_next.snp.makeConstraints() { make in
            make.width.equalTo(83)
            make.height.equalTo(70)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(vs.width)
        }
        btn_next.layer.zPosition = layout_main.layer.zPosition + 1
        btn_next.image = UIImage(named: "referenceBtn")
        
        layout_stamp.snp.makeConstraints() { make in
            make.width.equalTo(80)
            make.height.equalTo(80)
            make.centerX.equalTo(layout_explain.snp.right)
            make.centerY.equalTo(layout_explain.snp.bottom)
        }
        layout_stamp.image = UIImage(named: "guguStamp")
        layout_stamp.layer.zPosition = 1
        
        layout_explain.addSubview(label_lion)
        label_lion.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(346)
            make.top.equalToSuperview().offset(110)
        }
        label_lion.setTextAttribute("추천인: 사자 부장 (인)", 10, 8, .black)
        label_lion.layer.zPosition = 1
    }
    
    // shadow UI 구현
    func setBlueShadow(_ view: UIView) {
        let shadow_right = UIView()
        let shadow_down = UIView()
        
        view.addSubviews(shadow_right, shadow_down)
        shadow_right.snp.makeConstraints() { make in
            make.width.equalTo(2)
            make.height.equalTo(view.snp.height)
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        shadow_right.backgroundColor = .referenceBlueShadow
        
        shadow_down.snp.makeConstraints() { make in
            make.width.equalToSuperview()
            make.height.equalTo(2)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
        }
        shadow_down.backgroundColor = .referenceBlueShadow
    }
}
