//
//  TuHoa.swift
//  HoroScope
//
//  Created by VietChat on 10/5/24.
//

import UIKit

enum TuHoa: String {
    case HoaKhoa = "Hóa Khoa"
    case HoaQuyen = "Hóa Quyền"
    case HoaLoc = "Hóa Lộc"
    case HoaKy = "Hóa Kỷ"
    
    var vitri: Int {
        switch self {
        case .HoaKhoa:
            return 5
        case .HoaQuyen:
            return 4
        case .HoaLoc:
            return 3
        case .HoaKy:
            return 13
        }
    }
    
    var color: UIColor {
        switch self {
        case .HoaKhoa, .HoaQuyen, .HoaKy:
            return NguHanhColor.Thuy.color
        case .HoaLoc:
            return NguHanhColor.Moc.color
        }
    }
}
