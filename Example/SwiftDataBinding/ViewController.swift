//
//  ViewController.swift
//  SwiftDataBinding
//
//  Created by zhoujun2020@sumec.com.cn on 02/17/2022.
//  Copyright (c) 2022 zhoujun2020@sumec.com.cn. All rights reserved.
//

import UIKit
import RxSwift
import SwiftDataBinding
class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    // core step 1: create a dynamic data
    private let data: DynamicData<String> = DynamicData.Initialize("which fruit will come?")
    
    // if you are not familar with RxSwift ignore the below codes
    private let disposeBag = DisposeBag()
    private var connectObservable: ConnectableObservable<String>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // core step 2: bind the data and UILabel
        label.bindText(data)
        
        // if you are not familar with RxSwift ignore the below codes, just in order to generate some texts
        let interval: Observable<Int> = Observable.interval(.seconds(1), scheduler: MainScheduler.instance)
        let texts: Observable<String> = Observable.from(["apple", "pear", "lemon", "cherry"])
        connectObservable = Observable.zip(interval, texts).map{$0.1}.publish()
        let binder: AnyObserver<String> = AnyObserver { [weak self] event in
            switch event {
            case let .next(value):
                // core step 3: change the data the the label will rendering automatically then
                self?.data.assign(value)
            default:
                break
            }
            
        }
        _ = connectObservable.debug().bind(to: binder)
    }
    
    @IBAction func handleButtonTapped(_ sender: Any) {
        _ = connectObservable.connect()
    }
}

