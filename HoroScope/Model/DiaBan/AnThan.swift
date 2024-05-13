//
//  AnThan.swift
//  HoroScope
//
//  Created by VietChat on 26/4/24.
//

import Foundation

enum AnThan: Int {
    case Menh = 0
    case PhuMau = 1
    case PhucDuc = 2
    case DienTrach = 3
    case QuanLoc = 4
    case NoBoc = 5
    case ThienDi = 6
    case TatAch = 7
    case TaiBach = 8
    case TuTuc = 9
    case TheThiep = 10
    case HuynhDe = 11
    
    static let list: [AnThan] = [.Menh, .PhuMau, .PhucDuc, .DienTrach, .QuanLoc, .NoBoc, .ThienDi, .TatAch, .TaiBach, .TuTuc, .TheThiep, .HuynhDe]
    
    static func generateArray(startWith startChi: AnThan) -> [AnThan] {
        let length = 12
        let startIndex = startChi.rawValue
        var cycleArray: [AnThan] = []
        
        for i in 0..<length {
            let index = (startIndex + i) % list.count
            cycleArray.append(list[index])
        }
        return cycleArray
    }
    
    var name: String {
        switch self {
        case .Menh:
            return "MỆNH"
        case .PhuMau:
            return "PHỤ MẪU"
        case .PhucDuc:
            return "PHÚC ĐỨC"
        case .DienTrach:
            return "ĐIỀN TRẠCH"
        case .QuanLoc:
            return "QUAN LỘC"
        case .NoBoc:
            return "NÔ BỘC"
        case .ThienDi:
            return "THIÊN DI"
        case .TatAch:
            return "TẬT ÁCH"
        case .TaiBach:
            return "TÀI BẠCH"
        case .TuTuc:
            return "TỬ TỨC"
        case .TheThiep:
            return "THÊ THIẾP"
        case .HuynhDe:
            return "HUYNH ĐỆ"
        }
    }
}
