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
    
    var name: String {
        switch self {
        case .TuVi:
            return "Tử Vi"
        case .LiemTrinh:
            return "Liêm Trinh"
        case .ThienDong:
            return "Thiên Đồng"
        case .VuKhuc:
            return "Vũ Khúc"
        case .ThaiDuong:
            return "Thái Dương"
        case .ThienCo:
            return "Thiên Cơ"
        }
    }
    
    var color: UIColor {
        switch self {
        case .TuVi:
            return NguHanhColor.Tho.color
        case .LiemTrinh:
            return NguHanhColor.Hoa.color
        case .ThienDong:
            return NguHanhColor.Thuy.color
        case .VuKhuc:
            return NguHanhColor.Kim.color
        case .ThaiDuong:
            return NguHanhColor.Hoa.color
        case .ThienCo:
            return NguHanhColor.Moc.color
        }
    }
}

//MARK: K,1: Kim    M,2: Mộc    T,3: Thủy   H,4: Hỏa    O,5: Thổ
//MARK: Dương: 1    Âm: -1
