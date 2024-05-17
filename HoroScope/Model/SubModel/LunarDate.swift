//
//  LunarDate.swift
//  HoroScope
//
//  Created by Hai Nam on 23/4/24.
//

import Foundation

class LunarDate {
    let dd: Int
    let mm: Int
    let yy: Int
    let hour: Int
    let minute: Int
    
    let yyTxt: CanChi
    let mmTxt: CanChi
    let ddTxt: CanChi
    let hhTxt: CanChi
    
    init(solarDate: SolarDate) {
        let arr = LunarDate.convertSolar2LunarHours(solarDate: solarDate)
        dd = arr[0]
        mm = arr[1]
        yy = arr[2]
        hour = solarDate.hour
        minute = solarDate.minute
        yyTxt = CanChi(yy: yy)
        mmTxt = CanChi(withMonth: mm, withCanYY: yyTxt.can)
        ddTxt = CanChi(dayFromSolarDate: solarDate)
        hhTxt = CanChi(hourFrom: hour, minute: minute, day: ddTxt.can)
    }
}

//MARK: - Đổi từ lịch dương sang lịch âm
extension LunarDate {
    
    static func iFloor(inp: Double) -> Int {
        return Int(floor(inp))
    }
    
    static func jdFromDate(dd: Int, mm: Int, yy: Int) -> Int {
        let a = iFloor(inp: (14 - Double(mm)) / 12)
        let y = yy+4800-a
        let m = mm+12*a-3
        var jd = dd + (153*m+2)/5 + 365*y + y/4 - y/100 + y/400 - 32045
        if (jd < 2299161) {
            jd = dd + (153*m+2)/5 + 365*y + y/4 - 32083
        }
        //jd = jd - 1721425
        return jd
    }
    
    static func getNewMoonDay(k: Double, timeZone: Double) -> Int {
        let PI = Double.pi
        let dr = PI / 180.0
        
        let T = k / 1236.85
        let T2 = T * T
        let T3 = T2 * T
        var Jd1 = 2415020.75933 + 29.53058868 * k + 0.0001178 * T2 - 0.000000155 * T3
        Jd1 += 0.00033 * sin((166.56 + 132.87 * T - 0.009173 * T2) * dr)
        
        let M = 359.2242 + 29.10535608 * k - 0.0000333 * T2 - 0.00000347 * T3
        var Mpr = 306.0253 + 385.81691806 * k + 0.0107306 * T2 + 0.00001236 * T3
        var F = 21.2964 + 390.67050646 * k - 0.0016528 * T2 - 0.00000239 * T3
        
        let C1 = (0.1734 - 0.000393 * T) * sin(M * dr) + 0.0021 * sin(2 * dr * M)
        Mpr *= dr
        var C1_ = C1 - 0.4068 * sin(Mpr) + 0.0161 * sin(2 * Mpr)
        C1_ = C1_ - 0.0004 * sin(3 * Mpr)
        F *= dr
        C1_ = C1_ + 0.0104 * sin(2 * F) - 0.0051 * sin(M + Mpr)
        C1_ = C1_ - 0.0074 * sin(M - Mpr) + 0.0004 * sin(2 * F + M)
        C1_ = C1_ - 0.0004 * sin(2 * F - M) - 0.0006 * sin(2 * F + Mpr)
        C1_ = C1_ + 0.0010 * sin(2 * F - Mpr) + 0.0005 * sin(2 * Mpr + M)
        
        var deltat: Double
        if T < -11 {
            deltat = 0.001 + 0.000839 * T + 0.0002261 * T2 - 0.00000845 * T3 - 0.000000081 * T * T3
        } else {
            deltat = -0.000278 + 0.000265 * T + 0.000262 * T2
        }
        
        Jd1 += C1_ - deltat
        return iFloor(inp: Jd1 + 0.5 + timeZone / 24.0)
    }
    
    static func SunLongitude(_ jdn: Double) -> Double {
        let T = (jdn - 2451545.0) / 36525 // Time in Julian centuries from 2000-01-01 12:00:00 GMT
        let T2 = T * T
        let dr = Double.pi / 180 // degree to radian
        let M = 357.52910 + 35999.05030 * T - 0.0001559 * T2 - 0.00000048 * T * T2 // mean anomaly, degree
        let L0 = 280.46645 + 36000.76983 * T + 0.0003032 * T2 // mean longitude, degree
        var DL = (1.914600 - 0.004817 * T - 0.000014 * T2) * sin(dr * M)
        DL += (0.019993 - 0.000101 * T) * sin(dr * 2 * M) + 0.000290 * sin(dr * 3 * M)
        var L = L0 + DL // true longitude, degree
        L -= 360 * floor(L / 360) // Normalize to (0, 360)
        return L
    }
    
