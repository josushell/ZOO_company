//
//  ViewControllerEx.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/07/24.
//

import UIKit
import SnapKit


// MARK: - View Size
struct viewSize {
    let width = UIScreen.main.bounds.width - (42 * 2)
    let height = UIScreen.main.bounds.height - (46 * 2)
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
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        present(viewControllerToPresent, animated: animated, completion: completion)
    }
    
    func dissmissAndPresent(_ viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?) {
        self.view.window?.rootViewController?.dismiss(animated: false, completion: {
          let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController?.presentFull(viewControllerToPresent, animated: animated, completion: completion)
        })
    }
}

// MARK: - UILabel extension
extension UILabel {
    func setText(_ strs: String) {
        self.text = ""
        for str in strs {
            self.text?.append(str)
            RunLoop.current.run(until: Date() + 0.02)
        }
    }
    
    func setTextAttribute(_ fontSize: CGFloat = 15.0, _ space: CGFloat = 8) {
        self.text = "temp"
        self.numberOfLines = 0
        self.textColor = UIColor.white
        self.font = UIFont(name: "NeoDunggeunmo-Regular", size: fontSize)
        self.sizeToFit()
        self.layer.zPosition = 999
        
        setLineSpaceAttrText(value: space)
    }
    
    func setNameTagText(_ fontSize: CGFloat = 11.0) {
        self.text = "temp"
        self.textColor = UIColor.white
        self.font = UIFont(name: "NeoDunggeunmo-Regular", size: fontSize)
        self.sizeToFit()
        self.textAlignment = .center
        self.layer.zPosition = 999
    }
    
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
    
    private func setLineSpaceAttrText(value: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = value
        let attrStr = NSMutableAttributedString(string: self.text ?? "")
        attrStr.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, self.text?.count ?? 0))
        
        self.attributedText = attrStr
    }
}
