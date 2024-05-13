//
//  ThienPhu.swift
//  HoroScope
//
//  Created by VietChat on 26/4/24.
//

import UIKit

enum ThienPhu: Int {
    case ThienPhu = 0
    case ThaiAm = 1
    case ThamLang = 2
    case CuMon = 3
    case ThienTuong = 4
    case ThienLuong = 5
    case ThatSat = 6
    case PhaQuan = 7
    
    static let list: [ThienPhu] = [.ThienPhu, .ThaiAm, .ThamLang, .CuMon, .ThienTuong, .ThienLuong, .ThatSat, .PhaQuan]
    
    var name: String {
        switch self {
        case .ThienPhu:
            return "Thiên Phủ"
        case .ThaiAm:
            return "Thái Âm"
        case .ThamLang:
            return "Tham Lang"
        case .CuMon:
            return "Cự Môn"
        case .ThienTuong:
            return "Thiên Tướng"
        case .ThienLuong:
            return "Thiên Lương"
        case .ThatSat:
            return "Thất Sát"
        case .PhaQuan:
            return "Phá Quân"
        }
    }
    
    var color: UIColor {
        switch self {
        case .ThienPhu:
            return NguHanhColor.Tho.color
        case .ThaiAm, .ThamLang, .CuMon, .ThienTuong, .PhaQuan:
            return NguHanhColor.Thuy.color
        case .ThienLuong:
            return NguHanhColor.Moc.color
        case .ThatSat:
            return NguHanhColor.Kim.color
        }
    }
    
    var dacTinh: [String] {
        switch self {
        case .ThienPhu:
            return ["M","B","M","B","V","Đ","M","Đ","M","B","V","H"]
        case .ThaiAm:
            return ["V", "Đ", "H", "H", "H", "H", "H", "Đ", "V", "M",
                    "M", "M"]
        case .ThamLang:
            return ["H", "M", "Đ", "H", "V", "H", "H", "M", "Đ", "H",
                    "V", "H"]
        case .CuMon:
            return ["V", "H", "V", "M", "H", "H", "V", "H", "Đ", "M", "H",
                    "Đ"]
        case .ThienTuong:
            return ["V", "Đ", "M", "H", "V", "Đ", "V", "Đ", "M", "H",
                    "V", "Đ"]
        case .ThienLuong:
            return ["V", "Đ", "V", "V", "M", "H", "M", "Đ", "V", "H",
                    "M", "H"]
        case .ThatSat:
            return ["M", "Đ", "M", "H", "H", "V", "M", "Đ", "M", "H",
                    "H", "V"]
        case .PhaQuan:
            return ["M", "V", "H", "H", "Đ", "H", "M", "V", "H", "H",
                    "Đ", "H"]
        }
    }
}


