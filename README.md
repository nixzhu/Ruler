<p>
<a href="http://cocoadocs.org/docsets/Ruler"><img src="https://img.shields.io/cocoapods/v/Ruler.svg?style=flat"></a> 
<a href="https://github.com/Carthage/Carthage/"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a> 
</p>

# Ruler

In some cases, we need to distinguish between different devices to set UI, but Adaptive Layout can not do that. So, there is a Ruler.

## Requirements

Swift 2.0, iOS 8.0

(Project with Swift 1.2 can still use version 0.5, with slightly different API)

## Example

If we only consider iPhone's width, iPhone 5 has the same width of iPhone 4s, iPhone 6 has a bigger width, iPhone 6 Plus' width even bigger than iPhone 6. Only three widths.

But if we consider full screen size of iPhone, there are four models, because iPhone 5's height is different from iPhone 4s'.

If our app is universal, we need consider iPad, there are two models (in points).

So all we need consider five cases as follows:

```swift
enum Ruler<T> {
    case iPhoneHorizontal(T, T, T)
    case iPhoneVertical(T, T, T, T)
    case iPad(T, T)
    case UniversalHorizontal(T, T, T, T, T)
    case UniversalVertical(T, T, T, T, T, T)
    
	//...
}
```

In real world (thanks generics, Ruler can match anything for different sizes of iOS devices):

```swift
import Ruler
```

```swift
// size, off course

let width = Ruler.iPhoneHorizontal(10, 20, 30).value
let height = Ruler.iPhoneVertical(5, 10, 20, 30).value

// or color

colorView.backgroundColor = Ruler.UniversalVertical(UIColor.blackColor(), UIColor.redColor(), UIColor.blueColor(), UIColor.greenColor(), UIColor.yellowColor(), UIColor.purpleColor()).value

// even closures

typealias Greeting = () -> Void

let greeting: Greeting = Ruler.UniversalVertical({
        print("Hello!")
    }, {
        print("Hi!")
    }, {
        print("How are you!")
    }, {
        print("How do you do!")
    }, {
        print("好友不见！")
    }, {
        print("你好！")
}).value

greeting()

// ...
```

## Installation

Feel free to drag `Ruler.swift` to your iOS Project. But it's recommended to use CocoaPods or Carthage.

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects.

CocoaPods 0.36 adds supports for Swift and embedded frameworks. You can install it with the following command:

```bash
$ [sudo] gem install cocoapods
```

To integrate Ruler into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'Ruler', '~> 0.6'
```

Then, run the following command:

```bash
$ pod install
```

You should open the `{Project}.xcworkspace` instead of the `{Project}.xcodeproj` after you installed anything from CocoaPods.

For more information about how to use CocoaPods, I suggest [this tutorial](http://www.raywenderlich.com/64546/introduction-to-cocoapods-2).

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager for Cocoa application. To install the carthage tool, you can use [Homebrew](http://brew.sh).

```bash
$ brew update
$ brew install carthage
```

To integrate Ruler into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "nixzhu/Ruler" >= 0.6
```

Then, run the following command to build the Ruler framework:

```bash
$ carthage update
```

At last, you need to set up your Xcode project manually to add the Ruler framework.

On your application targets’ “General” settings tab, in the “Linked Frameworks and Libraries” section, drag and drop each framework you want to use from the Carthage/Build folder on disk.

On your application targets’ “Build Phases” settings tab, click the “+” icon and choose “New Run Script Phase”. Create a Run Script with the following content:

```
/usr/local/bin/carthage copy-frameworks
```

and add the paths to the frameworks you want to use under “Input Files”:

```
$(SRCROOT)/Carthage/Build/iOS/Ruler.framework
```

For more information about how to use Carthage, please see its [project page](https://github.com/Carthage/Carthage).

## Contact

NIX [@nixzhu](https://twitter.com/nixzhu)

## License

Ruler is available under the MIT license. See the LICENSE file for more info.
