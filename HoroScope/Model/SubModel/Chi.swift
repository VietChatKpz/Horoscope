//
//  Chi.swift
//  HoroScope
//
//  Created by Hai Nam on 23/4/24.
//

import Foundation

enum Chi: Int {
    case Ti = 0
    case Suu = 1
    case Dan = 2
    case Mao = 3
    case Thin = 4
    case Ty = 5
    case Ngo = 6
    case Mui = 7
    case Than = 8
    case Dau = 9
    case Tuat = 10
    case Hoi = 11
    
    static let list: [Chi] = [.Ti, .Suu, .Dan, .Mao, .Thin, .Ty, .Ngo, .Mui, .Than, .Dau, .Tuat, .Hoi]
    
    static func generateArray(startWith startChi: Chi, length: Int) -> [Chi] {
        let startIndex = startChi.rawValue
        var cycleArray: [Chi] = []
        
        for i in 0..<length {
            let index = (startIndex + i) % list.count
            cycleArray.append(list[index])
        }
        return cycleArray
    }
    
    func toString() -> String {
        switch self {
        case .Ti:
            return "Tí"
        case .Suu:
            return "Sửu"
        case .Dan:
            return "Dần"
        case .Mao:
            return "Mão"
        case .Thin:
            return "Thìn"
        case .Ty:
            return "Tỵ"
        case .Ngo:
            return "Ngọ"
        case .Mui:
            return "Mùi"
        case .Than:
            return "Thân"
        case .Dau:
            return "Dậu"
        case .Tuat:
            return "Tuất"
        case .Hoi:
            return "Hợi"
        }
    }
    
    func nguHanh() -> String {
        switch self {
        case .Ti:
            return "T"
        case .Suu:
            return "O"
        case .Dan:
            return "M"
        case .Mao:
            return "M"
        case .Thin:
            return "O"
        case .Ty:
            return "H"
        case .Ngo:
            return "H"
        case .Mui:
            return "O"
        case .Than:
            return "K"
        case .Dau:
            return "K"
        case .Tuat:
            return "O"
        case .Hoi:
            return "T"
        }
    }
    
    func menhChu() -> String {
        switch self {
        case .Ti:
            return "Tham Lang"
        case .Suu:
            return "Cự Môn"
        case .Dan:
            return "Lộc Tôn"
        case .Mao:
            return "Văn Khúc"
        case .Thin:
            return "Liêm Trinh"
        case .Ty:
            return "Vũ Khúc"
        case .Ngo:
            return "Phá Quân"
        case .Mui:
            return "Vũ Khúc"
        case .Than:
            return "Liêm Trinh"
        case .Dau:
            return "Văn Khúc"
        case .Tuat:
            return "Lộc Tôn"
        case .Hoi:
            return "Cự Môn"
        }
    }
    
    func thanChu() -> String {
        switch self {
        case .Ti:
            return "Linh Tinh"
        case .Suu:
            return "Thiên Tướng"
        case .Dan:
            return "Thiên Lương"
        case .Mao:
            return "Thiên Đồng"
        case .Thin:
            return "Văn Xương"
        case .Ty:
            return "Thiên Cơ"
        case .Ngo:
            return "Hỏa Tinh"
        case .Mui:
            return "Thiên Tướng"
        case .Than:
            return "Thiên Lương"
        case .Dau:
            return "Thiên Đồng"
        case .Tuat:
            return "Văn Xương"
        case .Hoi:
            return "Thiên Cơ"
        }
    }
}
