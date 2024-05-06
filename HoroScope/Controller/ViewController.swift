//
//  ViewController.swift
//  HoroScope
//
//  Created by Hai Nam on 22/4/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        let solar = SolarDate(dd: 1, mm: 1, yy: 1860, hour: 11, minute: 30)
        let lunar = LunarDate(solarDate: solar)
        
        print("""
            Năm sinh: \(solar.yy)  \(lunar.yyTxt.can) \(lunar.yyTxt.chi)
            Tháng sinh: \(solar.mm)(\(lunar.mm))  \(lunar.mmTxt.can) \(lunar.mmTxt.chi)
            Ngày sinh: \(solar.dd)(\(lunar.dd))  \(lunar.ddTxt.can) \(lunar.ddTxt.chi)
            Giờ sinh: \(solar.hour) giờ \(solar.minute) phút \(lunar.hhTxt.can) \(lunar.hhTxt.chi)
            Âm Dương:
            Mệnh: \(BanMenh(can: lunar.yyTxt.can, chi: lunar.yyTxt.chi).txt)
            Cục: \(Cuc(menh: Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi, can: lunar.yyTxt.can).cuc.tenCuc())
            Cung Phi:
            Mệnh Chủ: \(lunar.yyTxt.chi.menhChu())
            Thân Chủ: \(lunar.yyTxt.chi.thanChu())
        """)
        var list: [DiaBan] = []
        var index = 0
        let menhIndex = Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi.rawValue
        let anThanIndex = AnThan.generateArray(startWith: .Menh, length: 12)[12-menhIndex]
        let listAnThan = AnThan.generateArray(startWith: anThanIndex, length: 12)
        let cucIndex = Cuc(menh: Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi, can: lunar.yyTxt.can).cuc.rawValue
        for chi in Chi.list {
            let diaBan = DiaBan(cungVi: chi, cungThan: listAnThan[chi.rawValue], cungCuc: cucIndex + listAnThan[chi.rawValue].rawValue*10, trangSinh: .TrangSinh)
            list.append(diaBan)
        }
        
        anTuVi(lunar: lunar, list: list)

    }
    
    func anTuVi(lunar: LunarDate, list: [DiaBan]) {
        let number = lunar.dd
        let cucIndex = Cuc(menh: Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi, can: lunar.yyTxt.can).cuc.rawValue
        var index = 0
        var indexNew = 0
        var numberNew = 0
        var vitri = 2
        var a = 0
        var vitriTPNew = 0
        if number % cucIndex != 0 {
            indexNew = (number / cucIndex) + 1
            numberNew = indexNew * cucIndex
            a = numberNew - number
            if a % 2 != 0 {
                index = indexNew - a
                vitri = vitri + index
            }else {
                index = indexNew + a
                vitri = vitri + index
            }
        }else {
            index = number / cucIndex
            vitri = vitri + index
        }
        list[vitri - 1].cungTuVi.append(.TuVi)
        list[(vitri+3) > 11 ? (vitri+3) - 12 : (vitri+3)].cungTuVi.append(.LiemTrinh)
        list[(vitri+6) > 11 ? (vitri+6) - 12 : (vitri+6)].cungTuVi.append(.ThienDong)
        list[(vitri+7) > 11 ? (vitri+7) - 12 : (vitri+7)].cungTuVi.append(.VuKhuc)
        list[(vitri+8) > 11 ? (vitri+8) - 12 : (vitri+8)].cungTuVi.append(.ThaiDuong)
        list[(vitri+10) > 11 ? (vitri+10) - 12 : (vitri+10)].cungTuVi.append(.ThienCo)
        
        let vitriTV = vitri-1
        let vitriTP = 2+2-vitriTV
        if vitriTP > 0 {
            vitriTPNew = 4 - vitriTV
        }else {
            vitriTPNew = 4 - vitriTV + 12
        }
        list[vitriTPNew > 11 ? vitriTPNew-12 : vitriTPNew].cungThienPhu.append(.ThienPhu)
        list[vitriTPNew+1 > 11 ? vitriTPNew+1-12 : vitriTPNew+1].cungThienPhu.append(.ThaiAm)
        list[vitriTPNew+2 > 11 ? vitriTPNew+2-12 : vitriTPNew+2].cungThienPhu.append(.ThamLang)
        list[vitriTPNew+3 > 11 ? vitriTPNew+3-12 : vitriTPNew+3].cungThienPhu.append(.CuMon)
        list[vitriTPNew+4 > 11 ? vitriTPNew+4-12 : vitriTPNew+4].cungThienPhu.append(.ThienTuong)
        list[vitriTPNew+5 > 11 ? vitriTPNew+5-12 : vitriTPNew+5].cungThienPhu.append(.ThienLuong)
        list[vitriTPNew+6 > 11 ? vitriTPNew+6-12 : vitriTPNew+6].cungThienPhu.append(.ThatSat)
        list[vitriTPNew+10 > 11 ? vitriTPNew+10-12 : vitriTPNew+10].cungThienPhu.append(.PhaQuan)
    }
}

