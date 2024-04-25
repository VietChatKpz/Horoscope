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
        let solar = SolarDate(dd: 31, mm: 10, yy: 2000, hour: 5, minute: 30)
        let canChidd = CanChi(dayFromSolarDate: solar)
        print(canChidd.can, canChidd.chi)
    }

}

