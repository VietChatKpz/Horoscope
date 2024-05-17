//
//  BanMenh.swift
//  HoroScope
//
//  Created by Hai Nam on 23/4/24.
//

import UIKit

class BanMenh {
    let txt: String
    let color: UIColor
    
    static let banMenh: [((Can, Chi), (String, UIColor))] = [
        ((.Giap, .Ti), ("Hải trung kim", NguHanhColor.Kim.color)),
        ((.Binh, .Suu), ("Hải trung kim", NguHanhColor.Kim.color)),
        ((.Binh, .Dan), ("Lô trung Hỏa", NguHanhColor.Hoa.color)),
        ((.Dinh, .Mao), ("Lô trung Hỏa", NguHanhColor.Hoa.color)),
        ((.Mau, .Thin), ("Đại lâm mộc", NguHanhColor.Moc.color)),
        ((.Ky, .Ty), ("Đại lâm mộc", NguHanhColor.Moc.color)),
        ((.Canh, .Ngo), ("Lộ bàng thổ", NguHanhColor.Tho.color)),
        ((.Tan, .Mui), ("Lộ bàng thổ", NguHanhColor.Tho.color)),
        ((.Nham, .Than), ("Kiếm phong kim", NguHanhColor.Kim.color)),
        ((.Quy, .Dau), ("Kiếm phong kim", NguHanhColor.Kim.color)),
        ((.Giap, .Tuat), ("Sơn đầu hỏa", NguHanhColor.Hoa.color)),
        ((.At, .Hoi), ("Sơn đầu hỏa", NguHanhColor.Hoa.color)),
        ((.Binh, .Ti), ("Giản hạ thủy", NguHanhColor.Thuy.color)),
        ((.Dinh, .Suu), ("Giản hạ thủy", NguHanhColor.Thuy.color)),
        ((.Mau, .Dan), ("Thành đầu thổ", NguHanhColor.Tho.color)),
        ((.Ky, .Mao), ("Thành đầu thổ", NguHanhColor.Tho.color)),
        ((.Canh, .Thin), ("Bạch lạp kim", NguHanhColor.Kim.color)),
        ((.Tan, .Ty), ("Bạch lạp kim", NguHanhColor.Kim.color)),
        ((.Nham, .Ngo), ("Dương liễu mộc", NguHanhColor.Moc.color)),
        ((.Quy, .Mui), ("Dương liễu mộc", NguHanhColor.Moc.color)),
        ((.Giap, .Than), ("Tuyền trung thủy", NguHanhColor.Thuy.color)),
        ((.At, .Dau), ("Tuyền trung thủy", NguHanhColor.Thuy.color)),
        ((.Binh, .Tuat), ("Ốc thượng thổ", NguHanhColor.Tho.color)),
        ((.Dinh, .Hoi), ("Ốc thượng thổ", NguHanhColor.Tho.color)),
        ((.Mau, .Ti), ("Tích lịch hỏa", NguHanhColor.Hoa.color)),
        ((.Ky, .Suu), ("Tích lịch hỏa", NguHanhColor.Hoa.color)),
        ((.Canh, .Dan), ("Tòng bách mộc", NguHanhColor.Moc.color)),
        ((.Tan, .Mao), ("Tòng bách mộc", NguHanhColor.Moc.color)),
        ((.Nham, .Thin), ("Tràng lưu thủy", NguHanhColor.Thuy.color)),
        ((.Quy, .Ty), ("Tràng lưu thủy", NguHanhColor.Thuy.color)),
        ((.Giap, .Ngo), ("Sa trung kim", NguHanhColor.Kim.color)),
        ((.At, .Mui), ("Sa trung kim", NguHanhColor.Kim.color)),
        ((.Binh, .Than), ("Sơn hạ hỏa", NguHanhColor.Hoa.color)),
        ((.Dinh, .Dau), ("Sơn hạ hỏa", NguHanhColor.Hoa.color)),
        ((.Mau, .Tuat), ("Bình địa mộc", NguHanhColor.Moc.color)),
        ((.Ky, .Hoi), ("Bình địa mộc", NguHanhColor.Moc.color)),
        ((.Canh, .Ti), ("Bịch thượng thổ", NguHanhColor.Tho.color)),
        ((.Tan, .Suu), ("Bịch thượng thổ", NguHanhColor.Tho.color)),
        ((.Nham, .Dan), ("Kim bạch kim", NguHanhColor.Kim.color)),
        ((.Quy, .Mao), ("Kim bạch kim", NguHanhColor.Kim.color)),
        ((.Giap, .Thin), ("Phú đăng hỏa", NguHanhColor.Hoa.color)),
        ((.At, .Ty), ("Phú đăng hỏa", NguHanhColor.Hoa.color)),
        ((.Binh, .Ngo), ("Thiên thượng thủy", NguHanhColor.Thuy.color)),
        ((.Dinh, .Mui), ("Thiên thượng thủy", NguHanhColor.Thuy.color)),
        ((.Mau, .Than), ("Đại Dịch Thổ", NguHanhColor.Tho.color)),
        ((.Ky, .Dau), ("Đại Dịch Thổ", NguHanhColor.Tho.color)),
        ((.Canh, .Tuat), ("Xuyến thoa kim", NguHanhColor.Kim.color)),
        ((.Tan, .Hoi), ("Xuyến thoa kim", NguHanhColor.Kim.color)),
        ((.Nham, .Ti), ("Tang khô mộc", NguHanhColor.Moc.color)),
        ((.Quy, .Suu), ("Tang khô mộc", NguHanhColor.Moc.color)),
        ((.Giap, .Dan), ("Đại khê thủy", NguHanhColor.Thuy.color)),
        ((.At, .Mao), ("Đại khê thủy", NguHanhColor.Thuy.color)),
        ((.Binh, .Thin), ("Sa trung thổ", NguHanhColor.Tho.color)),
        ((.Dinh, .Ty), ("Sa trung thổ", NguHanhColor.Tho.color)),
        ((.Mau, .Ngo), ("Thiên thượng hỏa", NguHanhColor.Hoa.color)),
        ((.Ky, .Mui), ("Thiên thượng hỏa", NguHanhColor.Hoa.color)),
        ((.Canh, .Than), ("Thạch lựu mộc", NguHanhColor.Moc.color)),
        ((.Tan, .Dau), ("Thạch lựu mộc", NguHanhColor.Moc.color)),
        ((.Nham, .Tuat), ( "Đại hải thuỷ", NguHanhColor.Thuy.color)),
        ((.Quy, .Hoi), ( "Đại hải thuỷ", NguHanhColor.Thuy.color)),
    ]
    init(can: Can, chi: Chi) {
        if let banMenh = BanMenh.banMenh.first(where: { $0.0 == (can, chi) }) {
            self.txt = banMenh.1.0
            self.color = banMenh.1.1
        }else {
            self.txt = "Không có thông tin"
            self.color = Constants.colorDefault
        }
    }
}
//        switch (can, chi) {
//        case (.Giap, .Ti), (.Binh, .Suu):
//            txt = "Hải trung kim"
//            color = NguHanhColor.Kim.color
//        case (.Binh, .Dan), (.Dinh, .Mao):
//            txt =  "Lô trung Hỏa"
//            color = NguHanhColor.Hoa.color
//        case (.Mau, .Thin), (.Ky, .Ty):
//            txt = "Đại lâm mộc"
//            color = NguHanhColor.Moc.color
//        case (.Canh, .Ngo), (.Tan, .Mui):
//            txt = "Lộ bàng thổ"
//            color = NguHanhColor.Tho.color
//        case (.Nham, .Than), (.Quy, .Dau):
//            txt = "Kiếm phong kim"
//            color = NguHanhColor.Kim.color
//        case (.Giap, .Tuat), (.At, .Hoi):
//            txt = "Sơn đầu hỏa"
//            color = NguHanhColor.Hoa.color
//        case (.Binh, .Ti), (.Dinh, .Suu):
//            txt = "Giản hạ thủy"
//            color = NguHanhColor.Thuy.color
//        case (.Mau, .Dan), (.Ky, .Mao):
//            txt = "Thành đầu thổ"
//            color = NguHanhColor.Tho.color
//        case (.Canh, .Thin), (.Tan, .Ty):
//            txt = "Bạch lạp kim"
//            color = NguHanhColor.Kim.color
//        case (.Nham, .Ngo), (.Quy, .Mui):
//            txt = "Dương liễu mộc"
//            color = NguHanhColor.Moc.color
//        case (.Giap, .Than), (.At, .Dau):
//            txt = "Tuyền trung thủy"
//            color = NguHanhColor.Thuy.color
//        case (.Binh, .Tuat), (.Dinh, .Hoi):
//            txt = "Ốc thượng thổ", NguHanhColor.Tho.color
//            color =
//        case (.Mau, .Ti), (.Ky, .Suu):
//            txt = "Tích lịch hỏa", NguHanhColor.Hoa.color
//        case (.Canh, .Dan), (.Tan, .Mao):
//            txt = "Tòng bách mộc", NguHanhColor.Moc.color
//        case (.Nham, .Thin), (.Quy, .Ty):
//            txt = "Tràng lưu thủy", NguHanhColor.Thuy.color
//        case (.Giap, .Ngo), (.At, .Mui):
//            txt = "Sa trung kim", NguHanhColor.Kim.color
//        case (.Binh, .Than), (.Dinh, .Dau):
//            txt = "Sơn hạ hỏa", NguHanhColor.Hoa.color
//        case (.Mau, .Tuat), (.Ky, .Hoi):
//            txt = "Bình địa mộc", NguHanhColor.Moc.color
//        case (.Canh, .Ti), (.Tan, .Suu):
//            txt = "Bịch thượng thổ", NguHanhColor.Tho.color
//        case (.Nham, .Dan), (.Quy, .Mao):
//            txt = "Kim bạch kim", NguHanhColor.Kim.color
//        case (.Giap, .Thin), (.At, .Ty):
//            txt = "Phú đăng hỏa", NguHanhColor.Hoa.color
//        case (.Binh, .Ngo), (.Dinh, .Mui):
//            txt = "Thiên thượng thủy", NguHanhColor.Thuy.color
//        case (.Mau, .Than), (.Ky, .Dau):
//            txt = "Đại Dịch Thổ" //Đất trach thổ, NguHanhColor.Tho.color
//        case (.Canh, .Tuat), (.Tan, .Hoi):
//            txt = "Xuyến thoa kim", NguHanhColor.Kim.color
//        case (.Nham, .Ti), (.Quy, .Suu):
//            txt = "Tang khô mộc", NguHanhColor.Moc.color
//        case (.Giap, .Dan), (.At, .Mao):
//            txt = "Đại khê thủy", NguHanhColor.Thuy.color
//        case (.Binh, .Thin), (.Dinh, .Ty):
//            txt = "Sa trung thổ", NguHanhColor.Tho.color
//        case (.Mau, .Ngo), (.Ky, .Mui):
//            txt = "Thiên thượng hỏa", NguHanhColor.Hoa.color
//        case (.Canh, .Than), (.Tan, .Dau):
//            txt = "Thạch lựu mộc", NguHanhColor.Moc.color
//        case (.Nham, .Tuat), (.Quy, .Hoi):
//            txt = "Đại hải thuỷ", NguHanhColor.Thuy.color
//        default:
//            txt = "Không có thông tin", Constants.colorDefault
//        }

