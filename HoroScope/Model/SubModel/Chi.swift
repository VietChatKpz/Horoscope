//
//  Chi.swift
//  HoroScope
//
//  Created by Hai Nam on 23/4/24.
//

import Foundation

enum Chi: Int {
    case Ti = 0
    case Suu = 1
    case Dan = 2
    case Mao = 3
    case Thin = 4
    case Ty = 5
    case Ngo = 6
    case Mui = 7
    case Than = 8
    case Dau = 9
    case Tuat = 10
    case Hoi = 11
    
    static let list: [Chi] = [.Ti, .Suu, .Dan, .Mao, .Thin, .Ty, .Ngo, .Mui, .Than, .Dau, .Tuat, .Hoi]
    
    static func generateArray(startWith startChi: Chi, length: Int) -> [Chi] {
        let startIndex = startChi.rawValue
        var cycleArray: [Chi] = []
        
        for i in 0..<length {
            let index = (startIndex + i) % list.count
            cycleArray.append(list[index])
        }
        return cycleArray
    }
}
