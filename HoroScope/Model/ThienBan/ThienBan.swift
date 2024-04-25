//
//  ThienBan.swift
//  HoroScope
//
//  Created by Hai Nam on 23/4/24.
//

import Foundation

class ThienBan {
    let solarBirthDate: SolarDate
    let lunarBirthDate: LunarDate
    let gender: Int
    let tuoiAmDuong: Int
    let banMenh: BanMenh
    let menhChu: String
    let thanChu: String
    
    init(solarBirthDate: SolarDate, lunarBirthDate: LunarDate, gender: Int, tuoiAmDuong: Int, banMenh: BanMenh, menhChu: String, thanChu: String) {
        self.solarBirthDate = solarBirthDate
        self.lunarBirthDate = lunarBirthDate
        self.gender = gender
        self.tuoiAmDuong = tuoiAmDuong
        self.banMenh = banMenh
        self.menhChu = menhChu
        self.thanChu = thanChu
    }
}
