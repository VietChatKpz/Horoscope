//
//  ThaiTue.swift
//  HoroScope
//
//  Created by VietChat on 4/5/24.
//

import UIKit

enum ThaiTue: Int {
    case ThaiTue = 0
    case ThieuDuong = 1
    case TangMon = 2
    case ThieuAm = 3
    case QuanPhu = 4
    case TuPhu = 5
    case TuePha = 6
    case LongDuc = 7
    case BachHo = 8
    case PhucDuc = 9
    case DieuKhach = 10
    case TrucPhu = 11
    
    var name: String {
        switch self {
        case .ThaiTue:
            return "Thái Tuế"
        case .ThieuDuong:
            return "Thiếu Dương"
        case .TangMon:
            return "Tang Môn"
        case .ThieuAm:
            return "Thiếu Âm"
        case .QuanPhu:
            return "Quan Phù"
        case .TuPhu:
            return "Tử Phù"
        case .TuePha:
            return "Tuệ Phá"
        case .LongDuc:
            return "Long Đức"
        case .BachHo:
            return "Bạch Hổ"
        case .PhucDuc:
            return "Phúc Đức"
        case .DieuKhach:
            return "Điếu Khách"
        case .TrucPhu:
            return "Trực Phù"
        }
    }
    
    static let list: [ThaiTue] = [.ThaiTue, .ThieuDuong, .TangMon, .ThieuAm, .QuanPhu, .TuPhu, .TuePha, .LongDuc, .BachHo, .PhucDuc, .DieuKhach, .TrucPhu]
    
    var color: UIColor {
        switch self {
        case .ThaiTue, .ThieuDuong, .QuanPhu, .TuePha, .DieuKhach:
            return NguHanhColor.Hoa.color
        case .TangMon:
            return NguHanhColor.Moc.color
        case .ThieuAm, .LongDuc:
            return NguHanhColor.Thuy.color
        case .TuPhu, .BachHo, .TrucPhu:
            return NguHanhColor.Kim.color
        case .PhucDuc:
            return NguHanhColor.Tho.color
        }
    }
    
    var vitri: Int {
        switch self {
        case .ThaiTue:
            return 15
        case .ThieuDuong, .ThieuAm, .LongDuc, .PhucDuc:
            return 5
        case .TangMon, .QuanPhu, .TuPhu, .TuePha, .BachHo, .DieuKhach:
            return 12
        case .TrucPhu:
            return 16
        }
    }
    
    static func generateArray(startWith startChi: ThaiTue) -> [ThaiTue] {
        let length = 12
        let startIndex = startChi.rawValue
        var cycleArray: [ThaiTue] = []
        
        for i in 0..<length {
            let index = (startIndex + i) % list.count
            cycleArray.append(list[index])
        }
        return cycleArray
    }
}
