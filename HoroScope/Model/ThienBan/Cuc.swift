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
    
    var name: String {
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
    
    func dayCuc() -> [Int] {
        switch self {
        case .ThuyNhiCuc:
            return element(start: 2)
        case .MocTamCuc:
            return element(start: 3)
        case .KimTuCuc:
            return element(start: 4)
        case .ThoNguCuc:
            return element(start: 5)
        case .HoaLucCuc:
            return element(start: 6)
        }
    }
    
    func element(start: Int) -> [Int] {
        let diff = 10
        let number = 12
        var sequence = [Int]()
        for i in 0..<number {
            let a = start + i*diff
            sequence.append(a)
        }
        return sequence
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
