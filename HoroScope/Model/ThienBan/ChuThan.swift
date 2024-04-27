//
//  ChuThan.swift
//  HoroScope
//
//  Created by VietChat on 26/4/24.
//

import Foundation

enum ChuThan: Int {
    case LinhTinh = 0
    case ThienTuong = 1
    case ThienLuong = 2
    case ThienDong = 3
    case VanXuong = 4
    case ThienCo = 5
    case HoaTinh = 6
    
    static let chuThan: [ChuThan] = [.LinhTinh, .ThienTuong, .ThienLuong, .ThienDong, .VanXuong, .ThienCo, .HoaTinh, .ThienTuong, .ThienLuong, .ThienDong, .VanXuong, .ThienCo]
}
