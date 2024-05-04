//
//  DiaBanCell.swift
//  HoroScope
//
//  Created by VietChat on 4/5/24.
//

import UIKit

class DiaBanCell: UICollectionViewCell {

    @IBOutlet weak var chiTrenLabel: UILabel!
    @IBOutlet weak var anThanLabel: UILabel!
    @IBOutlet weak var cucLabel: UILabel!
    @IBOutlet weak var tuviLabel: UILabel!
    @IBOutlet weak var trangSinhLabel: UILabel!
    var diaBan: DiaBan? {
        didSet {
            configurationData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func configurationData() {
        guard let diaBan = diaBan else { return }
        var string = ""
        chiTrenLabel.text = "\(diaBan.cungChi.toString())"
        anThanLabel.text = diaBan.cungThan.toString()
        cucLabel.text = "\(diaBan.cungCuc)"
        for i in diaBan.cungTuVi {
            string = "\(i.toString())"
        }
        for i in diaBan.cungThienPhu {
            string += " \(i.toString())"
        }
        tuviLabel.text = string
    }

}
