//
//  Sao.swift
//  HoroScope
//
//  Created by VietChat on 26/4/24.
//

import Foundation

class Sao {
    var saoID: Int
    var saoTen: String
    var saoNguHanh: String
    var saoAmDuong: String
    var vongTrangSinh: Int
    var saoDacTinh: String?

    init(saoID: Int, saoTen: String, saoNguHanh: String, saoAmDuong: String = "", vongTrangSinh: Int = 0, saoDacTinh: String? = nil) {
        self.saoID = saoID
        self.saoTen = saoTen
        self.saoNguHanh = saoNguHanh
        self.saoAmDuong = saoAmDuong
        self.vongTrangSinh = vongTrangSinh
        self.saoDacTinh = saoDacTinh
    }

    func anDacTinh(_ dacTinh: String) -> Sao {
        let dt = [
            "V": "vuongDia",
            "M": "mieuDia",
            "Đ": "dacDia",
            "B": "binhHoa",
            "H": "hamDia"
        ]
        self.saoDacTinh = dacTinh
        return self
    }

//    func anCung(_ saoViTriCung: Int) -> Sao {
//        self.saoViTriCung = saoViTriCung
//        return self
//    }
//    saoTuVi = Sao(saoID: <#T##Int#>, saoTen: <#T##String#>, saoNguHanh: <#T##String#>)
}
