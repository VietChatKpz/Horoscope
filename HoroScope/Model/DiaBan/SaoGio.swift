//
//  SaoGio.swift
//  HoroScope
//
//  Created by VietChat on 7/5/24.
//

import UIKit

enum SaoGio: String {
    case VanXuong = "Văn Xương"
    case VanKhuc = "Văn Khúc"
    case DiaKhong = "Địa Không"
    case DiaKhiep = "Địa Khiếp"
    case ThaiPhu = "Thai Phụ"
    case PhongCao = "Phong Cáo"
    
    var vitri: Int {
        switch self {
        case .VanXuong, .VanKhuc, .ThaiPhu:
            return 6
        case .DiaKhong, .DiaKhiep:
            return 11
        case .PhongCao:
            return 4
        }
    }
    
    var vitriDiaBan: [Int] {
        switch self {
        case .VanXuong:
            return [10,9,8,7,6,5,4,3,2,1,0,11]
        case .VanKhuc:
            return [4,5,6,7,8,9,10,11,0,1,2,3]
        case .DiaKhong:
            return [11,10,9,8,7,6,5,4,3,2,1,0]
        case .DiaKhiep:
            return [11,0,1,2,3,4,5,6,7,8,9,10]
        case .ThaiPhu:
            return [6,7,8,9,10,11,0,1,2,3,4,5]
        case .PhongCao:
            return [2,3,4,5,6,7,8,9,10,11,0,1]
        }
    }
    
    var color: UIColor {
        switch self {
        case .VanXuong, .ThaiPhu:
            return NguHanhColor.Kim.color
        case .VanKhuc:
            return NguHanhColor.Thuy.color
        case .DiaKhong, .DiaKhiep:
            return NguHanhColor.Hoa.color
        case .PhongCao:
            return NguHanhColor.Tho.color
        }
    }
    
    var dacTinh: [String] {
        switch self {
        case .VanXuong, .VanKhuc:
            return ["H", "Đ", "H", "Đ", "H", "Đ", "H", "Đ", "H", "H",
                    "Đ", "Đ"]
        case .DiaKhong, .DiaKhiep:
            return ["H", "H", "Đ", "H", "H", "Đ", "H", "H", "Đ", "H",
                    "H", "Đ"]
        case .ThaiPhu, .PhongCao:
            return ["","","","","","","","","","","",""]
        }
    }
}
