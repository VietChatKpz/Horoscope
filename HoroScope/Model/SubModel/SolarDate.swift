//
//  SolarDate.swift
//  HoroScope
//
//  Created by Hai Nam on 23/4/24.
//

import Foundation

class SolarDate {
    let dd: Int
    let mm: Int
    let yy: Int
    let hour: Int
    let minute: Int
    
    let yyTxt: CanChi
    
    init(dd: Int, mm: Int, yy: Int, hour: Int, minute: Int) {
        self.dd = dd
        self.mm = mm
        self.yy = yy
        self.hour = hour
        self.minute = minute
        yyTxt = CanChi(yy: yy)
    }
}
