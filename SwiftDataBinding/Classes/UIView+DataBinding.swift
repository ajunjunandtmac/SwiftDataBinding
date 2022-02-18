//
//  UIView+Databing.swift
//  ztcUIKit
//
//  Created by 俊周 on 2022/1/6.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
public extension UILabel {
    
    /// bind the label and dynamic string data
    /// - Parameter text: dynamic string data
    func bindText(_ data: DynamicData<String>) {
        data.signal.bind(to: self.rx.text).disposed(by: data.disposeBag)
    }
    
    func bindTextColor(_ data: DynamicData<UIColor>) {
        data.signal.bind(to: self.rx.textColor).disposed(by: data.disposeBag)
    }
    
    func bindTextFont(_ data: DynamicData<UIFont>) {
        data.signal.bind(to: self.rx.font).disposed(by: data.disposeBag)
    }
}

public extension UIView {
    func bindBackgroundColor(_ data: DynamicData<UIColor>) {
        data.signal.bind(to: self.rx.backgroundColor).disposed(by: data.disposeBag)
    }
    
    func bindAlpha(_ data: DynamicData<CGFloat>) {
        data.signal.bind(to: self.rx.alpha).disposed(by: data.disposeBag)
    }
    
    func bindVisible(_ data: DynamicData<Bool>) {
        data.signal.map{!$0}.bind(to: self.rx.isHidden).disposed(by: data.disposeBag)
    }
}

public extension UIActivityIndicatorView {
    func bindLoading(_ data: DynamicData<Bool>) {
        data.signal.bind(to: self.rx.isAnimating).disposed(by: data.disposeBag)
    }
}

public extension UIButton {
    func bindEnabled(_ data: DynamicData<Bool>) {
        data.signal.bind(to: self.rx.isEnabled).disposed(by: data.disposeBag)
    }
}
