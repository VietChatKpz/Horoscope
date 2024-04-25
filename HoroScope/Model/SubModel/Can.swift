//
//  Can.swift
//  HoroScope
//
//  Created by Hai Nam on 23/4/24.
//

import Foundation

enum Can: Int {
    case Canh = 0
    case Tan = 1
    case Nham = 2
    case Quy = 3
    case Giap = 4
    case At = 5
    case Binh = 6
    case Dinh = 7
    case Mau = 8
    case Ky = 9
    
    static let list: [Can] = [.Canh, .Tan, .Nham, .Quy, .Giap, .At, .Binh, .Dinh, .Mau, .Ky]
    
    static func generateArray(startWith startCan: Can, length: Int) -> [Can] {
        let startIndex = startCan.rawValue
        var cycleArray: [Can] = []
        
        for i in 0..<length {
            let index = (startIndex + i) % list.count
            cycleArray.append(list[index])
        }
        return cycleArray
    }
}
