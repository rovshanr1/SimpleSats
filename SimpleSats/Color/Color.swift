//
//  Color.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 12.06.25.
//

import UIKit

extension UIColor{
    static let appBackgroundColor = UIColor(named: "AppBackgroun")
    static let purpleBB = UIColor(named: "PurpleButtonBackground")
    static let purpleBBLO = UIColor(named: "PurpleButtonBackgroundLowOpacity")
    static let pinkTextColor = UIColor(named: "PinkTextColor")
    static let tokenBackgroundColor = UIColor(named: "TokenCardBGColor")
    static let tokenViewBGColor = UIColor(named: "TokenViewBG")
    static let tabBarBtnColor = UIColor(named: "TabBarBtnColor")
    static let nonSelectedTI = UIColor(named: "NonSelectedTabIcon")
    static let tabBarBackgroundColor = UIColor(named: "TabbarBGColor")
    static let gradientBBlue = UIColor(named: "GradientButtonBlue")
    static let gradientBPurple = UIColor(named: "GradientButtonPurple")
    static let gradientBMagenta = UIColor(named: "GradientButtonPurple")
    
    
    static var tokenIconColor: UIColor{
        return UIColor(named: "TokenCardIconColor") ?? .systemOrange
    }

    static var tokenTimeSeriesColor: UIColor{
        return UIColor(named: "TokenCardTimeBGColor") ?? .purple
    }
    static var percentageTextColor: UIColor{
        return UIColor(named: "PrecentageChangeLabelColor") ?? .green
    }
    static var buttonColorPink: UIColor {
        return UIColor(named: "ButtonColor1")  ?? .systemPink
    }
    


}

