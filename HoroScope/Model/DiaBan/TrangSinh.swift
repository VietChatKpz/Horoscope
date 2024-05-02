//
//  TrangSinh.swift
//  HoroScope
//
//  Created by VietChat on 26/4/24.
//

import Foundation

enum TrangSinh: Int {
    case TrangSinh = 0
    case Duong = 1
    case Thai = 2
    case SaoTuyet = 3
    case Mo = 4
    case Tu = 5
    case Benh = 6
    case Suy = 7
    case DeVuong = 8
    case LamQuang = 9
    case QuangDoi = 10
    case MocDuc = 11
    
    static let list: [TrangSinh] = [.TrangSinh, .Duong, .Thai, .SaoTuyet, .Mo, .Tu, .Benh, .Suy, .DeVuong, .LamQuang, .QuangDoi, .MocDuc]
    
    static func generateArray(startWith startChi: TrangSinh, length: Int) -> [TrangSinh] {
        let startIndex = startChi.rawValue
        var cycleArray: [TrangSinh] = []
        
        for i in 0..<length {
            let index = (startIndex + i) % list.count
            cycleArray.append(list[index])
        }
        return cycleArray
    }
}
