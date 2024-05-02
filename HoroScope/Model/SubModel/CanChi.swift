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
        var dd = dmy.dd
        var mm = dmy.mm
        var yy = dmy.yy
        let hour = dmy.hour
        let calendar = Calendar.current
        var components = DateComponents()
        components.day = dd
        components.month = mm
        components.year = yy
        components.hour = hour
        let currentDate = calendar.date(from: components)
        if let current = currentDate {
            if hour >= 23 {
                if let newDay = calendar.date(byAdding: .day, value: 1, to: current) {
                    let newComponents = calendar.dateComponents([.day, .month, .year], from: newDay)
                    dd = newComponents.day ?? 0
                    mm = newComponents.month ?? 0
                    yy = newComponents.year ?? 0
                    let tmpD = LunarDate.jdFromDate(dd: dd, mm: mm, yy: yy)
                    can = Can.list[(tmpD+3)%10]
                    chi = Chi.list[(tmpD+1)%12]
                    return
                }
            }else {
                let tmpD = LunarDate.jdFromDate(dd: dmy.dd, mm: dmy.mm, yy: dmy.yy)
                can = Can.list[(tmpD+3)%10]
                chi = Chi.list[(tmpD+1)%12]
                return
            }
        }
        can = Can.list[0]
        chi = Chi.list[0]
    }
    
    //MARK: Can chi theo giờ
    init(hourFrom h: Int, minute: Int, day: Can) {
        var hh = 0
        if h % 2 == 1 {
            hh = (h/2+1)
            if hh == 12 {
                hh = 0
            }
        }else {
            hh = h/2
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
