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
    
    init(solarBirthDate: SolarDate, name: String, sex: Bool) {
        self.solarBirthDate = solarBirthDate
        self.name = name
        self.sex = sex
    }
}
