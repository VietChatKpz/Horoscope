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
    var cungVi: Chi = .Ti
    var cungSao = ""
    var cungTuVi: [TuVi] = []
    var cungThienPhu: [ThienPhu] = []
    var trangSinh: TrangSinh = .TrangSinh
    
    init(cungVi: Chi, cungThan: AnThan, cungCuc: Int, trangSinh: TrangSinh) {
        self.cungVi = cungVi
        self.cungThan = cungThan
        self.cungCuc = cungCuc
        self.trangSinh = trangSinh
    }
}
