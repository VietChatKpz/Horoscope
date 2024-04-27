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
//        print(lunar.yyTxt.can, lunar.yyTxt.chi) //Năm
//        print(lunar.mmTxt.can, lunar.mmTxt.chi) //Tháng
//        print(lunar.ddTxt.can, lunar.ddTxt.chi) //Ngày
//        print(lunar.hhTxt.can, lunar.hhTxt.chi) //Giờ
//        print(BanMenh(can: lunar.yyTxt.can, chi: lunar.yyTxt.chi).txt) //Mệnh(Địa Chi)
//        print(Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi) //Mệnh(Thiên Bản)
//        print(Cuc(menh: Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi, can: lunar.yyTxt.can).cuc) //Cục
//        print(Sex.Nam.amDuong(chi: lunar.yyTxt.chi)) //Sex
//        print(Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi.rawValue)
//        print(MenhChu.list[Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi.rawValue])
        
        print("""
            Năm sinh: \(solar.yy)  \(lunar.yyTxt.can) \(lunar.yyTxt.chi)
            Tháng sinh: \(solar.mm)(\(lunar.mm))  \(lunar.mmTxt.can) \(lunar.mmTxt.chi)
            Ngày sinh: \(solar.dd)(\(lunar.dd))  \(lunar.ddTxt.can) \(lunar.ddTxt.chi)
            Giờ sinh: \(solar.hour) giờ \(solar.minute) phút \(lunar.hhTxt.can) \(lunar.hhTxt.chi)
            Âm Dương:
            Mệnh: \(BanMenh(can: lunar.yyTxt.can, chi: lunar.yyTxt.chi).txt)
            Cục: \(Cuc(menh: Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi, can: lunar.yyTxt.can).cuc)
            Cung Phi:
            Mệnh Chủ: \(MenhThanChu(chiMenhTB: Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi.rawValue).menhChu)
            Thân Chủ: \(MenhThanChu(chiMenhTB: Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi.rawValue).thanChu)
        """)
    }

}

