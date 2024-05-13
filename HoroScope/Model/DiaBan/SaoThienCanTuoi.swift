//
//  SaoThienCanTuoi.swift
//  HoroScope
//
//  Created by VietChat on 9/5/24.
//

import UIKit

enum SaoThienCanTuoi: String {
    case DaLa = "Đà La"
    case KinhDuong = "Kinh Dương"
    case LuuHa = "Lưu Hà"
    case QuocAn = "Quốc Ấn"
    case DuongPhu = "Đường Phù"
    case VanTinh = "Văn Tinh"
    case ThienKhoi = "Thiên Khôi"
    case ThienViet = "Thiên Việt"
    case ThienQuan = "Thiên Quan"
    case ThienPhuc = "Thiên Phúc"
    case ThienTru = "Thiên Trù"
    
    var color: UIColor {
        switch self {
        case .DaLa, .KinhDuong:
            return NguHanhColor.Kim.color
        case .LuuHa:
            return NguHanhColor.Thuy.color
        case .QuocAn, .ThienTru:
            return NguHanhColor.Tho.color
        case .DuongPhu:
            return NguHanhColor.Moc.color
        case .VanTinh, .ThienKhoi, .ThienViet, .ThienQuan, .ThienPhuc:
            return NguHanhColor.Hoa.color        }
    }
    
    var vitri: Int {
        switch self {
        case .DaLa, .KinhDuong:
            return 11
        case .LuuHa:
            return 12
        case .QuocAn, .VanTinh, .ThienKhoi, .ThienViet:
            return 6
        case .DuongPhu:
            return 4
        case .ThienQuan, .ThienPhuc, .ThienTru:
            return 5
        }
    }
    
    var vitriDiaBan: [Int] {
        switch self {
        case .DaLa:
            return [7,8,10,11,1,2,4,5,4,5]
        case .KinhDuong:
            return [9,10,0,1,3,4,6,7,6,7]
        case .LuuHa:
            return [8,3,11,2,9,10,7,4,5,6]
        case .QuocAn:
            return [4,5,7,8,10,11,1,2,1,2]
        case .DuongPhu:
            return [1,2,4,5,7,8,10,11,10,11]
        case .VanTinh:
            return [11,0,9,3,5,6,8,9,8,9]
        case .ThienKhoi:
            return [6,6,3,3,1,0,11,11,1,0]
        case .ThienViet:
            return [2,2,5,5,7,8,9,9,7,8]
        case .ThienQuan:
            return [11,9,10,6,7,8,5,2,3,9]
        case .ThienPhuc:
            return [6,5,6,5,9,8,0,11,3,2]
        case .ThienTru:
            return [2,6,9,10,5,6,0,5,6,8]
        }
    }
}
