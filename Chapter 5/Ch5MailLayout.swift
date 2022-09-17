//
//  Ch5MailLayout.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/09/02.
//

import Foundation
import UIKit
import SnapKit

// MARK: -  Mail layout
class layout_Mail_ch5: layout_base {
    let mailIcon = UIImageView()
    var mailIconGesture: UITapGestureRecognizer?
    
    let mailScreen = MailScreen()
    var mailScreenGesture: UITapGestureRecognizer?
    
    func initView(_ view: UIView) {
        super.initView(view, backImg: "office_on_1", profileImg: "suit_normal")
        talkIndex = [0, 0]   // [주인공, 펭귄(땃쥐)]
        
        view.addSubviews(mailIcon, mailScreen.layout_main)
        mailIcon.isUserInteractionEnabled = false
        mailIcon.image = UIImage(named: "mail")
        mailIcon.snp.makeConstraints() { make in
            make.width.equalTo(152)
            make.height.equalTo(111)
            make.right.equalToSuperview().offset(-144)
            make.centerY.equalTo(vs.height)
        }
        mailIcon.isHidden = true
        
        mailScreen.initViews(view)
    }

    // Mail Show animation Method
    func showMailAnimation(_ completion: @escaping (() -> Void)) {
        mailIcon.isHidden = false
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            self.mailIcon.transform = CGAffineTransform(translationX: 0, y: self.profile_player.layer.position.y - 30 - self.mailIcon.layer.position.y)
        }, completion: { _ in
            completion()
        })
    }
}

// MARK: -  Mail Screen
class MailScreen {
    let layout_main = UIView()
    
    let layout_mailframe = UIImageView()
    let layout_line = UIImageView()
    let img_mailprofile = UIImageView()
    
    let label_sender = UILabel()    // [땃쥐 사원]
    let label_title = UILabel()     // [공지] 잠시 후 오전 10시 30분 부터 금년도 하반기...\n받는 사람: \(name)
    let label_date = UILabel()      // 2022년 09월 15일
    
    let label_headline = UILabel() // [공지]
    let label_contents = UILabel()  // n잠시 후 오전 10시 30분 부터 금년도 하반기 신 사업 프로젝트 초안 발표회가 있겠습니다.\n모두 3층 대회의실로 모여주시기 바랍니다.
    
    let txt_sender = "[땃쥐 사원]"
    let txt_title = "[공지] 잠시 후 오전 10시 30분 부터 금년도 하반기...\n받는 사람: "
    let txt_headline = "[공지]"
    let txt_contents = "잠시 후 오전 10시 30분 부터 금년도 하반기 신 사업 프로젝트 초안 발표회가 있겠습니다.\n모두 3층 대회의실로 모여주시기 바랍니다."
    
    func initViews(_ view: UIView) {
        view.addSubview(layout_main)
        layout_main.snp.makeConstraints() { make in
            make.width.equalTo(461)
            make.height.equalTo(247)
            make.center.equalToSuperview()
        }
        layout_main.layer.zPosition = Zposition.choice.rawValue
        layout_main.isHidden = true
        
        layout_main.addSubview(layout_mailframe)
        layout_mailframe.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        layout_mailframe.image = UIImage(named: "mailframe")
        
        layout_mailframe.addSubviews(img_mailprofile, layout_line, label_title, label_date, label_sender, label_headline, label_contents)
        
        img_mailprofile.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(32)
            make.top.equalToSuperview().offset(45)
            make.size.equalTo(57)
        }
        img_mailprofile.image = UIImage(named: "mailprofile")
        
        label_sender.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(42)
            make.left.equalTo(img_mailprofile.snp.right).offset(8)
        }
        label_sender.setTextAttribute(txt_sender, 15, 8, .black)
        
        label_title.snp.makeConstraints() { make in
            make.top.equalTo(label_sender.snp.bottom).offset(10)
            make.left.equalTo(img_mailprofile.snp.right).offset(8)
            make.right.equalToSuperview().offset(-26)
        }
        let username = Name().name
        label_title.setTextAttribute(txt_title+"\(username)", 13, 7, .black)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        let dateStr = dateFormatter.string(from: Date())
        
        label_date.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(42)
            make.right.equalToSuperview().offset(-26)
        }
        label_date.setTextAttribute(dateStr, 13, 7, .black)
        
        layout_line.snp.makeConstraints() { make in
            make.top.equalTo(img_mailprofile.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.width.equalTo(401)
        }
        layout_line.image = UIImage(named: "mailline")
        
        label_headline.snp.makeConstraints() { make in
            make.top.equalTo(layout_line.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(34)
            make.right.equalToSuperview().offset(-24)
        }
        label_headline.setTextAttribute(txt_headline, 15, 8, .black)
        
        label_contents.snp.makeConstraints() { make in
            make.top.equalTo(label_headline.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(34)
            make.right.equalToSuperview().offset(-24)
        }
        label_contents.setTextAttribute(txt_contents, 13, 8, .black)
        
    }
}
