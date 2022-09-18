//
//  ViewControllerEx.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/07/24.
//

import UIKit
import SnapKit
import AVKit


// MARK: - View Size
class ViewSize {
    var width: CGFloat {
        if (UIInterfaceOrientation.landscapeLeft.isLandscape) {
            if (UIScreen.main.bounds.width < UIScreen.main.bounds.height) {
                return UIScreen.main.bounds.height - (42 * 2)
            }
        }
        return UIScreen.main.bounds.width - (42 * 2)
    }
    var height: CGFloat {
        if (UIInterfaceOrientation.landscapeLeft.isLandscape) {
            if (UIScreen.main.bounds.width < UIScreen.main.bounds.height) {
                return UIScreen.main.bounds.width - (46 * 2)
            }
        }
        return UIScreen.main.bounds.height - (46 * 2)
    }
}

// MARK: - Frame Size
class FrameSize {
    var width: CGFloat {
        if (UIInterfaceOrientation.landscapeLeft.isLandscape) {
            return UIScreen.main.bounds.width
        }
        return UIScreen.main.bounds.height
    }
    var height: CGFloat {
        if (UIInterfaceOrientation.landscapeLeft.isLandscape) {
            return UIScreen.main.bounds.height
        }
        return UIScreen.main.bounds.width
    }
}

// MARK: - UIView extension
extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}

// MARK: - UIViewController extension
extension UIViewController {
    func has(_ viewController: UIViewController) -> Bool {
        return children.contains(viewController)
    }
    
    func add(_ viewController: UIViewController, view: UIView? = nil, topView: UIView? = nil) {
        addChild(viewController)
        (view ?? self.view).addSubview(viewController.view)
        
        viewController.view.snp.makeConstraints { make in
            if let topView = topView {
                make.top.equalTo(topView.snp.bottom)
            } else {
                make.top.equalToSuperview()
            }
            make.leading.trailing.bottom.equalToSuperview()
        }
         
        viewController.didMove(toParent: self)
    }
    
    func replace(_ from: UIViewController, _ to: UIViewController, _ view: UIView) {
        remove(from)
        add(to, view: view)
    }
    
    func remove(_ viewController: UIViewController) {
        guard children.contains(viewController) else { return }
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
    func presentFull(_ viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?, transition: Bool = true, duration: CGFloat = 2) {
        if (transition) {
            let transition = CATransition().fadeTransition(duration: duration)
            self.view.window?.layer.add(transition, forKey: kCATransition)
        }
        
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        self.present(viewControllerToPresent, animated: animated, completion: completion)
    }
    
    func dissmissAndPresent(_ viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?, duration: CGFloat = 1.5) {
        let transition = CATransition().fadeTransition(duration: duration)
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        self.view.window?.rootViewController?.dismiss(animated: false, completion: {
          let appDelegate = UIApplication.shared.delegate as! AppDelegate
            viewControllerToPresent.modalPresentationStyle = .fullScreen
            appDelegate.window?.rootViewController?.present(viewControllerToPresent, animated: animated, completion: completion)
        })
    }
}

// MARK: - UILabel extension
extension UILabel {
    // typo animation
    func setText(_ strs: String) {
        self.text = ""
        for str in strs {
            self.text?.append(str)
            RunLoop.current.run(until: Date() + 0.04)
        }
    }
    
    // 대화창 text
    func setTextAttribute(_ str: String = "temp", _ fontSize: CGFloat = 15.0, _ space: CGFloat = 8, _ color: UIColor = .white) {
        self.text = str
        self.numberOfLines = 0
        self.textColor = color
        self.font = UIFont(name: "NeoDunggeunmo-Regular", size: fontSize)
        self.sizeToFit()
        self.layer.zPosition = 999
        
        setLineSpaceAttrText(value: space)
    }
    
    // name tag text
    func setNameTagText(_ fontSize: CGFloat = 11.0) {
        self.text = "temp"
        self.textColor = UIColor.white
        self.font = UIFont(name: "NeoDunggeunmo-Regular", size: fontSize)
        self.sizeToFit()
        self.textAlignment = .center
        self.layer.zPosition = 999
    }
    
    // 선택지 text
    func setChoiceText(_ str: String, _ fontSize: CGFloat = 12.0, _ space: CGFloat = 4, isTitle: Bool = false) {
        self.text = str
        self.textColor = UIColor.black
        self.font = UIFont(name: "NeoDunggeunmo-Regular", size: fontSize)
        self.sizeToFit()
        if (isTitle) {
            self.numberOfLines = 0
            setLineSpaceAttrText(value: space)
        }
        self.textAlignment = .center
    }
    
    // line spacing attribute 추가
    private func setLineSpaceAttrText(value: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = value
        let attrStr = NSMutableAttributedString(string: self.text ?? "")
        attrStr.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, self.text?.count ?? 0))
        
        self.attributedText = attrStr
    }
}

// MARK: - UIButton
extension UIButton {
    func setChoiceButton(tagValue: Int, ImgNameNormal: String = "choicebox_normal", ImgNameTouched: String = "choicebox_touched") {
        self.tag = tagValue
        self.setImage(UIImage(named: ImgNameNormal), for: .normal)
        self.setImage(UIImage(named: ImgNameTouched), for: .highlighted)
        self.adjustsImageWhenHighlighted = false
        
        self.addTarget(self, action: #selector(onHighlight), for: .touchDown)
        self.addTarget(self, action: #selector(onCancel), for: .touchDragOutside)
    }
    
    @objc func onHighlight(_ sender: UIButton) {
        sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        if let label = sender.subviews.last as? UILabel {
            label.textColor = .white
        }
    }
    
    @objc func onCancel(_ sender: UIButton) {
        sender.transform = .identity
        if let label = sender.subviews.last as? UILabel {
            label.textColor = .black
        }
    }
}

// MARK: - UITextField
extension UITextField {
    func setUserNameInput(_ text: String = "닉네임을 설정해주세요") {
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        self.setLeftPaddingPoints(10)
        let range = (text as NSString).range(of: text)
        let font = UIFont(name: "NeoDunggeunmo-Regular", size: 15)
        let placeHolder = NSMutableAttributedString(string: text)
        
        placeHolder.addAttribute(.font, value: font!, range: range)
        placeHolder.addAttribute(.foregroundColor, value: UIColor.gray, range: range)
    
        self.font = font
        self.textColor = .black
        self.attributedPlaceholder = placeHolder
        self.clearButtonMode = .whileEditing
        self.returnKeyType = .done
    }
    
    func setLeftPaddingPoints(_ amount: CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
