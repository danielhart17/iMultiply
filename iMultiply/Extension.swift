//
//  Extension.swift
//  iMultiply
//
//  Created by Daniel Hart on 11/11/20.
//

import UIKit

enum UIUserInterfaceIdiom: Int {
    case undefined
    case phone
    case pad
}

struct ScreenSize {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let maxHeight = max(ScreenSize.width,ScreenSize.height)
    static let minHeight = min(ScreenSize.width,ScreenSize.height)
}

struct DeviceType {
    static let isiPhone4orLess = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight < 568.0
    static let isiPhone5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight >= 568.0
    static let isiPhone6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight == 667.0
    static let isiPhone6Plus = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight == 736.0
    static let isiPhoneX = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight == 812.0

    static let isiPad  = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.maxHeight == 1024.0
    static let isiPadPro  = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.maxHeight == 1366.0
}