    static func getSunLongitude(dayNumber: Int, timeZone: Double) -> Double {
        return SunLongitude(Double(dayNumber) - 0.5 - timeZone/24)
    }
    
    static func getLunarMonth11(_ yy: Int, timeZone: Double) -> Int {
        let off = Double(jdFromDate(dd: 31, mm: 12, yy: yy)) - 2415021.076998695
        let k = Int(off / 29.530588853)
        var nm = getNewMoonDay(k: Double(k), timeZone: timeZone)
        let sunLong = iFloor(inp: getSunLongitude(dayNumber: nm, timeZone: timeZone) / 30)
        if sunLong >= 9 {
            nm = getNewMoonDay(k: Double(k - 1), timeZone: timeZone)
        }
        return nm
    }
    
    static func getLeapMonthOffset(a11: Int, timeZone: Double) -> Int {
        let k = Int(0.5 + (Double(a11) - 2415021.076998695) / 29.530588853)
        var last: Int = 0 // Month 11 contains point of sun longitude 3*PI/2 (December solstice)
        var i = 1 // We start with the month following lunar month 11
        var arc = iFloor(inp: getSunLongitude(dayNumber: getNewMoonDay(k: Double(k + i), timeZone: timeZone), timeZone: timeZone) / 30)
        repeat {
            last = arc
            i += 1
            arc = iFloor(inp: getSunLongitude(dayNumber: getNewMoonDay(k: Double(k + i), timeZone: timeZone), timeZone: timeZone) / 30)
        } while arc != last && i < 14
        return i - 1
    }
    
    static func convertSolar2LunarHours(solarDate: SolarDate) -> [Int] {
        let timeZone = 7.0
        let calendar = Calendar.current
        if let currentDate = calendar.date(from: DateComponents(year: solarDate.yy, month: solarDate.mm, day: solarDate.dd, hour: solarDate.hour)) {
            if solarDate.hour >= 23 {
                let newDay = calendar.date(byAdding: .day, value: 1, to: currentDate)!
                let newComponents = calendar.dateComponents([.day, .month, .year], from: newDay)
                let newSolarDate = SolarDate(dd: newComponents.day!, mm: newComponents.month!, yy: newComponents.year!, hour: 0, minute: 0)
                return convertSolar2Lunar(solarDate: newSolarDate, timeZone: timeZone)
            }
            return convertSolar2Lunar(solarDate: solarDate, timeZone: timeZone)
        }
        return []
    }
    
    static func convertSolar2Lunar(solarDate: SolarDate, timeZone: Double) -> [Int] {
        let dd = solarDate.dd
        let mm = solarDate.mm
        let yy = solarDate.yy
        var lunarDay, lunarMonth, lunarYear, lunarLeap: Int
        let dayNumber = jdFromDate(dd: dd, mm: mm, yy: yy)
        let k = iFloor(inp: ((Double(dayNumber) - 2415021.076998695) / 29.530588853))
        var monthStart = getNewMoonDay(k: Double(k + 1), timeZone: timeZone)
        if monthStart > dayNumber {
            monthStart = getNewMoonDay(k: Double(k), timeZone: timeZone)
        }
        var a11 = getLunarMonth11(yy, timeZone: timeZone)
        var b11 = a11
        if a11 >= monthStart {
            lunarYear = yy
            a11 = getLunarMonth11(yy - 1, timeZone: timeZone)
        } else {
            lunarYear = yy + 1
            b11 = getLunarMonth11(yy + 1, timeZone: timeZone)
        }
        lunarDay = dayNumber - monthStart + 1
        let diff = iFloor(inp: Double(monthStart - a11) / 29)
        lunarLeap = 0
        lunarMonth = diff + 11
        if b11 - a11 > 365 {
            let leapMonthDiff = getLeapMonthOffset(a11: a11, timeZone: timeZone)
            if diff >= leapMonthDiff {
                lunarMonth = diff + 10
                if diff == leapMonthDiff {
                    lunarLeap = 1
                }
            }
        }
        if lunarMonth > 12 {
            lunarMonth -= 12
        }
        if lunarMonth >= 11 && diff < 4 {
            lunarYear -= 1
        }
        return [lunarDay, lunarMonth, lunarYear, lunarLeap]
    }
}
