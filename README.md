# SwiftDataBinding

[![CI Status](https://img.shields.io/travis/zhoujun2020@sumec.com.cn/SwiftDataBinding.svg?style=flat)](https://travis-ci.org/zhoujun2020@sumec.com.cn/SwiftDataBinding)
[![Version](https://img.shields.io/cocoapods/v/SwiftDataBinding.svg?style=flat)](https://cocoapods.org/pods/SwiftDataBinding)
[![License](https://img.shields.io/cocoapods/l/SwiftDataBinding.svg?style=flat)](https://cocoapods.org/pods/SwiftDataBinding)
[![Platform](https://img.shields.io/cocoapods/p/SwiftDataBinding.svg?style=flat)](https://cocoapods.org/pods/SwiftDataBinding)

 SwiftDataBinding is a responsive UI Tools, make the rendering of the view changed by data change, inspired by Vue.

## Usage

- initialize a variable

```swift
public let data: DynamicData<String> = DynamicData.Initialize("")
```

- bind data and UI component

```swift
dataLabel.bindText(data)
```

- change the data and the label will be rendering automatically then

```swift
data.assign("new value")
```

- How to make more UI components responsive？

Refer to the example in 'UIView+DataBinding' file to add capabilities to the UI components you want

## Sample Projects

- To run the example project, clone the repo, and run `pod install` from the Example directory first.

- just find the key text "core step" to see how the function works

## Dependencies

- RxSwift 
- RxCocoa

## Installation

SwiftDataBinding is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftDataBinding'
```

## License

SwiftDataBinding is available under the MIT license. See the LICENSE file for more info.
