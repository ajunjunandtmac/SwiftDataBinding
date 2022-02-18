//
//  DynamicData.swift
//  ztcUIKit
//
//  Created by 俊周 on 2022/1/6.
//

import UIKit
import RxSwift
import RxCocoa
public class DynamicData<T> {
    private var data: T {
        didSet {
            subject.onNext(data)
        }
    }
    
    public let disposeBag = DisposeBag()
    
    init(data: T) {
        self.data = data
        subject.onNext(data)
    }
    
    /// DynamicData initialize
    /// - Parameter data: actual data, like String, Int ...
    /// - Returns: DynamicData
    public static func Initialize(_ data: T) -> DynamicData {
        let dynamicData = DynamicData(data: data)
        return dynamicData
    }
    
    
    /// New value assign
    /// - Parameter data: new value
    public func assign(_ data: T) {
        self.data = data
    }
    
    private let subject: ReplaySubject<T> = ReplaySubject.create(bufferSize: 1)
    
    public var signal: Observable<T> {
        return subject.asObserver()
    }
}
