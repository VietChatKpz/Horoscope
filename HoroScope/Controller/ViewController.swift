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
        let solar = SolarDate(dd: 27, mm: 6, yy: 1968, hour: 22, minute: 30)
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
        var menhIndex = Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi.rawValue
        var cungCuc = Cuc(menh: Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi, can: lunar.yyTxt.can).cuc.rawValue
        let anThanIndex = AnThan.generateArray(startWith: .Menh, length: 12)[12-menhIndex]
        let listAnThan = AnThan.generateArray(startWith: anThanIndex, length: 12)
        for chi in Chi.list {
            
            let diaBan = DiaBan(cungChi: chi, cungThan: listAnThan[chi.rawValue])
            list.append(diaBan)
            
//            print(than)
//            let diaBan = DiaBan(cungChi: chi, cungThan: than)
//            list.append(diaBan)

        }
        for dia in list {
            print("""
                \(dia.cungChi)
                \(dia.cungThan)
            """)
        }
        
    }

}

