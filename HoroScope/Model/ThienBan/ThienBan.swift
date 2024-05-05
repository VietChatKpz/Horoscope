//
//  ThienBan.swift
//  HoroScope
//
//  Created by Hai Nam on 23/4/24.
//

import Foundation

class ThienBan {
    let solarBirthDate: SolarDate
    let name: String
    let sex: Bool
//    let lunarBirthDate: LunarDate
//    let gender: Int
//    let tuoiAmDuong: Int
//    let banMenh: BanMenh
//    let menhChu: String
//    let thanChu: String
    
    init(solarBirthDate: SolarDate, name: String, sex: Bool) {
        self.solarBirthDate = solarBirthDate
        self.name = name
        self.sex = sex
//        self.lunarBirthDate = lunarBirthDate
//        self.gender = gender
//        self.tuoiAmDuong = tuoiAmDuong
//        self.banMenh = banMenh
//        self.menhChu = menhChu
//        self.thanChu = thanChu
    }
}
