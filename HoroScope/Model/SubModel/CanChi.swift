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
    
    init(yy: Int) {
        self.can = Can.list[yy%10]
        self.chi = Chi.list[(yy+9)%12]
    }
    
    init(withMonth mm:Int, and yyTxt: CanChi) {
        chi = Chi.list[(mm+1)%12]
        switch yyTxt.can {
        case .Canh, .At:
            can = Can.list[mm + 7]
        case .Tan, .Binh:
            can = Can.list[mm - 1]
        case .Nham, .Dinh:
            can = Can.list[mm + 1]
        case .Quy, .Mau:
            can = Can.list[mm + 3]
        case .Giap, .Ky:
            can = Can.list[mm + 5]
        }
    }
    
    init(dayFromSolarDate dmy: SolarDate) {
        let tmpD = LunarDate.jdFromDate(dd: dmy.dd, mm: dmy.mm, yy: dmy.yy)
        can = Can.list[(tmpD+3)%10]
        chi = Chi.list[(tmpD+1)%12]
    }
    
//    init(hourFrom h: Int, minute: Int, day: CanChi) {
//        var hh = h
//        while hh % 2 != 1 {
//            hh -= 1
//        }
//        hh = ((hh+1)/2)%12
//        chi = Chi.list[hh]
//        
//        switch chi {
//        case .Ti:
//            <#code#>
//        case .Suu:
//            <#code#>
//        case .Dan:
//            <#code#>
//        case .Mao:
//            <#code#>
//        case .Thin:
//            <#code#>
//        case .Ty:
//            <#code#>
//        case .Ngo:
//            <#code#>
//        case .Mui:
//            <#code#>
//        case .Than:
//            <#code#>
//        case .Dau:
//            <#code#>
//        case .Tuat:
//            <#code#>
//        case .Hoi:
//            <#code#>
//        }
//    }
}
