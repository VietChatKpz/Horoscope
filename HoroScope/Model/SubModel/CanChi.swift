//
//  CanChi.swift
//  HoroScope
//
//  Created by Hai Nam on 23/4/24.
//

import Foundation

class CanChi {
    let can: Can
    let chi: Chi
    
    init(can: Can, chi: Chi) {
        self.can = can
        self.chi = chi
    }
    
    //MARK: Can chi theo năm
    init(yy: Int) {
        self.can = Can.list[yy%10]
        self.chi = Chi.list[(yy+8)%12]
    }
    
    init(mm: Int) {
        self.can = Can.list[(mm-1+2)%10]
        self.chi = Chi.list[(mm-1+6)%12]
    }

    //MARK: Can Chi theo tháng(tháng âm)
    init(withMonth mm: Int, withCanYY canYY: Can) {
        chi = Chi.generateArray(startWith: .Dan, length: 12)[mm-1]
        switch canYY {
        case .Giap, .Ky:
            can = Can.generateArray(startWith: .Binh, length: 12)[mm-1]
        case .At, .Canh:
            can = Can.generateArray(startWith: .Mau, length: 12)[mm-1]
        case .Binh, .Tan:
            can = Can.generateArray(startWith: .Canh, length: 12)[mm-1]
        case .Dinh, .Nham:
            can = Can.generateArray(startWith: .Nham, length: 12)[mm-1]
        case .Mau, .Quy:
            can = Can.generateArray(startWith: .Giap, length: 12)[mm-1]
        }
    }
    
    //MARK: Can chi theo ngày
    init(dayFromSolarDate dmy: SolarDate) {
        let tmpD = LunarDate.jdFromDate(dd: dmy.dd, mm: dmy.mm, yy: dmy.yy)
        can = Can.list[(tmpD+3)%10]
        chi = Chi.list[(tmpD+1)%12]
    }
    
    //MARK: Can chi theo giờ
    init(hourFrom h: Int, minute: Int, day: Can) {
        var hh = 0
        if h % 2 == 1 {
            hh = (h/2)
        }else {
            hh = h/2-1
        }
        chi = Chi.generateArray(startWith: .Ti, length: 12)[hh]
        switch day {
        case .Giap, .Ky:
            can = Can.generateArray(startWith: .Giap, length: 12)[hh]
        case .At, .Canh:
            can = Can.generateArray(startWith: .Binh, length: 12)[hh]
        case .Binh, .Tan:
            can = Can.generateArray(startWith: .Mau, length: 12)[hh]
        case .Dinh, .Nham:
            can = Can.generateArray(startWith: .Canh, length: 12)[hh]
        case .Mau, .Quy:
            can = Can.generateArray(startWith: .Nham, length: 12)[hh]
        }
    }
}
