//
//  SaoThang.swift
//  HoroScope
//
//  Created by VietChat on 7/5/24.
//

import UIKit

enum SaoThang: String {
    case TaPhu = "Tả Phụ"
    case HuuBat = "Hữu Bật"
    case ThienHinh = "Thiên Hình"
    case ThienRieu = "Thiên Riêu"
    case ThienY = "Thiên Y"
    case ThienGiai = "Thiên Giải"
    case DiaGiai = "Địa Giải"
    
    var vitri: Int {
        switch self {
        case .TaPhu, .HuuBat:
            return 2
        case .ThienHinh:
            return 15
        case .ThienRieu:
            return 13
        case .ThienY, .ThienGiai, .DiaGiai:
            return 5
        }
    }
    
    var vitriDiaBan: [Int] {
        switch self {
        case .TaPhu:
            return [4,5,6,7,8,9,10,11,0,1,2,3]
        case .HuuBat:
            return [10,9,8,7,6,5,4,3,2,1,0,11]
        case .ThienHinh:
            return [9,10,11,0,1,2,3,4,5,6,7,8]
        case .ThienRieu, .ThienY:
            return [1,2,3,4,5,6,7,8,9,10,11,0]
        case .ThienGiai:
            return [8,9,10,11,0,1,2,3,4,5,6,7]
        case .DiaGiai:
            return [7,8,9,10,11,0,1,2,3,4,5,6]
        }
    }
    
    var color: UIColor {
        switch self {
        case .TaPhu, .HuuBat:
            return NguHanhColor.Tho.color
        case .ThienHinh, .ThienGiai:
            return NguHanhColor.Hoa.color
        case .ThienRieu, .ThienY:
            return NguHanhColor.Thuy.color
        case .DiaGiai:
            return NguHanhColor.Moc.color
        }
    }
    
    var dacTinh: [String] {
        switch self {
        case .TaPhu, .HuuBat, .ThienY, .ThienGiai, .DiaGiai:
            return ["","","","","","","","","","","",""]
        case .ThienHinh:
            return ["", "", "Đ", "Đ", "", "", "", "", "Đ",
                    "Đ", "", ""]
        case .ThienRieu:
            return ["", "", "Đ", "Đ", "", "", "", "", "",
                    "Đ", "Đ", ""]
        }
    }
}
