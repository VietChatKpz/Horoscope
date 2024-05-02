//
//  Cuc.swift
//  HoroScope
//
//  Created by VietChat on 26/4/24.
//

import Foundation

enum CucType: Int {
    case ThuyNhiCuc = 2
    case MocTamCuc = 3
    case KimTuCuc = 4
    case ThoNguCuc = 5
    case HoaLucCuc = 6
    
    func tenCuc() -> String {
        switch self {
        case .ThuyNhiCuc:
            return "Thủy Nhị Cục"
        case .MocTamCuc:
            return "Mộc Tam Cục"
        case .KimTuCuc:
            return "Kim Tứ Cục"
        case .ThoNguCuc:
            return "Thổ Ngũ Cục"
        case .HoaLucCuc:
            return "Hỏa Lục Cục"
        }
    }
}

class Cuc {
    let cuc: CucType
    
    init(menh: Chi, can: Can) {
        switch can {
        case .Giap, .Ky:
            switch menh {
            case .Ti, .Suu:
                cuc = .ThuyNhiCuc
            case .Dan, .Mao, .Tuat, .Hoi:
                cuc = .HoaLucCuc
            case .Thin, .Ty:
                cuc = .MocTamCuc
            case .Ngo, .Mui:
                cuc = .ThoNguCuc
            case .Than, .Dau:
                cuc = .KimTuCuc
            }
        case .At, .Canh:
            switch menh {
            case .Ti, .Suu:
                cuc = .HoaLucCuc
            case .Dan, .Mao, .Tuat, .Hoi:
                cuc = .ThoNguCuc
            case .Thin, .Ty:
                cuc = .KimTuCuc
            case .Ngo, .Mui:
                cuc = .MocTamCuc
            case .Than, .Dau:
                cuc = .ThuyNhiCuc
            }
        case .Binh, .Tan:
            switch menh {
            case .Ti, .Suu:
                cuc = .ThoNguCuc
            case .Dan, .Mao, .Tuat, .Hoi:
                cuc = .MocTamCuc
            case .Thin, .Ty:
                cuc = .ThuyNhiCuc
            case .Ngo, .Mui:
                cuc = .KimTuCuc
            case .Than, .Dau:
                cuc = .HoaLucCuc
            }
        case .Dinh, .Nham:
            switch menh {
            case .Ti, .Suu:
                cuc = .MocTamCuc
            case .Dan, .Mao, .Tuat, .Hoi:
                cuc = .KimTuCuc
            case .Thin, .Ty:
                cuc = .HoaLucCuc
            case .Ngo, .Mui:
                cuc = .ThuyNhiCuc
            case .Than, .Dau:
                cuc = .ThoNguCuc
            }
        case .Mau, .Quy:
            switch menh {
            case .Ti, .Suu:
                cuc = .KimTuCuc
            case .Dan, .Mao, .Tuat, .Hoi:
                cuc = .ThuyNhiCuc
            case .Thin, .Ty:
                cuc = .ThoNguCuc
            case .Ngo, .Mui:
                cuc = .HoaLucCuc
            case .Than, .Dau:
                cuc = .MocTamCuc
            }
        }
    }
}
