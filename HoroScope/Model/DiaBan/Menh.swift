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
        self.chi = Chi.generateArray(startWith: Chi.listStartMenh[chi.rawValue])[mmLunar - 1]
    }
}
