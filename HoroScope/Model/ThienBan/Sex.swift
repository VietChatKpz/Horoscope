//
//  Sex.swift
//  HoroScope
//
//  Created by VietChat on 26/4/24.
//

import Foundation

enum Sex: Int {
    case Nam = 0
    case Nu = 1
    
    func amDuong(chi: Chi) -> String {
        var text = ""
        if chi.rawValue % 2 == 1 {
            text = "Âm"
        }else {
            text = "Dương"
        }
        switch self {
        case .Nam:
            return text + " Nam"
        case .Nu:
            return text + " Nữ"
        }
    }
}
