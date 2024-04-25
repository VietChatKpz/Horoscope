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
        let solar = SolarDate(dd: 31, mm: 10, yy: 2000, hour: 23, minute: 30)
        let lunar = LunarDate(solarDate: solar)
        print(lunar.yyTxt.can, lunar.yyTxt.chi) //Năm
        print(lunar.mmTxt.can, lunar.mmTxt.chi) //Tháng
        print(lunar.ddTxt.can, lunar.ddTxt.chi) //Ngày
        print(lunar.hhTxt.can, lunar.hhTxt.chi) //Giờ
        print(BanMenh(can: lunar.yyTxt.can, chi: lunar.yyTxt.chi).txt) //Mệnh
    }

}

