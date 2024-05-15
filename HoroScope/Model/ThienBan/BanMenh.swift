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
    init(can: Can, chi: Chi) {
        switch (can, chi) {
        case (.Giap, .Ti), (.Binh, .Suu):
            txt = "Hải trung kim"
            color = NguHanhColor.Kim.color
        case (.Binh, .Dan), (.Dinh, .Mao):
            txt =  "Lô trung Hỏa"
            color = NguHanhColor.Hoa.color
        case (.Mau, .Thin), (.Ky, .Ty):
            txt = "Đại lâm mộc"
            color = NguHanhColor.Moc.color
        case (.Canh, .Ngo), (.Tan, .Mui):
            txt = "Lộ bàng thổ"
            color = NguHanhColor.Tho.color
        case (.Nham, .Than), (.Quy, .Dau):
            txt = "Kiếm phong kim"
            color = NguHanhColor.Kim.color
        case (.Giap, .Tuat), (.At, .Hoi):
            txt = "Sơn đầu hỏa"
            color = NguHanhColor.Hoa.color
        case (.Binh, .Ti), (.Dinh, .Suu):
            txt = "Giản hạ thủy"
            color = NguHanhColor.Thuy.color
        case (.Mau, .Dan), (.Ky, .Mao):
            txt = "Thành đầu thổ"
            color = NguHanhColor.Tho.color
        case (.Canh, .Thin), (.Tan, .Ty):
            txt = "Bạch lạp kim"
            color = NguHanhColor.Kim.color
        case (.Nham, .Ngo), (.Quy, .Mui):
            txt = "Dương liễu mộc"
            color = NguHanhColor.Moc.color
        case (.Giap, .Than), (.At, .Dau):
            txt = "Tuyền trung thủy"
            color = NguHanhColor.Thuy.color
        case (.Binh, .Tuat), (.Dinh, .Hoi):
            txt = "Ốc thượng thổ"
            color = NguHanhColor.Tho.color
        case (.Mau, .Ti), (.Ky, .Suu):
            txt = "Tích lịch hỏa"
            color = NguHanhColor.Hoa.color
        case (.Canh, .Dan), (.Tan, .Mao):
            txt = "Tòng bách mộc"
            color = NguHanhColor.Moc.color
        case (.Nham, .Thin), (.Quy, .Ty):
            txt = "Tràng lưu thủy"
            color = NguHanhColor.Thuy.color
        case (.Giap, .Ngo), (.At, .Mui):
            txt = "Sa trung kim"
            color = NguHanhColor.Kim.color
        case (.Binh, .Than), (.Dinh, .Dau):
            txt = "Sơn hạ hỏa"
            color = NguHanhColor.Hoa.color
        case (.Mau, .Tuat), (.Ky, .Hoi):
            txt = "Bình địa mộc"
            color = NguHanhColor.Moc.color
        case (.Canh, .Ti), (.Tan, .Suu):
            txt = "Bịch thượng thổ"
            color = NguHanhColor.Tho.color
        case (.Nham, .Dan), (.Quy, .Mao):
            txt = "Kim bạch kim"
            color = NguHanhColor.Kim.color
        case (.Giap, .Thin), (.At, .Ty):
            txt = "Phú đăng hỏa"
            color = NguHanhColor.Hoa.color
        case (.Binh, .Ngo), (.Dinh, .Mui):
            txt = "Thiên thượng thủy"
            color = NguHanhColor.Thuy.color
        case (.Mau, .Than), (.Ky, .Dau):
            txt = "Đại Dịch Thổ" //Đất trach thổ
            color = NguHanhColor.Tho.color
        case (.Canh, .Tuat), (.Tan, .Hoi):
            txt = "Xuyến thoa kim"
            color = NguHanhColor.Kim.color
        case (.Nham, .Ti), (.Quy, .Suu):
            txt = "Tang khô mộc"
            color = NguHanhColor.Moc.color
        case (.Giap, .Dan), (.At, .Mao):
            txt = "Đại khê thủy"
            color = NguHanhColor.Thuy.color
        case (.Binh, .Thin), (.Dinh, .Ty):
            txt = "Sa trung thổ"
            color = NguHanhColor.Tho.color
        case (.Mau, .Ngo), (.Ky, .Mui):
            txt = "Thiên thượng hỏa"
            color = NguHanhColor.Hoa.color
        case (.Canh, .Than), (.Tan, .Dau):
            txt = "Thạch lựu mộc"
            color = NguHanhColor.Moc.color
        case (.Nham, .Tuat), (.Quy, .Hoi):
            txt = "Đại hải thuỷ"
            color = NguHanhColor.Thuy.color
        default:
            txt = "Không có thông tin"
            color = Constants.colorDefault
        }
    }
}
