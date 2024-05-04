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
    var cungTuVi: [TuVi] = []
    var cungThienPhu: [ThienPhu] = []
    
    init(cungChi: Chi, cungThan: AnThan, cungCuc: Int) {
        self.cungChi = cungChi
        self.cungThan = cungThan
        self.cungCuc = cungCuc
    }
}
