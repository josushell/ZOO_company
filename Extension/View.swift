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
class viewSize {
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
    
    func presentFull(_ viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?) {
        let transition = CATransition().fadeTransition()
        self.view.window!.layer.add(transition, forKey: kCATransition)
        
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        present(viewControllerToPresent, animated: animated, completion: completion)
    }
    
    func dissmissAndPresent(_ viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?) {
        let transition = CATransition().fadeTransition()
        self.view.window!.layer.add(transition, forKey: kCATransition)
        
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
    func setTextAttribute(_ str: String = "temp", _ fontSize: CGFloat = 15.0, _ space: CGFloat = 8) {
        self.text = str
        self.numberOfLines = 0
        self.textColor = UIColor.white
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
    func setChoiceButton(tagValue: Int) {
        self.tag = tagValue
        self.setImage(UIImage(named: "choicebox_normal"), for: .normal)
        self.setImage(UIImage(named: "choicebox_touched"), for: .highlighted)
        self.adjustsImageWhenHighlighted = false
        
        self.addTarget(self, action: #selector(onHighlight), for: .touchDown)
        self.addTarget(self, action: #selector(onCancel), for: .touchDragOutside)
    }
    
    @objc func onHighlight(_ sender: UIButton) {
        if let label = sender.subviews.last as? UILabel {
            label.textColor = .white
        }
    }
    
    @objc func onCancel(_ sender: UIButton) {
        if let label = sender.subviews.last as? UILabel {
            label.textColor = .black
        }
    }
}
