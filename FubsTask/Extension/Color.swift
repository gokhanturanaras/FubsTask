//
//  Color.swift
//  FubsTask
//
//  Created by Gökhan Aras on 15.06.2022.
//

import UIKit

open class Color : UIColor{
    /// R = 239 G= 239 B = 239 alpha 1
    public static var lightGray1 = UIColor.init(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1)
    /// R = 143 G= 143 B = 143 alpha 1
    public static var gray2 = UIColor.init(red: 143/255.0, green: 143/255.0, blue: 143/255.0, alpha: 1)
    /// R = 123 G= 123 B = 123 alpha 1
    public static var gray1 = UIColor.init(red: 96/255.0, green: 96/255.0, blue: 102/255.0, alpha: 1)
    
    public static var placeholder = UIColor.init(red: 144/255.0, green: 144/255.0, blue: 153/255.0, alpha: 1)

    /// R = 41 G= 39 B = 39 alpha 1
    public static var black1 = UIColor.init(red: 41/255.0, green: 39/255.0, blue: 39/255.0, alpha: 1)
    /// R = 0 G= 0 B = 0 alpha 0.55
    public static var blackAlpha1 = UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.55)
    /// RGB = 245 245 250
    public static var background = UIColor.init(red: 245/255.0, green: 245/255.0, blue: 250/255.0, alpha: 1)
   
    public static var red1 = UIColor.init(red: 255/255.0, green: 91/255.0, blue: 89/255.0, alpha: 1)

    
    public static var accentBlue = UIColor.init(red: 21/255.0, green: 94/255.0, blue: 212/255.0, alpha: 1)


    public var gradiantColor:CAGradientLayer = {
        var gradiantColor = CAGradientLayer()
        let colorLeft = UIColor(red: 39.0 / 255.0, green: 199.0 / 255.0, blue: 218.0 / 255.0, alpha: 1.0).cgColor
        let colorRight = UIColor(red: 170.0 / 255.0, green: 80.0 / 255.0, blue: 241.0 / 255.0, alpha: 1.0).cgColor
        gradiantColor.colors = [colorLeft, colorRight]
        gradiantColor.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradiantColor.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradiantColor.locations = [0.0, 1.0]
        return gradiantColor
    }()
    
    public var gradiantColor2:CAGradientLayer = {
        var gradiantColor = CAGradientLayer()
        let colorRight = UIColor(red: 34.0 / 255.0, green: 180.0 / 255.0, blue: 203.0 / 255.0, alpha: 1.0).cgColor
        let colorLeft = UIColor(red: 38.0 / 255.0, green: 1.0 / 255.0, blue: 74.0 / 255.0, alpha: 1.0).cgColor
        gradiantColor.colors = [colorLeft, colorRight]
        gradiantColor.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradiantColor.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradiantColor.locations = [0.0, 1.0]
        return gradiantColor
    }()
    
 
}
