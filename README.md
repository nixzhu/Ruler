<p>
<a href="http://cocoadocs.org/docsets/Ruler"><img src="https://img.shields.io/cocoapods/v/Ruler.svg?style=flat"></a> 
<a href="https://github.com/Carthage/Carthage/"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a> 
</p>

# Ruler

In some cases, we need to distinguish between different devices to set UI, but Adaptive Layout can not do that. So, there is a Ruler.

## Requirements

Swift 4, iOS 8.0

(Swift 3, use version 1.0.1)

## Example

If we only consider iPhone's width, iPhone 5 has the same width of iPhone 4s, iPhone 6 has a bigger width, iPhone 6 Plus' width even bigger than iPhone 6, and iPhone X's width is the biggest. Only four widths.

But if we consider full screen size of iPhone, there are five models, because iPhone 5's height is different from iPhone 4s'.

If our app is universal, we need consider iPad, there are two models (in points).

So all we need consider five cases as follows:

```swift
enum Ruler<T> {
    case iPhoneHorizontal(T, T, T)
    case iPhoneVertical(T, T, T, T, T)
    case iPad(T, T)
    case universalHorizontal(T, T, T, T, T)
    case universalVertical(T, T, T, T, T, T, T)
}
```

In real world (thanks generics, Ruler can match anything for different sizes of iOS devices):

```swift
import Ruler
```

```swift
// size, off course

let width = Ruler.iPhoneHorizontal(10, 20, 30).value
let height = Ruler.iPhoneVertical(5, 10, 20, 30, 40).value

// or color

colorView.backgroundColor = Ruler.universalVertical(UIColor.black, UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow, UIColor.purple, UIColor.cyan).value

// even closures

typealias Greeting = () -> Void

let greeting: Greeting = Ruler.universalVertical(
{ print("Hello!") },
{ print("Hi!") },
{ print("How are you!") },
{ print("How do you do!") },
{ print("好久不见！") },
{ print("你好！") },
{ print("很高兴见到你！") }).value

greeting()

// ...
```

### Special offer

Detect if this device is an iPhone X:

``` swift
if ScreenModel.isPhoneX {
    print("It's an iPhone X. You're rich!")
}
```

## Installation

Feel free to drag `Ruler.swift` to your iOS Project. But it's recommended to use Carthage (or CocoaPods).

### Carthage

```ogdl
github "nixzhu/Ruler"
```

#### CocoaPods

```ruby
pod 'Ruler'
```

# Contact

NIX [@nixzhu](https://twitter.com/nixzhu)

## License

Ruler is available under the MIT license. See the LICENSE file for more info.
