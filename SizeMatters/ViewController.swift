//
//  ViewController.swift
//  SizeMatters
//
//  Created by NIX on 15/7/22.
//  Copyright (c) 2015年 nixWork. All rights reserved.
//

import UIKit
import Ruler

class ViewController: UIViewController {

    @IBOutlet weak var leftMargin: NSLayoutConstraint!
    @IBOutlet weak var topMargin: NSLayoutConstraint!

    @IBOutlet weak var colorView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // set some constraints

        leftMargin.constant = Ruler.universalHorizontal(0, 20, 40, 60, 80).value
        topMargin.constant = Ruler.universalVertical(0, 20, 40, 60, 80, 100).value

        // other test

        let width = Ruler.iPhoneHorizontal(10, 20, 30).value
        print("width = \(width)\n")

        let height = Ruler.iPhoneVertical(5, 10, 20, 30).value
        print("height = \(height)\n")

        let iPadWidthOrHeight = Ruler.iPad(20, 50).value
        print("iPadWidthOrHeight = \(iPadWidthOrHeight)\n")

        let universalWidth = Ruler.universalHorizontal(10, 20, 30, 40, 60).value
        print("universalWidth = \(universalWidth)\n")

        let universalHeight = Ruler.universalVertical(5, 10, 20, 30, 40, 60).value
        print("universalHeight = \(universalHeight)\n")

        // thanks generics, Ruler can match anything for different sizes of iOS devices, not just the length!

        colorView.backgroundColor = Ruler.universalVertical(UIColor.black, UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow, UIColor.purple).value

        typealias Greeting = () -> Void

        let greeting: Greeting = Ruler.universalVertical({
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
    }
}

