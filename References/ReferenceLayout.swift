//
//  ReferenceLayout.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/11/09.
//

import Foundation
import UIKit

// MARK: - Reference layout:
class layout_reference {
    let layout_scroll = UIScrollView()
    let layout_main = UIView()
    
    let layout_profile = UIImageView()
    let layout_name = UIView()
    
    let layout_bargraph = UIView()
    let layout_radergraph = UIView()
    let layout_explain = UIView()
    
    let layout_goodDept = UIImageView()
    let layout_badDept = UIImageView()
    let layout_goodname = UIView()
    let layout_badname = UIView()
    
    let layout_maskingRader = UIView()
    let layout_maskingBar = UIView()
    let layout_maskingExplain = UIView()
    let layout_maskingGood = UIView()
    let layout_maskingBad = UIView()
    
    func initViews(_ view: UIView) {
        // auto layout 적용
        layout_scroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(layout_scroll)
        layout_scroll.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        
        layout_scroll.addSubview(layout_main)
        layout_main.snp.makeConstraints() { make in
            //make.top.equalTo(layout_scroll.contentLayoutGuide.snp.top)
            make.top.leading.trailing.bottom.equalTo(layout_scroll.contentLayoutGuide)
            make.height.equalTo(780)
        }
        layout_main.backgroundColor = .white
        
        layout_main.addSubviews(layout_profile, layout_bargraph, layout_radergraph, layout_explain, layout_goodDept, layout_badDept, layout_goodname, layout_badname, layout_name)
        layout_main.addSubviews(layout_maskingRader, layout_maskingBar, layout_maskingExplain, layout_maskingGood, layout_maskingBad)
        
        layout_profile.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(33)
            make.leading.equalToSuperview().offset(48)
            make.height.equalTo(260)
            make.width.equalTo(245)
        }
        layout_profile.image = UIImage(named: "team_design")
        
        layout_name.snp.makeConstraints() { make in
            make.leading.width.equalTo(layout_profile)
            make.top.equalTo(layout_profile.snp.bottom).offset(18)
            make.height.equalTo(45)
            //make.bottom.equalTo(layout_explain)
        }
        layout_name.backgroundColor = .white
        
        layout_maskingRader.snp.makeConstraints() { make in
            make.top.equalTo(layout_profile.snp.top)
            make.leading.equalTo(layout_profile.snp.trailing).offset(30)
            make.width.equalTo(94)
            make.height.equalTo(14)
        }
        layout_maskingRader.backgroundColor = .blue
        
        layout_radergraph.snp.makeConstraints() { make in
            make.top.equalTo(layout_maskingRader.snp.bottom)
            make.leading.equalTo(layout_maskingRader.snp.leading)
            make.width.equalTo(196)
            make.height.equalTo(156)
        }
        layout_radergraph.backgroundColor = .white
        
        layout_maskingBar.snp.makeConstraints() { make in
            make.top.equalTo(layout_profile.snp.top)
            make.leading.equalTo(layout_radergraph.snp.trailing).offset(15)
            make.width.equalTo(94)
            make.height.equalTo(14)
        }
        layout_maskingBar.backgroundColor = .blue
        
        layout_bargraph.snp.makeConstraints() { make in
            make.top.equalTo(layout_maskingBar.snp.bottom)
            make.leading.equalTo(layout_maskingBar.snp.leading)
            make.width.equalTo(262)
            make.height.equalTo(156)
        }
        layout_bargraph.backgroundColor = .white
        
        layout_maskingExplain.snp.makeConstraints() { make in
            make.top.equalTo(layout_radergraph.snp.bottom).offset(7)
            make.leading.equalTo(layout_radergraph.snp.leading)
            make.width.equalTo(94)
            make.height.equalTo(14)
        }
        layout_maskingExplain.backgroundColor = .blue
        
        layout_explain.snp.makeConstraints() { make in
            make.top.equalTo(layout_maskingExplain.snp.bottom)
            make.leading.equalTo(layout_maskingExplain.snp.leading)
            make.width.equalTo(473)
            make.height.equalTo(132)
        }
        layout_explain.backgroundColor = .white
        
        layout_maskingBad.snp.makeConstraints() { make in
            make.top.equalTo(layout_explain.snp.bottom).offset(65)
            make.leading.equalToSuperview().offset(139)
            make.width.equalTo(111)
            make.height.equalTo(22)
        }
        layout_maskingBad.backgroundColor = .blue
        
        layout_badDept.snp.makeConstraints() { make in
            make.top.equalTo(layout_maskingBad.snp.bottom)
            make.leading.equalTo(layout_maskingBad.snp.leading)
            make.width.equalTo(217)
            make.height.equalTo(230)
        }
        layout_badDept.backgroundColor = .white
        
        layout_badname.snp.makeConstraints() { make in
            make.top.equalTo(layout_badDept.snp.bottom).offset(20)
            make.leading.equalTo(layout_badDept.snp.leading)
            make.height.equalTo(50)
            make.width.equalTo(216)
        }
        layout_badname.backgroundColor = .white
        
        layout_goodDept.snp.makeConstraints() { make in
            make.top.equalTo(layout_badDept.snp.top)
            make.width.equalTo(217)
            make.height.equalTo(230)
            make.leading.equalTo(layout_badDept.snp.trailing).offset(135)
        }
        layout_goodDept.backgroundColor = .white
        
        layout_maskingGood.snp.makeConstraints() { make in
            make.bottom.equalTo(layout_goodDept.snp.top)
            make.leading.equalTo(layout_goodDept.snp.leading)
            make.width.equalTo(111)
            make.height.equalTo(22)
        }
        layout_maskingGood.backgroundColor = .blue
        
        layout_goodname.snp.makeConstraints() { make in
            make.top.equalTo(layout_badname.snp.top)
            make.leading.equalTo(layout_goodDept.snp.leading)
            make.height.equalTo(50)
            make.width.equalTo(216)
        }
        layout_goodname.backgroundColor = .white
       
    }
    
}
