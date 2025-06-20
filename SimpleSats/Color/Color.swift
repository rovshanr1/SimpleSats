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

