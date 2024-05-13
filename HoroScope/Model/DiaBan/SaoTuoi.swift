//
//  SaoTuoi.swift
//  HoroScope
//
//  Created by VietChat on 9/5/24.
//

import UIKit

enum SaoTuoi: String {
    case PhuongCac = "Phượng Các"
    case GiaiThan = "Giải Thần"
    case LongTri = "Thiên Trì"
    case NguyetDuc = "Nguyệt Đức"
    case ThienDuc = "Thiên Đức"
    case ThienHy = "Thiên Hỷ"
    case ThienMa = "Thiên Mã"
    case ThienKhoc = "Thiên Khốc"
    case ThienHu = "Thiên Hư"
    case DaoHoa = "Đào Hoa"
    case HongLoan = "Hồng Loan"
    case HoaCai = "Hoa Cái"
    case KiepSat = "Kiếp Sát"
    case PhaToai = "Phá Toái"
    case CoThan = "Cô Thần"
    case QuaTu = "Quả Tú"
    
    var color: UIColor {
        switch self {
        case .PhuongCac, .CoThan, .QuaTu:
            return NguHanhColor.Tho.color
        case .GiaiThan, .DaoHoa:
            return NguHanhColor.Moc.color
        case .LongTri, .ThienHy, .ThienKhoc, .ThienHu, .HongLoan:
            return NguHanhColor.Thuy.color
        case .NguyetDuc, .ThienDuc, .ThienMa, .KiepSat, .PhaToai:
            return NguHanhColor.Hoa.color
        case .HoaCai:
            return NguHanhColor.Kim.color
        }
    }
    
    var vitri: Int {
        switch self {
        case .PhuongCac, .LongTri, .ThienMa:
            return 3
        case .GiaiThan, .NguyetDuc, .ThienDuc, .ThienHy:
            return 5
        case .ThienKhoc, .ThienHu, .PhaToai:
            return 12
        case .DaoHoa, .HongLoan:
            return 8
        case .HoaCai:
            return 14
        case .KiepSat:
            return 11
        case .CoThan, .QuaTu:
            return 13
        }
    }
    
    var vitriDiaBan: [Int] {
        switch self {
        case .PhuongCac, .GiaiThan:
            return [10,9,8,7,6,5,4,3,2,1,0,11]
        case .LongTri:
            return [4,5,6,7,8,9,10,11,0,1,2,3]
        case .NguyetDuc:
            return [5,6,7,8,9,10,11,0,1,2,3,4]
        case .ThienDuc:
            return [9,10,11,0,1,2,3,4,5,6,7,8]
        case .ThienHy:
            return [9,8,7,6,5,4,3,2,1,0,11,10]
        case .ThienMa:
            return [2,11,8,5,2,11,8,5,2,11,8,5]
        case .ThienKhoc:
            return [6,5,4,3,2,1,0,11,10,9,8,7]
        case .ThienHu:
            return [6,7,8,9,10,11,0,1,2,3,4,5]
        case .DaoHoa:
            return [9,6,3,0,9,6,3,0,9,6,3,0]
        case .HongLoan:
            return [3,2,1,0,11,10,9,8,7,6,5,4]
        case .HoaCai:
            return [4,1,10,7,4,1,10,7,4,1,10,7]
        case .KiepSat:
            return [5,2,11,8,5,2,11,8,5,2,11,8]
        case .PhaToai:
            return [5,1,9,5,1,9,5,1,9,5,1,9]
        case .CoThan:
            return [2,2,5,5,5,8,8,8,11,11,11,2]
        case .QuaTu:
            return [10,10,1,1,1,4,4,4,7,7,7,10]
        }
    }
}
