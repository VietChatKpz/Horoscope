//
//  DiaBanCell.swift
//  HoroScope
//
//  Created by VietChat on 4/5/24.
//

import UIKit

class DiaBanCell: UICollectionViewCell {
    
    @IBOutlet private weak var cungViLabel: UILabel!
    @IBOutlet private weak var anThanLabel: UILabel!
    @IBOutlet private weak var cucLabel: UILabel!
    @IBOutlet private weak var tuviLabel: UILabel!
    @IBOutlet private weak var trangSinhLabel: UILabel!
    @IBOutlet weak var lineLeft: UIView!
    @IBOutlet weak var lineTop: UIView!
    @IBOutlet weak var lineRight: UIView!
    @IBOutlet weak var lineBottom: UIView!
    @IBOutlet private weak var saoTotLabel: UILabel!
    @IBOutlet private weak var saoXauLabel: UILabel!
    @IBOutlet private weak var tieuVanLabel: UILabel!
    @IBOutlet private weak var thangHanLabel: UILabel!
    @IBOutlet weak var heightViewTV: NSLayoutConstraint!
    
    var diaBan: DiaBan? {
        didSet {
            configurationData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fontSizeLabel()
    }
    
    func fontSizeLabel() {
        let size = CGSize.getSafeAreaSize()
        let fontSizeGoc = size.width * 11.0 / Constants.widthScreen
        let fontSizeAn = size.width * 15.0 / Constants.widthScreen
        let fontSizeTV = size.width * 20.0 / Constants.widthScreen
        let fontSao = size.width * 16.0 / Constants.widthScreen
        cungViLabel.font = UIFont.systemFont(ofSize: fontSizeGoc)
        cucLabel.font = UIFont.boldSystemFont(ofSize: fontSizeGoc)
        tieuVanLabel.font = UIFont.boldSystemFont(ofSize: fontSizeGoc)
        thangHanLabel.font = UIFont.boldSystemFont(ofSize: fontSizeGoc)
        anThanLabel.font = UIFont.boldSystemFont(ofSize: fontSizeAn)
        tuviLabel.font = UIFont.boldSystemFont(ofSize: fontSizeTV)
        saoTotLabel.font = UIFont.systemFont(ofSize: fontSao)
        saoXauLabel.font = UIFont.systemFont(ofSize: fontSao)
        trangSinhLabel.font = UIFont.boldSystemFont(ofSize: fontSizeAn)
        heightViewTV.constant = size.height * 48.0 / Constants.heightScreen
    }
    
    func configurationData() {
        guard let diaBan = diaBan else { return }
        cungViLabel.textColor = Constants.canChiColor(canIndex: 3, chiIndex: 2)
        cungViLabel.text = "\(diaBan.cungViCan.name.first!)" + "." + diaBan.cungVi.name
        tieuVanLabel.text = diaBan.tieuVan.name
        thangHanLabel.text = "T " + "\(diaBan.thangHan)"
        cucLabel.text = "\(diaBan.cungCuc)"
        configurationAnThanLabel()
        let tuviAttributedString = NSMutableAttributedString()
        let saoTotString = NSMutableAttributedString()
        let saoXauString = NSMutableAttributedString()
        for i in diaBan.cungTuVi {
            let textColor = i.color
            let attributedString = NSAttributedString(string: "\(TuVi.name[i]!) (\(TuVi.dacTinh[i]![diaBan.id]))\n", attributes: [NSAttributedString.Key.foregroundColor: textColor])
            tuviAttributedString.append(attributedString)
        }
        for i in diaBan.cungThienPhu {
            let textColor = i.color
            let attributedString = NSAttributedString(string: " \(i.name) (\(ThienPhu.dacTinh[i]![diaBan.id]))", attributes: [NSAttributedString.Key.foregroundColor: textColor])
            tuviAttributedString.append(attributedString)
        }
        if diaBan.locTon.rawValue == 0 {
            let textColor = NguHanhColor.Tho.color
            let attributedString = NSAttributedString(string: "Lộc Tồn \n", attributes: [NSAttributedString.Key.foregroundColor: textColor])
            saoTotString.append(attributedString)
        }
        
        if diaBan.locTon.vitri < 11 {
            let textColor = diaBan.locTon.color
            let attributedString = NSAttributedString(string: " \(diaBan.locTon.name) \n", attributes: [NSAttributedString.Key.foregroundColor: textColor])
            saoTotString.append(attributedString)
        }else {
            let textColor = diaBan.locTon.color
            let attributedString = NSAttributedString(string: " \(diaBan.locTon.name) \n", attributes: [NSAttributedString.Key.foregroundColor: textColor])
            saoXauString.append(attributedString)
        }
        
        if diaBan.thaiTue.vitri < 11 {
            let thaiTueColor = diaBan.thaiTue.color
            let ttattributedString = NSAttributedString(string: " \(diaBan.thaiTue.name) \n", attributes: [NSAttributedString.Key.foregroundColor: thaiTueColor])
            saoTotString.append(ttattributedString)
        }else {
            let thaiTueColor = diaBan.thaiTue.color
            let ttattributedString = NSAttributedString(string: " \(diaBan.thaiTue.name) \n", attributes: [NSAttributedString.Key.foregroundColor: thaiTueColor])
            saoXauString.append(ttattributedString)
        }
        
        for i in diaBan.saoThang {
            if i.vitri < 11 {
                if i.dacTinh[diaBan.id] == "" {
                    let color = i.color
                    let attributedString = NSAttributedString(string: " \(i.rawValue) \n", attributes: [NSAttributedString.Key.foregroundColor: color])
                    saoTotString.append(attributedString)
                }else {
                    let color = i.color
                    let attributedString = NSAttributedString(string: " \(i.rawValue) (\(i.dacTinh[diaBan.id])) \n", attributes: [NSAttributedString.Key.foregroundColor: color])
                    saoTotString.append(attributedString)
                }
            }else {
                if i.dacTinh[diaBan.id] == "" {
                    let color = i.color
                    let attributedString = NSAttributedString(string: " \(i.rawValue) \n", attributes: [NSAttributedString.Key.foregroundColor: color])
                    saoXauString.append(attributedString)
                }else {
                    let color = i.color
                    let attributedString = NSAttributedString(string: " \(i.rawValue) (\(i.dacTinh[diaBan.id])) \n", attributes: [NSAttributedString.Key.foregroundColor: color])
                    saoXauString.append(attributedString)
                }
            }
        }
        
        for i in diaBan.saoGio {
            if i.vitri < 11 {
                if i.dacTinh[diaBan.id] == "" {
                    let color = i.color
                    let attributedString = NSAttributedString(string: " \(i.rawValue) \n", attributes: [NSAttributedString.Key.foregroundColor: color])
                    saoTotString.append(attributedString)
                }else {
                    let color = i.color
                    let attributedString = NSAttributedString(string: " \(i.rawValue) (\(i.dacTinh[diaBan.id])) \n", attributes: [NSAttributedString.Key.foregroundColor: color])
                    saoTotString.append(attributedString)
                }
            }else {
                if i.dacTinh[diaBan.id] == "" {
                    let color = i.color
                    let attributedString = NSAttributedString(string: " \(i.rawValue) \n", attributes: [NSAttributedString.Key.foregroundColor: color])
                    saoXauString.append(attributedString)
                }else {
                    let color = i.color
                    let attributedString = NSAttributedString(string: " \(i.rawValue) (\(i.dacTinh[diaBan.id])) \n", attributes: [NSAttributedString.Key.foregroundColor: color])
                    saoXauString.append(attributedString)
                }
            }
        }
        for i in diaBan.saoKhac {
            if i.vitri < 11 {
                if i.dacTinh[diaBan.id] == "" {
                    let color = i.color
                    let attributedString = NSAttributedString(string: " \(i.rawValue) \n", attributes: [NSAttributedString.Key.foregroundColor: color])
                    saoTotString.append(attributedString)
                }else {
                    let color = i.color
                    let attributedString = NSAttributedString(string: " \(i.rawValue) (\(i.dacTinh[diaBan.id])) \n", attributes: [NSAttributedString.Key.foregroundColor: color])
                    saoTotString.append(attributedString)
                }
            }else {
                if i.dacTinh[diaBan.id] == "" {
                    let color = i.color
                    let attributedString = NSAttributedString(string: " \(i.rawValue) \n", attributes: [NSAttributedString.Key.foregroundColor: color])
                    saoXauString.append(attributedString)
                }else {
                    let color = i.color
                    let attributedString = NSAttributedString(string: " \(i.rawValue) (\(i.dacTinh[diaBan.id]))\n", attributes: [NSAttributedString.Key.foregroundColor: color])
                    saoXauString.append(attributedString)
                }
            }
        }
        
        for i in diaBan.saoTuoi {
            if i.vitri < 11 {
                let color = i.color
                let attributedString = NSAttributedString(string: " \(i.rawValue) \n", attributes: [NSAttributedString.Key.foregroundColor: color])
                saoTotString.append(attributedString)
            }else {
                let color = i.color
                let attributedString = NSAttributedString(string: " \(i.rawValue) \n", attributes: [NSAttributedString.Key.foregroundColor: color])
                saoXauString.append(attributedString)
            }
        }
        
        for i in diaBan.saoCanTuoi {
            if i.vitri < 11 {
                let color = i.color
                let attributedString = NSAttributedString(string: " \(i.rawValue) \n", attributes: [NSAttributedString.Key.foregroundColor: color])
                saoTotString.append(attributedString)
            }else {
                let color = i.color
                let attributedString = NSAttributedString(string: " \(i.rawValue) \n", attributes: [NSAttributedString.Key.foregroundColor: color])
                saoXauString.append(attributedString)
            }
        }
        
        for i in diaBan.tuHoa {
            if i.vitri < 11 {
                let color = i.color
                let attributedString = NSAttributedString(string: " \(i.rawValue) \n", attributes: [NSAttributedString.Key.foregroundColor: color])
                saoTotString.append(attributedString)
            }else {
                let color = i.color
                let attributedString = NSAttributedString(string: " \(i.rawValue) \n", attributes: [NSAttributedString.Key.foregroundColor: color])
                saoXauString.append(attributedString)
            }
        }
        
        tuviLabel.attributedText = tuviAttributedString
        trangSinhLabel.text = "\(diaBan.trangSinh.name)"
        saoTotLabel.attributedText = saoTotString
        saoXauLabel.attributedText = saoXauString
    }
    
    private func configurationAnThanLabel() {
        guard let diaBan = diaBan else { return }
        let attributedString = NSMutableAttributedString()
        if diaBan.than.isEmpty {
            anThanLabel.text = diaBan.cungThan.name
        }else {
            let attributed = NSAttributedString(string: diaBan.cungThan.name, attributes: [NSAttributedString.Key.foregroundColor: Constants.colorDefault])
            let attributed1 = NSAttributedString(string: diaBan.than, attributes: [NSAttributedString.Key.foregroundColor: NguHanhColor.Hoa.color])
            attributedString.append(attributed)
            attributedString.append(attributed1)
            anThanLabel.attributedText = attributedString
        }
    }
}

