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
        case .ThaiAm:
            return NguHanhColor.Thuy.color
        case .ThamLang:
            return NguHanhColor.Thuy.color
        case .CuMon:
            return NguHanhColor.Thuy.color
        case .ThienTuong:
            return NguHanhColor.Thuy.color
        case .ThienLuong:
            return NguHanhColor.Moc.color
        case .ThatSat:
            return NguHanhColor.Kim.color
        case .PhaQuan:
            return NguHanhColor.Thuy.color
        }
    }
    
    var dacTinh: [String] {
        switch self {
        case .ThienPhu:
            return [
        case .ThaiAm:
            <#code#>
        case .ThamLang:
            <#code#>
        case .CuMon:
            <#code#>
        case .ThienTuong:
            <#code#>
        case .ThienLuong:
            <#code#>
        case .ThatSat:
            <#code#>
        case .PhaQuan:
            <#code#>
        }
    }
}

//MARK: K,1: Kim    M,2: Mộc    T,3: Thủy   H,4: Hỏa    O,5: Thổ
//MARK: Dương: 1    Âm: -1

//1: ["Tử vi", "B", "Đ", "M", "B", "V", "M", "M", "Đ", "M", "B", "V",
//            "B"],
//        2: ["Liêm trinh", "V", "Đ", "V", "H", "M", "H", "V", "Đ", "V", "H",
//            "M", "H"],
//        3: ["Thiên đồng", "V", "H", "M", "Đ", "H", "Đ", "H", "H", "M", "H",
//            "H", "Đ"],
//        4: ["Vũ khúc", "V", "M", "V", "Đ", "M", "H", "V", "M", "V", "Đ", "M",
//            "H"],
//        5: ["Thái dương", "H", "Đ", "V", "V", "V", "M", "M", "Đ", "H", "H",
//            "H", "H"],
//        6: ["Thiên cơ", "Đ", "Đ", "H", "M", "M", "V", "Đ", "Đ", "V", "M", "M",
//            "H"],
//        8: ["Thái âm", "V", "Đ", "H", "H", "H", "H", "H", "Đ", "V", "M",
//            "M", "M"],
//        9: ["Tham lang", "H", "M", "Đ", "H", "V", "H", "H", "M", "Đ", "H",
//            "V", "H"],
//        10: ["Cự môn", "V", "H", "V", "M", "H", "H", "V", "H", "Đ", "M", "H",
//             "Đ"],
//        11: ["Thiên tướng", "V", "Đ", "M", "H", "V", "Đ", "V", "Đ", "M", "H",
//             "V", "Đ"],
//        12: ["Thiên lương", "V", "Đ", "V", "V", "M", "H", "M", "Đ", "V", "H",
//             "M", "H"],
//        13: ["Thất sát", "M", "Đ", "M", "H", "H", "V", "M", "Đ", "M", "H",
//             "H", "V"],
//        14: ["Phá quân", "M", "V", "H", "H", "Đ", "H", "M", "V", "H", "H",
//             "Đ", "H"],

