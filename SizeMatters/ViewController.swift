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

    override func viewDidLoad() {
        super.viewDidLoad()

        // set some constraints

        leftMargin.constant = Ruler.UniversalHorizontal(0, 20, 40, 60).value
        topMargin.constant = Ruler.UniversalVertical(0, 20, 40, 60, 80).value

        // other test

        let width: CGFloat = Ruler.iPhoneHorizontal(10, 20, 30).value
        print("width = \(width)\n")

        let height: Int = Ruler.iPhoneVertical(5, 10, 20, 30).value
        print("height = \(height)\n")

        let universalWidth = Ruler.UniversalHorizontal(10, 20, 30, 40).value
        print("universalWidth = \(universalWidth)\n")

        let universalHeight = Ruler.UniversalVertical(5, 10, 20, 30, 40).value
        print("universalHeight = \(universalHeight)\n")
    }
}

