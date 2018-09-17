//
//  Ruler.swift
//  Ruler
//
//  Created by NIX on 15/7/22.
//  Copyright (c) 2015年 nixWork. All rights reserved.
//

import UIKit

public enum ScreenModel {

    public enum ClassicModel {
        case inch35
        case inch4
    }

    case classic(ClassicModel)
    case bigger
    case biggerPlus
    case x
    case xMax

    public enum PadModel {
        case normal
        case pro
    }
    case iPad(PadModel)
}

private let screenModel: ScreenModel = {
    let screen = UIScreen.main
    let height = max(screen.bounds.width, screen.bounds.height)
    switch height {
    case 480:
        return .classic(.inch35)
    case 568:
        return .classic(.inch4)
    case 667:
        return .bigger
    case 736, 1920:
        return .biggerPlus
    case 812:
        return .x
    case 896:
        return .xMax
    case 1024:
        return .iPad(.normal)
    case 1112, 1366:
        return .iPad(.pro)
    default:
        print("Warning: Can NOT detect screenModel! bounds: \(screen.bounds) nativeScale: \(screen.nativeScale)")
        return .bigger // Default
    }
}()

public enum Ruler<T> {

    case iPhoneHorizontal(T, T, T)
    case iPhoneVertical(T, T, T, T, T, T)
    case iPad(T, T)
    case universalHorizontal(T, T, T, T, T)
    case universalVertical(T, T, T, T, T, T, T, T)

    public var value: T {
        switch self {
        case let .iPhoneHorizontal(classic, bigger, biggerPlus):
            switch screenModel {
            case .classic:
                return classic
            case .bigger:
                return bigger
            case .biggerPlus:
                return biggerPlus
            case .x:
                return bigger
            case .xMax:
                return biggerPlus
            default:
                return biggerPlus
            }
        case let .iPhoneVertical(inch35, inch4, bigger, biggerPlus, x, xMax):
            switch screenModel {
            case .classic(let model):
                switch model {
                case .inch35:
                    return inch35
                case .inch4:
                    return inch4
                }
            case .bigger:
                return bigger
            case .biggerPlus:
                return biggerPlus
            case .x:
                return x
            case .xMax:
                return xMax
            default:
                return biggerPlus
            }
        case let .iPad(normal, pro):
            switch screenModel {
            case .iPad(let model):
                switch model {
                case .normal:
                    return normal
                case .pro:
                    return pro
                }
            default:
                return normal
            }
        case let .universalHorizontal(classic, bigger, biggerPlus, iPadNormal, iPadPro):
            switch screenModel {
            case .classic:
                return classic
            case .bigger:
                return bigger
            case .biggerPlus:
                return biggerPlus
            case .x:
                return bigger
            case .xMax:
                return biggerPlus
            case .iPad(let model):
                switch model {
                case .normal:
                    return iPadNormal
                case .pro:
                    return iPadPro
                }
            }
        case let .universalVertical(inch35, inch4, bigger, biggerPlus, x, xMax, iPadNormal, iPadPro):
            switch screenModel {
            case .classic(let model):
                switch model {
                case .inch35:
                    return inch35
                case .inch4:
                    return inch4
                }
            case .bigger:
                return bigger
            case .biggerPlus:
                return biggerPlus
            case .x:
                return x
            case .xMax:
                return xMax
            case .iPad(let model):
                switch model {
                case .normal:
                    return iPadNormal
                case .pro:
                    return iPadPro
                }
            }
        }
    }
}

extension ScreenModel {

    public static var isPhoneX: Bool {
        switch screenModel {
        case .x, .xMax:
            return true
        default:
            return false
        }
    }
}
