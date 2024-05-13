//
//  SaoKhac.swift
//  HoroScope
//
//  Created by VietChat on 8/5/24.
//

import UIKit

enum SaoKhac: String {
    case DauQuan = "Đầu Quân"
    case ThienKhong = "Thiên Không"
    case ThienTai = "Thiên Tài"
    case ThienTho = "Thiên Thọ"
    case ThienQuy = "Thiên Quý"
    case AnQuang = "Ân Quang"
    case TamThai = "Tam Thái"
    case BatToa = "Bát Tọa"
    case ThienThuong = "Thiên Thương"
    case ThienSu = "Thiên Sứ"
    case ThienLa = "Thiên La"
    case DiaVong = "Địa Võng"
    case HoaTinh = "Hỏa Tinh"
    case LinhTinh = "Linh Tinh"
    
    var vitri: Int {
        switch self {
        case .DauQuan, .ThienTho:
            return 5
        case .ThienKhong, .HoaTinh, .LinhTinh:
            return 11
        case .ThienTai:
            return 2
        case .ThienQuy, .AnQuang:
            return 3
        case .TamThai, .BatToa:
            return 7
        case .ThienThuong, .ThienSu,. ThienLa, .DiaVong:
            return 12
        }
    }
    
    var color: UIColor {
        switch self {
        case .DauQuan, .HoaTinh, .LinhTinh:
            return NguHanhColor.Hoa.color
        case .ThienKhong, .BatToa, .ThienSu:
            return NguHanhColor.Thuy.color
        case .ThienTai, .ThienTho, .ThienQuy, .ThienThuong, .ThienLa, .DiaVong:
            return NguHanhColor.Tho.color
        case .AnQuang, .TamThai:
            return NguHanhColor.Moc.color
        }
    }
    
    var dacTinh: [String] {
        switch self {
        case .HoaTinh, .LinhTinh:
            return ["H", "H", "Đ", "Đ", "Đ", "Đ", "Đ", "H", "H", "H",
                    "H", "H"]
        default:
            return ["","","","","","","","","","","",""]
        }
    }
}
