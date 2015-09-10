//
//  Ruler.swift
//  SizeMatters
//
//  Created by NIX on 15/7/22.
//  Copyright (c) 2015年 nixWork. All rights reserved.
//

import UIKit

private enum ScreenModel {

    enum ClassicModel {
        case Inch35
        case Inch4
    }
    case Classic(ClassicModel)
    case Bigger
    case BiggerPlus
    case iPad
}

private let screenModel: ScreenModel = {

    let screen = UIScreen.mainScreen()
    let nativeWidth = screen.nativeBounds.size.width

    switch nativeWidth {

    case 320 * 2:
        let nativeHeight = screen.nativeBounds.size.height
        return nativeHeight > (480 * 2) ? .Classic(.Inch4) : .Classic(.Inch35)

    case 375 * 2:
        return .Bigger

    case 414 * 3:
        return .BiggerPlus

    case 768 * 2, 768:
        return .iPad

    default:
        return .Bigger // Default
    }
    }()

public enum Measure<T> {
    case iPhoneWidths(T, T, T)
    case iPhoneHeights(T, T, T, T)
    case UniversalWidths(T, T, T, T)
    case UniversalHeights(T, T, T, T, T)
}

public class Ruler<T> {

    public class func match(measure: Measure<T>) -> T {

        switch measure {

        case let .iPhoneWidths(classic, bigger, biggerPlus):
            switch screenModel {
            case .Classic:
                return classic
            case .Bigger:
                return bigger
            case .BiggerPlus:
                return biggerPlus
            case .iPad:
                return biggerPlus
            }

        case let .iPhoneHeights(inch35, inch4, bigger, biggerPlus):
            switch screenModel {
            case .Classic(let model):
                switch model {
                case .Inch35:
                    return inch35
                case .Inch4:
                    return inch4
                }
            case .Bigger:
                return bigger
            case .BiggerPlus:
                return biggerPlus
            case .iPad:
                return biggerPlus
            }

        case let .UniversalWidths(classic, bigger, biggerPlus, iPad):
            switch screenModel {
            case .Classic:
                return classic
            case .Bigger:
                return bigger
            case .BiggerPlus:
                return biggerPlus
            case .iPad:
                return iPad
            }

        case let .UniversalHeights(inch35, inch4, bigger, biggerPlus, iPad):
            switch screenModel {
            case .Classic(let model):
                switch model {
                case .Inch35:
                    return inch35
                case .Inch4:
                    return inch4
                }
            case .Bigger:
                return bigger
            case .BiggerPlus:
                return biggerPlus
            case .iPad:
                return iPad
            }
        }
    }
}

