//
//  Cuc.swift
//  HoroScope
//
//  Created by VietChat on 26/4/24.
//

import UIKit

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
    
    var color: UIColor {
        switch self {
        case .ThuyNhiCuc:
            return NguHanhColor.Thuy.color
        case .MocTamCuc:
            return NguHanhColor.Moc.color
        case .KimTuCuc:
            return NguHanhColor.Kim.color
        case .ThoNguCuc:
            return NguHanhColor.Tho.color
        case .HoaLucCuc:
            return NguHanhColor.Hoa.color
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
        let menhCan: [Can : [Chi : CucType]] = [
            .Canh : [.Ti: .HoaLucCuc, .Suu: .HoaLucCuc, .Dan: .ThoNguCuc, .Mao: .ThoNguCuc, .Thin: .KimTuCuc, .Ty: .KimTuCuc, .Ngo: .MocTamCuc, .Mui: .MocTamCuc, .Than: .ThuyNhiCuc, .Dau: .ThuyNhiCuc, .Tuat: .ThoNguCuc, .Hoi: .ThoNguCuc],
            .Tan : [.Ti: .ThoNguCuc, .Suu: .ThoNguCuc, .Dan: .MocTamCuc, .Mao: .MocTamCuc, .Thin: .ThuyNhiCuc, .Ty: .ThuyNhiCuc, .Ngo: .KimTuCuc, .Mui: .KimTuCuc, .Than: .HoaLucCuc, .Dau: .HoaLucCuc, .Tuat: .MocTamCuc, .Hoi: .MocTamCuc],
            .Nham : [.Ti: .MocTamCuc, .Suu: .MocTamCuc, .Dan: .KimTuCuc, .Mao: .KimTuCuc, .Thin: .HoaLucCuc, .Ty: .HoaLucCuc, .Ngo: .ThuyNhiCuc, .Mui: .ThuyNhiCuc, .Than: .ThoNguCuc, .Dau: .ThoNguCuc, .Tuat: .KimTuCuc, .Hoi: .KimTuCuc],
            .Quy : [.Ti: .KimTuCuc, .Suu: .KimTuCuc, .Dan: .ThuyNhiCuc, .Mao: .ThuyNhiCuc, .Thin: .ThoNguCuc, .Ty: .ThoNguCuc, .Ngo: .HoaLucCuc, .Mui: .HoaLucCuc, .Than: .MocTamCuc, .Dau: .MocTamCuc, .Tuat: .ThuyNhiCuc, .Hoi: .ThuyNhiCuc],
            .Giap : [.Ti: .ThuyNhiCuc, .Suu: .ThuyNhiCuc, .Dan: .HoaLucCuc, .Mao: .HoaLucCuc, .Thin: .MocTamCuc, .Ty: .MocTamCuc, .Ngo: .ThoNguCuc, .Mui: .ThoNguCuc, .Than: .KimTuCuc, .Dau: .KimTuCuc, .Tuat: .HoaLucCuc, .Hoi: .HoaLucCuc],
            .At : [.Ti: .HoaLucCuc, .Suu: .HoaLucCuc, .Dan: .ThoNguCuc, .Mao: .ThoNguCuc, .Thin: .KimTuCuc, .Ty: .KimTuCuc, .Ngo: .MocTamCuc, .Mui: .MocTamCuc, .Than: .ThuyNhiCuc, .Dau: .ThuyNhiCuc, .Tuat: .ThoNguCuc, .Hoi: .ThoNguCuc],
            .Binh : [.Ti: .ThoNguCuc, .Suu: .ThoNguCuc, .Dan: .MocTamCuc, .Mao: .MocTamCuc, .Thin: .ThuyNhiCuc, .Ty: .ThuyNhiCuc, .Ngo: .KimTuCuc, .Mui: .KimTuCuc, .Than: .HoaLucCuc, .Dau: .HoaLucCuc, .Tuat: .MocTamCuc, .Hoi: .MocTamCuc],
            .Dinh : [.Ti: .MocTamCuc, .Suu: .MocTamCuc, .Dan: .KimTuCuc, .Mao: .KimTuCuc, .Thin: .HoaLucCuc, .Ty: .HoaLucCuc, .Ngo: .ThuyNhiCuc, .Mui: .ThuyNhiCuc, .Than: .ThoNguCuc, .Dau: .ThoNguCuc, .Tuat: .KimTuCuc, .Hoi: .KimTuCuc],
            .Mau : [.Ti: .KimTuCuc, .Suu: .KimTuCuc, .Dan: .ThuyNhiCuc, .Mao: .ThuyNhiCuc, .Thin: .ThoNguCuc, .Ty: .ThoNguCuc, .Ngo: .HoaLucCuc, .Mui: .HoaLucCuc, .Than: .MocTamCuc, .Dau: .MocTamCuc, .Tuat: .ThuyNhiCuc, .Hoi: .ThuyNhiCuc],
            .Ky : [.Ti: .ThuyNhiCuc, .Suu: .ThuyNhiCuc, .Dan: .HoaLucCuc, .Mao: .HoaLucCuc, .Thin: .MocTamCuc, .Ty: .MocTamCuc, .Ngo: .ThoNguCuc, .Mui: .ThoNguCuc, .Than: .KimTuCuc, .Dau: .KimTuCuc, .Tuat: .HoaLucCuc, .Hoi: .HoaLucCuc],
        ]
        cuc = menhCan[can]![menh]!
    }
}
