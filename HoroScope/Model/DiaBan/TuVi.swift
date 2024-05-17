//
//  TuVi.swift
//  HoroScope
//
//  Created by VietChat on 26/4/24.
//

import UIKit

enum TuVi: Int {
    case TuVi = 0
    case LiemTrinh = 1
    case ThienDong = 2
    case VuKhuc = 3
    case ThaiDuong = 4
    case ThienCo = 5
    
    static let list: [TuVi] = [.TuVi, .LiemTrinh, .ThienDong, .VuKhuc, .ThaiDuong, .ThienCo]
    
    static let name: [TuVi: String] = [
        .TuVi : "Tử Vi",
        .LiemTrinh : "Liêm Trinh",
        .ThienDong : "Thiên Đồng",
        .VuKhuc : "Vũ Khúc",
        .ThaiDuong : "Thái Dương",
        .ThienCo : "Thiên Cơ"
    ]
    
    var color: UIColor {
        switch self {
        case .TuVi:
            return NguHanhColor.Tho.color
        case .LiemTrinh, .ThaiDuong:
            return NguHanhColor.Hoa.color
        case .ThienDong:
            return NguHanhColor.Thuy.color
        case .VuKhuc:
            return NguHanhColor.Kim.color
        case .ThienCo:
            return NguHanhColor.Moc.color
        }
    }
    
    static let dacTinh: [TuVi : [String]] = [
        .TuVi : ["B", "Đ", "M", "B", "V", "M", "M", "Đ", "M", "B", "V", "B"],
        .LiemTrinh : ["V", "Đ", "V", "H", "M", "H", "V", "Đ", "V", "H", "M", "H"],
        .ThienDong : ["V", "H", "M", "Đ", "H", "Đ", "H", "H", "M", "H",
                      "H", "Đ"],
        .VuKhuc : ["V", "M", "V", "Đ", "M", "H", "V", "M", "V", "Đ", "M",
                   "H"],
        .ThaiDuong : ["H", "Đ", "V", "V", "V", "M", "M", "Đ", "H", "H",
                      "H", "H"],
        .ThienCo : ["Đ", "Đ", "H", "M", "M", "V", "Đ", "Đ", "V", "M", "M",
                    "H"]
    ]
}

//MARK: K,1: Kim    M,2: Mộc    T,3: Thủy   H,4: Hỏa    O,5: Thổ
//MARK: Dương: 1    Âm: -1
