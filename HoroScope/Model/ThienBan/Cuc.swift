//
//  Cuc.swift
//  HoroScope
//
//  Created by VietChat on 26/4/24.
//

import Foundation

class Cuc {
    let cuc: String
    
    init(menh: Chi, can: Can) {
        switch can {
        case .Giap, .Ky:
            switch menh {
            case .Ti, .Suu:
                cuc = "Thủy Nhị Cục"
            case .Dan, .Mao, .Tuat, .Hoi:
                cuc = "Hỏa Lục Cục"
            case .Thin, .Ty:
                cuc = "Mộc Tam Cục"
            case .Ngo, .Mui:
                cuc = "Thổ Ngũ Cục"
            case .Than, .Dau:
                cuc = "Kim Tứ Cục"
            }
        case .At, .Canh:
            switch menh {
            case .Ti, .Suu:
                cuc = "Hỏa Lục Cục"
            case .Dan, .Mao, .Tuat, .Hoi:
                cuc = "Thổ Ngũ Cục"
            case .Thin, .Ty:
                cuc = "Kim Tứ Cục"
            case .Ngo, .Mui:
                cuc = "Mộc Tam Cục"
            case .Than, .Dau:
                cuc = "Thủy Nhị Cục"
            }
        case .Binh, .Tan:
            switch menh {
            case .Ti, .Suu:
                cuc = "Thổ Ngũ Cục"
            case .Dan, .Mao, .Tuat, .Hoi:
                cuc = "Mộc Tam Cục"
            case .Thin, .Ty:
                cuc = "Thủy Nhị Cục"
            case .Ngo, .Mui:
                cuc = "Kim Tứ Cục"
            case .Than, .Dau:
                cuc = "Hỏa Lục Cục"
            }
        case .Dinh, .Nham:
            switch menh {
            case .Ti, .Suu:
                cuc = "Mộc Tam Cục"
            case .Dan, .Mao, .Tuat, .Hoi:
                cuc = "Kim Tứ Cục"
            case .Thin, .Ty:
                cuc = "Hỏa Lục Cục"
            case .Ngo, .Mui:
                cuc = "Thủy Nhị Cục"
            case .Than, .Dau:
                cuc = "Thổ Ngũ Cục"
            }
        case .Mau, .Quy:
            switch menh {
            case .Ti, .Suu:
                cuc = "Kim Tứ Cục"
            case .Dan, .Mao, .Tuat, .Hoi:
                cuc = "Thủy Nhị Cục"
            case .Thin, .Ty:
                cuc = "Thổ Ngũ Cục"
            case .Ngo, .Mui:
                cuc = "Hỏa Lục Cục"
            case .Than, .Dau:
                cuc = "Mộc Tam Cục"
            }
        }
    }
}
