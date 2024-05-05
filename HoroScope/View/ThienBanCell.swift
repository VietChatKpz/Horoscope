//
//  ThienBanCell.swift
//  HoroScope
//
//  Created by VietChat on 4/5/24.
//

import UIKit

class ThienBanCell: UICollectionViewCell {

    @IBOutlet weak var tenLabel: UILabel!
    @IBOutlet weak var namSinhLabel: UILabel!
    @IBOutlet weak var thangLabel: UILabel!
    @IBOutlet weak var ngayLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
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
        let solar = thienBan.solarBirthDate
        let lunar = LunarDate(solarDate: solar)
        var string: String = ""
        if lunar.yyTxt.can.rawValue % 2 == 0 {
            string = "Dương"
        }else {
            string = "Âm"
        }
        if thienBan.sex {
            string += " Nam"
        }else {
            string += " Nữ"
        }
        textView.text = """
                            Tử vi chân cơ
            Họ tên:      \(thienBan.name)
            Năm sinh:    \(solar.yy)  \(lunar.yyTxt.can.toString()) \(lunar.yyTxt.chi.toString())
            Tháng sinh:  \(solar.mm)(\(lunar.mm))  \(lunar.mmTxt.can.toString()) \(lunar.mmTxt.chi.toString())
            Ngày sinh:   \(solar.dd)(\(lunar.dd))  \(lunar.ddTxt.can.toString()) \(lunar.ddTxt.chi.toString())
            Giờ sinh:    \(solar.hour) giờ \(solar.minute) phút \(lunar.hhTxt.can.toString()) \(lunar.hhTxt.chi.toString())
            Âm Dương:    \(string)
            Mệnh:        \(BanMenh(can: lunar.yyTxt.can, chi: lunar.yyTxt.chi).txt)
            Cục:         \(Cuc(menh: Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi, can: lunar.yyTxt.can).cuc.tenCuc())
            Cung Phi:
            Mệnh Chủ:    \(lunar.yyTxt.chi.menhChu())
            Thân Chủ:    \(lunar.yyTxt.chi.thanChu())
        """
    }

}
