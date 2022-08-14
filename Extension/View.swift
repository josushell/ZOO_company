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
