//
//  Constants.swift
//  HoroScope
//
//  Created by VietChat on 25/4/24.
//

import UIKit

enum NguHanhColor {
    case Moc
    case Tho
    case Kim
    case Hoa
    case Thuy
    
    var color: UIColor {
        switch self {
        case .Moc:
            return UIColor.hexStringToUIColor(hex: "0A5C36")
        case .Tho:
            return UIColor.hexStringToUIColor(hex: "FFD400")
        case .Kim:
            return UIColor.hexStringToUIColor(hex: "C0C0C0")
        case .Hoa:
            return UIColor.hexStringToUIColor(hex: "EB442C")
        case .Thuy:
            return UIColor.hexStringToUIColor(hex: "808080")
        }
    }
}

class Constants {
    static let nguHanhColor: [NguHanhColor] = [.Moc, .Kim, .Thuy, .Hoa, .Tho]
    static let widthScreen = 1024.0
    static let heightScreen = 1322.0
    
    static func canChiColor(canIndex: Int, chiIndex: Int) -> UIColor {
        let total = (canIndex + chiIndex) % Constants.nguHanhColor.count
        let color = Constants.nguHanhColor[total]
        return color.color
    }
    
    static func labelColor(canIndex: Int, chiIndex: Int, text: String) -> UILabel {
        let color = Constants.canChiColor(canIndex: canIndex, chiIndex: chiIndex)
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.foregroundColor, value: color, range: NSRange(location: 0, length: text.count))
        
        let label = UILabel()
        label.attributedText = attributedString
        return label
    }
    static let colorButton = UIColor.hexStringToUIColor(hex: "D83842")
    static let colorButtonAlpha = UIColor.hexStringToUIColor(hex: "D83842").withAlphaComponent(0.3)
    static let colorBorder = UIColor.hexStringToUIColor(hex: "D83842").withAlphaComponent(0.3).cgColor
    static let colorDefault = UIColor.hexStringToUIColor(hex: "161616")
    
    static func generateArray<T: CaseIterable & RawRepresentable>(startWith startValue: T, reverse: Bool = false) -> [T] where T.RawValue == Int {
        let length = 12
        let count = T.allCases.count
        let startIndex = startValue.rawValue
        var cycleArray: [T] = []
        
        for i in 0..<length {
            let index = reverse ? (startIndex - i + count) % count : (startIndex + i) % count
            cycleArray.append(T(rawValue: index)!)
        }
        return cycleArray
    }
}

extension UIColor {
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
