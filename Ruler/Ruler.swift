//
//  Ruler.swift
//  Ruler
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

    enum PadModel {
        case Normal
        case Pro
    }
    case iPad(PadModel)
}

private let screenModel: ScreenModel = {

    let screen = UIScreen.mainScreen()
    let nativeWidth = screen.nativeBounds.size.width

    switch nativeWidth {

    case 2 * 320:
        let nativeHeight = screen.nativeBounds.size.height
        return nativeHeight > (2 * 480) ? .Classic(.Inch4) : .Classic(.Inch35)

    case 2 * 375:
        return .Bigger

    case 3 * 414:
        return .BiggerPlus

    case 2 * 768, 768:
        return .iPad(.Normal)

    case 2 * 1024:
        return .iPad(.Pro)

    default:
        print("Warning: Can NOT detect screenModel!")
        return .Bigger // Default
    }
    }()

public enum Ruler<T> {

    case iPhoneHorizontal(T, T, T)
    case iPhoneVertical(T, T, T, T)
    case iPad(T, T)
    case UniversalHorizontal(T, T, T, T, T)
    case UniversalVertical(T, T, T, T, T, T)

    public var value: T {

        switch self {

        case let .iPhoneHorizontal(classic, bigger, biggerPlus):
            switch screenModel {
            case .Classic:
                return classic
            case .Bigger:
                return bigger
            case .BiggerPlus:
                return biggerPlus
            default:
                return biggerPlus
            }

        case let .iPhoneVertical(inch35, inch4, bigger, biggerPlus):
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
            default:
                return biggerPlus
            }

        case let .iPad(normal, pro):
            switch screenModel {
            case .iPad(let model):

                switch model {
                case .Normal:
                    return normal
                case .Pro:
                    return pro
                }
            default:
                return normal
            }

        case let .UniversalHorizontal(classic, bigger, biggerPlus, iPadNormal, iPadPro):
            switch screenModel {
            case .Classic:
                return classic
            case .Bigger:
                return bigger
            case .BiggerPlus:
                return biggerPlus
            case .iPad(let model):
                switch model {
                case .Normal:
                    return iPadNormal
                case .Pro:
                    return iPadPro
                }
            }

        case let .UniversalVertical(inch35, inch4, bigger, biggerPlus, iPadNormal, iPadPro):
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
            case .iPad(let model):
                switch model {
                case .Normal:
                    return iPadNormal
                case .Pro:
                    return iPadPro
                }
            }
        }
    }
}

