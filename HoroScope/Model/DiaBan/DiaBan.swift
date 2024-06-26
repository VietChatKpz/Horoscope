//
//  DiaBan.swift
//  HoroScope
//
//  Created by Hai Nam on 23/4/24.
//

import Foundation

class DiaBan {
    var id: Int
    var cungThan: AnThan = .Menh
    var cungCuc: Int = 0
    var cungViCan: Can = .Giap
    var cungVi: Chi = .Ti
    var cungSao = ""
    var cungTuVi: [TuVi] = []
    var cungThienPhu: [ThienPhu] = []
    var trangSinh: TrangSinh = .TrangSinh
    var locTon: LocTon = .LocTon
    var thaiTue: ThaiTue = .ThaiTue
    var saoThang: [SaoThang] = []
    var saoGio: [SaoGio] = []
    var saoKhac: [SaoKhac] = []
    var than: String = ""
    var saoTuoi: [SaoTuoi] = []
    var saoCanTuoi: [SaoThienCanTuoi] = []
    var tuHoa: [TuHoa] = []
    var tieuVan: Chi = .Ti
    var thangHan: Int = 0
    
    init(id: Int, cungVi: Chi, cungViCan: Can, cungThan: AnThan, cungCuc: Int, trangSinh: TrangSinh, locTon: LocTon, thaiTue: ThaiTue, tieuVan: Chi, thangHan: Int) {
        self.id = id
        self.cungVi = cungVi
        self.cungViCan = cungViCan
        self.cungThan = cungThan
        self.cungCuc = cungCuc
        self.trangSinh = trangSinh
        self.locTon = locTon
        self.thaiTue = thaiTue
        self.tieuVan = tieuVan
        self.thangHan = thangHan
    }
}
