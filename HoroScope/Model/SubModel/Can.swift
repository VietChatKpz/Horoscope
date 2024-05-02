//
//  Can.swift
//  HoroScope
//
//  Created by Hai Nam on 23/4/24.
//

import Foundation

//MARK: K,1: Kim    M,2: Mộc    T,3: Thủy   H,4: Hỏa    O,5: Thổ
//MARK: Dương: 1    Âm: -1

enum Can: Int {
    case Canh = 0
    case Tan = 1
    case Nham = 2
    case Quy = 3
    case Giap = 4
    case At = 5
    case Binh = 6
    case Dinh = 7
    case Mau = 8
    case Ky = 9
        
    static let list: [Can] = [.Canh, .Tan, .Nham, .Quy, .Giap, .At, .Binh, .Dinh, .Mau, .Ky]
    
    static func generateArray(startWith startCan: Can, length: Int) -> [Can] {
        let startIndex = startCan.rawValue
        var cycleArray: [Can] = []
        
        for i in 0..<length {
            let index = (startIndex + i) % list.count
            cycleArray.append(list[index])
        }
        return cycleArray
    }
    
    func chuCaiDau() -> String {
        switch self {
        case .Canh:
            return "C"
        case .Tan:
            return "T"
        case .Nham:
            return "N"
        case .Quy:
            return "Q"
        case .Giap:
            return "G"
        case .At:
            return "A"
        case .Binh:
            return "B"
        case .Dinh:
            return "D"
        case .Mau:
            return "M"
        case .Ky:
            return "K"
        }
    }
    
    func nguHanh() -> String {
        switch self {
        case .Canh:
            return "K"
        case .Tan:
            return "K"
        case .Nham:
            return "T"
        case .Quy:
            return "T"
        case .Giap:
            return "M"
        case .At:
            return "M"
        case .Binh:
            return "H"
        case .Dinh:
            return "H"
        case .Mau:
            return "O"
        case .Ky:
            return "O"
        }
    }
}

//struct ThienCan {
//    let id: Int
//    let chuCaiDau: String
//    let tenCan: String
//    let nguHanh: String
//    let nguHanhID: Int
//    let amDuong: Int
//}
//
//let listThienCan: [ThienCan] = [
//    ThienCan(id: 1, chuCaiDau: "C", tenCan: "Canh", nguHanh: "K", nguHanhID: 1, amDuong: 1),
//    ThienCan(id: 2, chuCaiDau: "T", tenCan: "Tân", nguHanh: "K", nguHanhID: 1, amDuong: -1),
//    ThienCan(id: 3, chuCaiDau: "N", tenCan: "Nhâm", nguHanh: "T", nguHanhID: 3, amDuong: 1),
//    ThienCan(id: 4, chuCaiDau: "Q", tenCan: "Quý", nguHanh: "T", nguHanhID: 3, amDuong: -1),
//    ThienCan(id: 5, chuCaiDau: "G", tenCan: "Giáp", nguHanh: "M", nguHanhID: 2, amDuong: 1),
//    ThienCan(id: 6, chuCaiDau: "A", tenCan: "Ất", nguHanh: "M", nguHanhID: 2, amDuong: -1),
//    ThienCan(id: 7, chuCaiDau: "B", tenCan: "Bính", nguHanh: "H", nguHanhID: 4, amDuong: 1),
//    ThienCan(id: 8, chuCaiDau: "D", tenCan: "Đinh", nguHanh: "H", nguHanhID: 4, amDuong: -1),
//    ThienCan(id: 9, chuCaiDau: "M", tenCan: "Mậu", nguHanh: "O", nguHanhID: 5, amDuong: 1),
//    ThienCan(id: 10, chuCaiDau: "K", tenCan: "Kỷ", nguHanh: "O", nguHanhID: 5, amDuong: -1)
//]
