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
}

//MARK: K,1: Kim    M,2: Mộc    T,3: Thủy   H,4: Hỏa    O,5: Thổ
//MARK: Dương: 1    Âm: -1
