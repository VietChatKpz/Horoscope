//
//  DiaBanCell.swift
//  HoroScope
//
//  Created by VietChat on 4/5/24.
//

import UIKit

class DiaBanCell: UICollectionViewCell {

    @IBOutlet weak var cungViLabel: UILabel!
    @IBOutlet weak var anThanLabel: UILabel!
    @IBOutlet weak var cucLabel: UILabel!
    @IBOutlet weak var tuviLabel: UILabel!
    @IBOutlet weak var trangSinhLabel: UILabel!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
        
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
        cungViLabel.textColor = Constants.canChiColor(canIndex: 3, chiIndex: 2)
        cungViLabel.text = "\(diaBan.cungVi.name)"
        anThanLabel.text = diaBan.cungThan.toString()
        cucLabel.text = "\(diaBan.cungCuc)"
        let tuviAttributedString = NSMutableAttributedString()
        for i in diaBan.cungTuVi {
            let textColor = i.color
            let attributedString = NSAttributedString(string: "\(i.name) (\(i.dacTinh[diaBan.id]))\n", attributes: [NSAttributedString.Key.foregroundColor: textColor])
            tuviAttributedString.append(attributedString)
        }
        for i in diaBan.cungThienPhu {
            let textColor = i.color
            let attributedString = NSAttributedString(string: " \(i.name)", attributes: [NSAttributedString.Key.foregroundColor: textColor])
            tuviAttributedString.append(attributedString)
        }
        tuviLabel.attributedText = tuviAttributedString
        trangSinhLabel.text = "\(diaBan.trangSinh.name)"
    }

}
