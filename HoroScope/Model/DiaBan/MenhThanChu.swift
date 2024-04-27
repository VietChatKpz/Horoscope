//
//  MenhThanChu.swift
//  HoroScope
//
//  Created by VietChat on 26/4/24.
//

import Foundation

class MenhThanChu {
    var menhChu = ""
    var thanChu = ""
    let menhChuList: [String] = ["Tham Lam", "Cự Môn", "Lộc Tồn", "Văn Khúc", "Liêm Trinh", "Vũ Khúc", "Phá Quân", "Vũ Khúc", "Liêm Trinh", "Văn Khúc", "Lộc Tồn", "Cự Môn"]
    let thanChuList: [String] = ["Linh Tinh", "Thiên Tướng", "Thiên Lương", "Thiên Đồng", "Văn Xương", "Thiên Cơ", "Hỏa Tinh", "Thiên Tướng", "Thiên Lương", "Thiên Đồng", "Văn Xương", "Thiên Cơ"]
    
    init(chiMenhTB: Int) {
        self.menhChu = menhChuList[chiMenhTB]
        self.thanChu = thanChuList[chiMenhTB]
    }
}
