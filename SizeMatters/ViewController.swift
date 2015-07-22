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

        leftMargin.constant = Ruler.match(.UniversalWidths(0, 20, 40, 60))
        topMargin.constant = Ruler.match(.UniversalHeights(0, 20, 40, 60, 80))

        // other test

        let width = Ruler.match(.iPhoneWidths(10, 20, 30))
        print("width = \(width)\n")

        let height = Ruler.match(.iPhoneHeights(5, 10, 20, 30))
        print("height = \(height)\n")

        let universalWidth = Ruler.match(.UniversalWidths(10, 20, 30, 40))
        print("universalWidth = \(universalWidth)\n")

        let universalHeight = Ruler.match(.UniversalHeights(5, 10, 20, 30, 40))
        print("universalHeight = \(universalHeight)\n")
    }

}

