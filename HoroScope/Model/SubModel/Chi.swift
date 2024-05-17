//
//  Chi.swift
//  HoroScope
//
//  Created by Hai Nam on 23/4/24.
//

import Foundation

enum Chi: Int, CaseIterable {
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
    
    static let listStartMenh: [Chi] = [.Dan, .Suu, .Ti, .Hoi, .Tuat, .Dau, .Than, .Mui, .Ngo, .Ti, .Thin, .Mao]
    
    static let listStartHoaTinh: [Chi] = [.Dan, .Mao, .Suu, .Dau]
    static let listStartLinhTinh: [Chi] = [.Tuat, .Tuat, .Mao, .Tuat]
    static let listTieuVan: [Int] = [10,7,4,1]
    
    
    static func generateArray(startWith startChi: Chi, reverse: Bool = false) -> [Chi] {
        return Constants.generateArray(startWith: startChi, reverse: reverse)
    }
    
    var name: String {
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
    
    //Mảng bao gồm [Mệnh Chủ, Thân Chủ]
    static let menhThanChu: [Chi: [String]] =
    [.Ti : ["Tham Lang", "Linh Tinh"],
     .Suu : ["Cự Môn", "Thiên Tướng"],
     .Dan : ["Lộc Tôn", "Thiên Lương"],
     .Mao : ["Văn Khúc", "Thiên Đồng"],
     .Thin : ["Liêm Trinh", "Văn Xương"],
     .Ty: ["Vũ Khúc", "Thiên Cơ"],
     .Ngo : ["Phá Quân", "Hỏa Tinh"],
     .Mui : ["Vũ Khúc", "Thiên Tướng"],
     .Than : ["Liêm Trinh", "Thiên Lương"],
     .Dau : ["Văn Khúc", "Thiên Đồng"],
     .Tuat : ["Lộc Tôn", "Văn Xương"],
     .Hoi : ["Cự Môn", "Thiên Cơ"]
    ]
    
    var index: Int {
        switch self {
        case .Ti, .Suu, .Ngo, .Mui:
            return 0
        case .Dan, .Mao, .Than, .Dau:
            return 1
        case .Thin, .Ty, .Tuat, .Hoi:
            return 2
        }
    }
}
