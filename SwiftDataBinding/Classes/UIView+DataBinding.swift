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
        data.signal.asDriver(onErrorJustReturn: "").drive(self.rx.text).disposed(by: data.disposeBag)
    }
    
    func bindTextColor(_ data: DynamicData<UIColor>) {
        data.signal.observeOn(MainScheduler.instance).subscribe(onNext: { data in
            self.textColor = data
        }).disposed(by: data.disposeBag)
    }
    
    func bindTextFont(_ data: DynamicData<UIFont>) {
        data.signal.observeOn(MainScheduler.instance).subscribe(onNext: { data in
            self.font = data
        }).disposed(by: data.disposeBag)
    }
}

public extension UIView {
    func bindBackgroundColor(_ data: DynamicData<UIColor>) {
        data.signal.asDriver(onErrorJustReturn: UIColor.white).drive(self.rx.backgroundColor).disposed(by: data.disposeBag)
    }
    
    func bindAlpha(_ data: DynamicData<Double>) {
        data.signal.observeOn(MainScheduler.instance).subscribe(onNext: { data in
            self.alpha = data
        }).disposed(by: data.disposeBag)
    }
    
    func bindVisible(_ data: DynamicData<Bool>) {
        data.signal.map{!$0}.asDriver(onErrorJustReturn: true).drive(self.rx.isHidden).disposed(by: data.disposeBag)
    }
}

public extension UIActivityIndicatorView {
    func bindLoading(_ data: DynamicData<Bool>) {
        data.signal.asDriver(onErrorJustReturn: false).drive(self.rx.isAnimating).disposed(by: data.disposeBag)
    }
}

public extension UIButton {
    func bindEnabled(_ data: DynamicData<Bool>) {
        data.signal.asDriver(onErrorJustReturn: false).drive(self.rx.isEnabled).disposed(by: data.disposeBag)
    }
}
