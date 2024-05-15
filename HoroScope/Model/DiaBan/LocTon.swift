//
//  LocTon.swift
//  HoroScope
//
//  Created by VietChat on 7/5/24.
//

import UIKit

enum LocTon: Int {
    case LocTon = 12
    case BacSi = 0
    case LucSi = 1
    case ThanhLong = 2
    case TieuHao = 3
    case TuongQuan = 4
    case TauPhu = 5
    case PhiLiem = 6
    case HyThan = 7
    case BenhPhu = 8
    case DaiHao = 9
    case PhucBinh = 10
    case QuanPhu = 11
    
    var name: String {
        switch self {
        case .LocTon:
            return "Lộc Tồn"
        case .BacSi:
            return "Bác Sĩ"
        case .LucSi:
            return "Lực Sĩ"
        case .ThanhLong:
            return "Thanh Long"
        case .TieuHao:
            return "Tiểu Hao"
        case .TuongQuan:
            return "Tướng Quân"
        case .TauPhu:
            return "Tấu Thư"
        case .PhiLiem:
            return "Phi Liêm"
        case .HyThan:
            return "Hỷ Thần"
        case .BenhPhu:
            return "Bệnh Phù"
        case .DaiHao:
            return "Đại Hao"
        case .PhucBinh:
            return "Phục Binh"
        case .QuanPhu:
            return "Quan Phù"
        }
    }
    
    var vitri: Int {
        switch self {
        case .LocTon, .TauPhu:
            return 3
        case .BacSi, .ThanhLong, .HyThan:
            return 5
        case .LucSi, .PhiLiem:
            return 2
        case .TieuHao, .BenhPhu, .DaiHao, .QuanPhu:
            return 12
        case .TuongQuan:
            return 4
        case .PhucBinh:
            return 13

        }
    }
    
    var color: UIColor {
        switch self {
        case .LocTon, .BenhPhu:
            return NguHanhColor.Tho.color
        case .BacSi, .ThanhLong:
            return NguHanhColor.Thuy.color
        case .LucSi, .TieuHao, .PhiLiem, .HyThan, .DaiHao, .PhucBinh, .QuanPhu:
            return NguHanhColor.Hoa.color
        case .TuongQuan:
            return NguHanhColor.Moc.color
        case .TauPhu:
            return NguHanhColor.Kim.color
        }
    }
    
    static let list: [LocTon] = [.BacSi, .LucSi, .ThanhLong, .TieuHao, .TuongQuan, .TauPhu, .PhiLiem, .HyThan, .BenhPhu, .DaiHao, .PhucBinh, .QuanPhu]
    static let locTonStartList: [LocTon] = [.TuongQuan, .TieuHao, .LucSi, .BacSi, .PhucBinh, .DaiHao, .HyThan, .PhiLiem, .HyThan, .PhiLiem]
    static let locTonStartReversedList: [LocTon] = [.BenhPhu, .DaiHao, .QuanPhu, .BacSi, .ThanhLong, .TieuHao, .TauPhu, .PhiLiem, .TauPhu, .PhiLiem]
    
    static func generateArray(startWith startChi: LocTon, reverse: Bool = false) -> [LocTon] {
        let length = 12
        let startIndex = startChi.rawValue
        var resultArray: [LocTon] = []
        
        for i in 0..<length {
            let index: Int
            if reverse {
                index = (startIndex - i + list.count) % list.count
            } else {
                index = (startIndex + i) % list.count
            }
            resultArray.append(list[index])
        }
        return resultArray
    }
}
