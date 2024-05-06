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
    static let nguHanhColor: [NguHanhColor] = [.Moc, .Hoa, .Kim, .Thuy, .Tho]
//    static let mocColor = UIColor.hexStringToUIColor(hex: "0A5C36")
//    static let thoColor = UIColor.hexStringToUIColor(hex: "FFD400")
//    static let kimColor = UIColor.hexStringToUIColor(hex: "C0C0C0")
//    static let hoaColor = UIColor.hexStringToUIColor(hex: "EB442C")
//    static let thuyColor = UIColor.hexStringToUIColor(hex: "808080")
    
    static func canChiColor(canIndex: Int, chiIndex: Int) -> UIColor {
        let total = (canIndex + chiIndex) % Constants.nguHanhColor.count
        let color = Constants.nguHanhColor[total]
        return color.color
//        if total > 5 {
//            total = total - 5
//        }
//        if total == 1 {
//            return Constants.kimColor
//        }else if total == 2 {
//            return Constants.thuyColor
//        }else if total == 3 {
//            return Constants.hoaColor
//        }else if total == 4 {
//            return Constants.thoColor
//        }else if total == 5 {
//            return Constants.mocColor
//        }else {
//            return .cyan
//        }
    }
    
    static func labelColor(canIndex: Int, chiIndex: Int, text: String) -> UILabel {
        let color = Constants.canChiColor(canIndex: canIndex, chiIndex: chiIndex)
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.foregroundColor, value: color, range: NSRange(location: 0, length: text.count))
        
        let label = UILabel()
        label.attributedText = attributedString
        return label
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
