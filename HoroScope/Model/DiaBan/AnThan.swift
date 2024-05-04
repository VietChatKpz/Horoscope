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
    
    static func generateArray(startWith startChi: AnThan, length: Int) -> [AnThan] {
        let startIndex = startChi.rawValue
        var cycleArray: [AnThan] = []
        
        for i in 0..<length {
            let index = (startIndex + i) % list.count
            cycleArray.append(list[index])
        }
        return cycleArray
    }
    
    func toString() -> String {
        switch self {
        case .Menh:
            return "Mệnh"
        case .PhuMau:
            return "Phụ Mẫu"
        case .PhucDuc:
            return "Phúc Đức"
        case .DienTrach:
            return "Điền Trạch"
        case .QuanLoc:
            return "Quan Lộc"
        case .NoBoc:
            return "Nô Bộc"
        case .ThienDi:
            return "Thiên Di"
        case .TatAch:
            return "Tật Ách"
        case .TaiBach:
            return "Tài Bạch"
        case .TuTuc:
            return "Tử Tức"
        case .TheThiep:
            return "Thê Thiếp"
        case .HuynhDe:
            return "Huynh Đệ"
        }
    }
}
