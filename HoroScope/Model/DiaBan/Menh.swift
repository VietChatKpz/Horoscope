//
//  Menh.swift
//  HoroScope
//
//  Created by VietChat on 26/4/24.
//

import Foundation

class Menh {
    let mmLunar: Int
    let chi: Chi
    
    init(mmLunar: Int, chi: Chi) {
        self.mmLunar = mmLunar
        self.chi = chi
    }
    
    init(with mmLunar: Int, chi: Chi) {
        self.mmLunar = mmLunar
        switch chi {
        case .Ti:
            self.chi = Chi.generateArray(startWith: .Dan, length: 12)[mmLunar-1]
        case .Suu:
            self.chi = Chi.generateArray(startWith: .Suu, length: 12)[mmLunar-1]
        case .Dan:
            self.chi = Chi.generateArray(startWith: .Ti, length: 12)[mmLunar-1]
        case .Mao:
            self.chi = Chi.generateArray(startWith: .Hoi, length: 12)[mmLunar-1]
        case .Thin:
            self.chi = Chi.generateArray(startWith: .Tuat, length: 12)[mmLunar-1]
        case .Ty:
            self.chi = Chi.generateArray(startWith: .Dau, length: 12)[mmLunar-1]
        case .Ngo:
            self.chi = Chi.generateArray(startWith: .Than, length: 12)[mmLunar-1]
        case .Mui:
            self.chi = Chi.generateArray(startWith: .Mui, length: 12)[mmLunar-1]
        case .Than:
            self.chi = Chi.generateArray(startWith: .Ngo, length: 12)[mmLunar-1]
        case .Dau:
            self.chi = Chi.generateArray(startWith: .Ti, length: 12)[mmLunar-1]
        case .Tuat:
            self.chi = Chi.generateArray(startWith: .Thin, length: 12)[mmLunar-1]
        case .Hoi:
            self.chi = Chi.generateArray(startWith: .Mao, length: 12)[mmLunar-1]
        }
    }
}
