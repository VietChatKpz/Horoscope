//
//  CungPhi.swift
//  HoroScope
//
//  Created by VietChat on 14/5/24.
//

import UIKit

enum CungPhi: String, CaseIterable {
    case Kham = "Khảm"
    case Chan = "Chấn"
    case Ton = "Tốn"
    case Ly = "Ly"
    case Can = "Càn"
    case Caan = "Cấn"
    case Khon = "Khôn"
    case Doai = "Đoài"
    
    var index: Int {
        switch self {
        case .Kham:
            return 1
        case .Chan:
            return 3
        case .Ton:
            return 4
        case .Ly:
            return 9
        case .Can:
            return 6
        case .Caan:
            return 8
        case .Khon:
            return 2
        case .Doai:
            return 7
        }
    }
    
    static func findCungPhi(_ year: Int, sex: Bool) -> CungPhi {
        let index = checkNam(year, sex: sex)
        return CungPhi.allCases.first { $0.index == index } ?? .Ly
    }
    
    static func checkNam(_ year: Int, sex: Bool) -> Int{
        if year < 2000 {
            if sex {
                return 10 - yearSingle(year)
            }else {
                return sumSingle(5, yearSingle(year))
            }
        }else {
            if sex {
                return 9 - yearSingle(year)
            }else {
                return sumSingle(6, yearSingle(year))
            }
        }
    }
    
    static func yearSingle(_ year: Int) -> Int {
        let lastYear = year % 100
        var sum = (lastYear / 10) + (lastYear % 10)
        while sum >= 10 {
            sum = (sum / 10) + (sum % 10)
        }
        return sum
    }
    
    static func sumSingle(_ int1: Int, _ int2: Int) -> Int {
        var sum = int1 + int2
        while sum >= 10 {
            sum = (sum / 10) + (sum % 10)
        }
        return sum
    }
    
    var color: UIColor {
        switch self {
        case .Kham:
            return NguHanhColor.Thuy.color
        case .Chan, .Ton:
            return NguHanhColor.Moc.color
        case .Ly:
            return NguHanhColor.Hoa.color
        case .Can, .Doai:
            return NguHanhColor.Kim.color
        case .Caan, .Khon:
            return NguHanhColor.Tho.color
        }
    }
}
