//
//  Label.swift
//  FubsTask
//
//  Created by Gökhan Aras on 15.06.2022.
//

import UIKit

class Label: UILabel {
    
    private var type:LabelType!
    private var fontName:FontName!
    private var fontType:FontType!
    private var aligment:NSTextAlignment!

    public func setText(text:Any?){
        if let data = text as? String {
            self.text = data
        }
    }
    
    init(text:String? = nil, type:LabelType = .standart, fontName:FontName = .system, fontType:FontType = .regular, textColor:UIColor? = nil, aligment:NSTextAlignment = .left) {
        super.init(frame: .zero)
        self.frame.size.height = 40
        self.type = type
        self.fontName = fontName
        self.fontType = fontType
        if textColor == nil {
            self.textColor = type.color()
        }else{
            self.textColor = textColor
        }
        textAlignment = aligment
        configurationLabel()
        setText(text)
    }
    
    func setText(_ text:String?){
        self.text = text
        
    }
    
    private func configurationLabel(){
        self.font = Font.getFont(fontName: fontName, fontType: fontType, labelType: type)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}



class Font : UIFont{
    public static func getFont(fontName:FontName, fontType:FontType, labelType:LabelType) -> UIFont{
        switch fontName {
        case .segue:
            break
        case .roboto:
            break
        case .system:
            return getSystemFont(fontType: fontType, labelType:labelType)
        }
        return Font.systemFont(ofSize: labelType.rawValue)
    }
    
    private static func getSystemFont(fontType:FontType, labelType:LabelType) -> UIFont{
        switch fontType {
        case .bold:
            return UIFont.boldSystemFont(ofSize: labelType.rawValue)
        case .medium:
            return UIFont.systemFont(ofSize: labelType.rawValue, weight: UIFont.Weight.medium)
        case .regular:
            return UIFont.systemFont(ofSize: labelType.rawValue, weight: UIFont.Weight.regular)
        case .light:
            return UIFont.systemFont(ofSize: labelType.rawValue, weight: UIFont.Weight.thin)
        case .semilight:
            return UIFont.systemFont(ofSize: labelType.rawValue, weight: UIFont.Weight.light)
        default:
            return UIFont.systemFont(ofSize: labelType.rawValue)
        }
    }
}



public enum LabelType:CGFloat {
    /// size: 16pt
    case title = 16
    case standart = 12
    case info = 14
    

    func color() -> UIColor{
        switch self {
        case .standart:
            return Color.black1
        case .title:
          return  Color.gray1
        case .info:
          return  Color.placeholder
    }
  }
}

public enum FontName {
    case system
    case segue
    case roboto
}


public enum FontType {
    case light
    case semilight
    case bold
    case regular
    case medium
    case semibold
}


