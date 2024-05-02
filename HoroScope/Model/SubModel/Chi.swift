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

struct DiaChi {
    let id: Int
    let tenChi: String
    let tenHanh: String
    let menhChu: String
    let thanChu: String
}

let listDiaChi: [DiaChi] = [
    DiaChi(id: 1, tenChi: "Tý", tenHanh: "T", menhChu: "Tham Lang", thanChu: "Linh Tinh"),
    DiaChi(id: 2, tenChi: "Sửu", tenHanh: "O", menhChu: "Cự Môn", thanChu: "Thiên Tướng"),
    DiaChi(id: 3, tenChi: "Dần", tenHanh: "M", menhChu: "Lộc Tôn", thanChu: "Thiên Lương"),
    DiaChi(id: 4, tenChi: "Mão", tenHanh: "M", menhChu: "Văn Khúc", thanChu: "Thiên Đồng"),
    DiaChi(id: 5, tenChi: "Thìn", tenHanh: "O", menhChu: "Liêm Trinh", thanChu: "Văn Xương"),
    DiaChi(id: 6, tenChi: "Tỵ", tenHanh: "H", menhChu: "Vũ Khúc", thanChu: "Thiên Cơ"),
    DiaChi(id: 7, tenChi: "Ngọ", tenHanh: "H", menhChu: "Phá Quân", thanChu: "Hỏa Tinh"),
    DiaChi(id: 8, tenChi: "Mùi", tenHanh: "O", menhChu: "Vũ Khúc", thanChu: "Thiên Tướng"),
    DiaChi(id: 9, tenChi: "Thân", tenHanh: "K", menhChu: "Liêm Trinh", thanChu: "Thiên Lương"),
    DiaChi(id: 10, tenChi: "Dậu", tenHanh: "K", menhChu: "Văn Khúc", thanChu: "Thiên Đồng"),
    DiaChi(id: 11, tenChi: "Tuất", tenHanh: "O", menhChu: "Lộc Tôn", thanChu: "Văn Xương"),
    DiaChi(id: 12, tenChi: "Hợi", tenHanh: "T", menhChu: "Cự Môn", thanChu: "Thiên Cơ")
]
