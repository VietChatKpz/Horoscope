//
//  ThienBanCell.swift
//  HoroScope
//
//  Created by VietChat on 4/5/24.
//

import UIKit

class ThienBanCell: UICollectionViewCell {

    @IBOutlet private weak var tenLabel: UILabel!
    @IBOutlet private weak var namSinhLabel: UILabel!
    @IBOutlet private weak var thangLabel: UILabel!
    @IBOutlet private weak var ngayLabel: UILabel!
    @IBOutlet private weak var leftTV: UITextView!
    @IBOutlet private weak var centerTV: UITextView!
    @IBOutlet private weak var rightTV: UITextView!
    
    var thienBan: ThienBan? {
        didSet {
            configuraData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configuraData() {
        guard let thienBan = thienBan else { return }
        let date = Date().toYear
        let solar = thienBan.solarBirthDate
        let lunar = LunarDate(solarDate: solar)
        var string: String = "Âm"
        if lunar.yyTxt.can.rawValue % 2 == 0 {
            string = "Dương"
        }
        string = thienBan.sex ? string + " Nam" : " Nữ"
        let colorYY = Constants.canChiColor(canIndex: lunar.yyTxt.can.rawValue, chiIndex: lunar.yyTxt.chi.rawValue)
        let colorMM = Constants.canChiColor(canIndex: lunar.mmTxt.can.rawValue, chiIndex: lunar.mmTxt.chi.rawValue)
        let colorDD = Constants.canChiColor(canIndex: lunar.ddTxt.can.rawValue, chiIndex: lunar.ddTxt.chi.rawValue)
        let colorH = Constants.canChiColor(canIndex: lunar.hhTxt.can.rawValue, chiIndex: lunar.hhTxt.chi.rawValue)
        let colorN = Constants.canChiColor(canIndex: CanChi(yy: date).can.rawValue, chiIndex: CanChi(yy: date).chi.rawValue)
        let colorDefault = UIColor.blue
        let tuoi = date - lunar.yy
        let attrString = NSMutableAttributedString()
        let arrYY: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 21), .foregroundColor: colorYY]
        attrString.append(NSAttributedString(string: "\n\(lunar.yyTxt.can.name) \(lunar.yyTxt.chi.name) \n", attributes: arrYY))
        let arrMM: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 21), .foregroundColor: colorMM]
        attrString.append(NSAttributedString(string: "\(lunar.mmTxt.can.name) \(lunar.mmTxt.chi.name) \n", attributes: arrMM))
        let arrDD: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 21), .foregroundColor: colorDD]
        attrString.append(NSAttributedString(string: "\(lunar.ddTxt.can.name) \(lunar.ddTxt.chi.name) \n", attributes: arrDD))
        let arrH: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 21), .foregroundColor: colorH]
        attrString.append(NSAttributedString(string: "\(lunar.hhTxt.can.name) \(lunar.hhTxt.chi.name) \n", attributes: arrH))
        let arrNow: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 21), .foregroundColor: colorN]
        attrString.append(NSAttributedString(string: "\(CanChi(yy: date).can.name) \(CanChi(yy: date).chi.name) \n", attributes: arrNow))
        let arrTuoi: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 21), .foregroundColor: colorDefault]
        attrString.append(NSAttributedString(string: "\(tuoi) tuổi \n", attributes: arrTuoi))
        
        let attrStringCenter = NSMutableAttributedString()
        attrStringCenter.append(NSAttributedString(string: "\(thienBan.name) \n\(solar.yy) \n\(solar.mm)(\(lunar.mm)) \n\(solar.dd)(\(lunar.dd)) \n\(solar.hour)h\(solar.minute)' \n\(date) \n\(string) \n", attributes: arrTuoi))
        let arrMenh: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 21), .foregroundColor: BanMenh(can: lunar.yyTxt.can, chi: lunar.yyTxt.chi).color]
        attrStringCenter.append(NSAttributedString(string: "\(BanMenh(can: lunar.yyTxt.can, chi: lunar.yyTxt.chi).txt) \n", attributes: arrMenh))
        let arrCuc: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 21), .foregroundColor: Cuc(menh: Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi, can: lunar.yyTxt.can).cuc.color]
        let arrCung: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 21), .foregroundColor: CungPhi.findCungPhi(lunar.yy, sex: thienBan.sex).color]
        attrStringCenter.append(NSAttributedString(string: "\(Cuc(menh: Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi, can: lunar.yyTxt.can).cuc.name) \n", attributes: arrCuc))
        attrStringCenter.append(NSAttributedString(string: "\(CungPhi.findCungPhi(lunar.yy, sex: thienBan.sex).rawValue) \n", attributes: arrCung))
        attrStringCenter.append(NSAttributedString(string: "\(lunar.yyTxt.chi.menhChu) \n\(lunar.yyTxt.chi.thanChu)", attributes: arrTuoi))
        leftTV.text = """
            Họ tên:
            Năm sinh:
            Tháng sinh:
            Ngày sinh:
            Giờ sinh:
            Năm hạn:
            Âm Dương:
            Mệnh:
            
            Cục:
            Cung Phi:
            Mệnh Chủ:
            Thân Chủ:
        """
        centerTV.attributedText = attrStringCenter
        rightTV.attributedText = attrString
    }
}
