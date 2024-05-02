//
//  DiaBan.swift
//  HoroScope
//
//  Created by Hai Nam on 23/4/24.
//

import Foundation

class DiaBan {
    var cungThan: AnThan = .Menh
    var cungCuc: Int = 0
    var cungChi: Chi = .Ti
    var cungSao = ""
    
//    var list: [DiaBan] = []
    init(cungChi: Chi, cungThan: AnThan) {
        self.cungChi = cungChi
        self.cungThan = cungThan
    }
    
    init(cungCuc: Int) {
        self.cungCuc = cungCuc
    }
}
