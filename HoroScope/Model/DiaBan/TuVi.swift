//
//  TuVi.swift
//  HoroScope
//
//  Created by VietChat on 26/4/24.
//

import Foundation

enum TuVi: Int {
    case TuVi = 0
    case LiemTrinh = 1
    case ThienDong = 2
    case VuKhuc = 3
    case ThaiDuong = 4
    case ThienCo = 5
    
    static let list: [TuVi] = [.TuVi, .LiemTrinh, .ThienDong, .VuKhuc, .ThaiDuong, .ThienCo]
    
    func toString() -> String {
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
}
