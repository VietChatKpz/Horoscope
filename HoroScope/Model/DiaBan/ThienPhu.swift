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
    
    static let dacTinh: [ThienPhu : [String]] = [
        .ThienPhu : ["M","B","M","B","V","Đ","M","Đ","M","B","V","H"],
        .ThaiAm : ["V", "Đ", "H", "H", "H", "H", "H", "Đ", "V", "M",
                   "M", "M"],
        .ThamLang : ["H", "M", "Đ", "H", "V", "H", "H", "M", "Đ", "H",
                     "V", "H"],
        .CuMon : ["V", "H", "V", "M", "H", "H", "V", "H", "Đ", "M", "H",
                   "Đ"],
        .ThienTuong : ["V", "Đ", "M", "H", "V", "Đ", "V", "Đ", "M", "H",
                       "V", "Đ"],
        .ThienLuong : ["V", "Đ", "V", "V", "M", "H", "M", "Đ", "V", "H",
                       "M", "H"],
        .ThatSat : ["M", "Đ", "M", "H", "H", "V", "M", "Đ", "M", "H",
                    "H", "V"],
        .PhaQuan : ["M", "V", "H", "H", "Đ", "H", "M", "V", "H", "H",
                    "Đ", "H"]
    ]
}


