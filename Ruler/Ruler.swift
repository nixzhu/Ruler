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
        case inch35
        case inch4
    }
    case classic(ClassicModel)
    case bigger
    case biggerPlus

    enum PadModel {
        case normal
        case pro
    }
    case iPad(PadModel)
}

private let screenModel: ScreenModel = {

    let screen = UIScreen.main
    let width = min(screen.bounds.size.width, screen.bounds.size.height)

    switch width {

    case 320:
        let height = max(screen.bounds.size.width, screen.bounds.size.height)
        return height > 480 ? .classic(.inch4) : .classic(.inch35)

    case 375:
        return .bigger

    case 414, 1080:
        return .biggerPlus

    case 768, 768:
        return .iPad(.normal)

    case 1024:
        return .iPad(.pro)

    default:
        print("Warning: Can NOT detect screenModel! bounds: \(screen.bounds) nativeScale: \(screen.nativeScale)")
        return .bigger // Default
    }
}()

public enum Ruler<T> {

    case iPhoneHorizontal(T, T, T)
    case iPhoneVertical(T, T, T, T)
    case iPad(T, T)
    case universalHorizontal(T, T, T, T, T)
    case universalVertical(T, T, T, T, T, T)

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
            default:
                return biggerPlus
            }

        case let .iPhoneVertical(inch35, inch4, bigger, biggerPlus):
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
            case .iPad(let model):
                switch model {
                case .normal:
                    return iPadNormal
                case .pro:
                    return iPadPro
                }
            }

        case let .universalVertical(inch35, inch4, bigger, biggerPlus, iPadNormal, iPadPro):
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

