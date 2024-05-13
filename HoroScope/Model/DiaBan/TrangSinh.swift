//
//  TrangSinh.swift
//  HoroScope
//
//  Created by VietChat on 26/4/24.
//

import Foundation

enum TrangSinh: Int {
    case TrangSinh = 0
    case MocDuc = 1
    case QuanDoi = 2
    case LamQuan = 3
    case DeVuong = 4
    case Suy = 5
    case Benh = 6
    case Tu = 7
    case Mo = 8
    case Tuyet = 9
    case Thai = 10
    case Duong = 11
    
    static let list: [TrangSinh] = [.TrangSinh, .MocDuc, .QuanDoi, .LamQuan, .DeVuong, .Suy, .Benh, .Tu, .Mo, .Tuyet, .Thai, .Duong]
    static let trangSinhStartList: [TrangSinh] = [.DeVuong, .MocDuc, .Tu, .DeVuong, .Thai]
    static let trangSinhStartReversedList: [TrangSinh] = [.Mo, .Duong, .Tuyet, .Suy, .QuanDoi]
    
    var name: String {
        switch self {
        case .TrangSinh:
            return "Tràng Sinh"
        case .MocDuc:
            return "Mộc Dục"
        case .QuanDoi:
            return "Quan Đới"
        case .LamQuan:
            return "Lâm Quan"
        case .DeVuong:
            return "Đế Vương"
        case .Suy:
            return "Suy"
        case .Benh:
            return "Bệnh"
        case .Tu:
            return "Tử"
        case .Mo:
            return "Mộ"
        case .Tuyet:
            return "Tuyệt"
        case .Thai:
            return "Thai"
        case .Duong:
            return "Dưỡng"
        }
    }
    
    static func generateArray(startWith startChi: TrangSinh) -> [TrangSinh] {
        let length = 12
        let startIndex = startChi.rawValue
        var cycleArray: [TrangSinh] = []
        
        for i in 0..<length {
            let index = (startIndex + i) % list.count
            cycleArray.append(list[index])
        }
        return cycleArray
    }
    
    static func generateReversedArray(startWith startChi: TrangSinh) -> [TrangSinh] {
        let length = 12
        let startIndex = startChi.rawValue
        var reversedArray: [TrangSinh] = []
        
        for i in 0..<length {
            var index = (startIndex - i) % list.count
            if index < 0 {
                index += list.count
            }
            reversedArray.append(list[index])
        }
        return reversedArray
    }
}
