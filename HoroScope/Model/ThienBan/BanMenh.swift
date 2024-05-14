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
            txt =  "Lô trung Hỏa (lửa trong lò)"
            color = NguHanhColor.Hoa.color
        case (.Mau, .Thin), (.Ky, .Ty):
            txt = "Đại lâm mộc (cây ở trong rừng)"
            color = NguHanhColor.Moc.color
        case (.Canh, .Ngo), (.Tan, .Mui):
            txt = "Lộ bàng thổ (đất bên đường)"
            color = NguHanhColor.Tho.color
        case (.Nham, .Than), (.Quy, .Dau):
            txt = "Kiếm phong kim (vàng đầy gươm)"
            color = NguHanhColor.Kim.color
        case (.Giap, .Tuat), (.At, .Hoi):
            txt = "Sơn đầu hỏa (lửa đầu núi)"
            color = NguHanhColor.Hoa.color
        case (.Binh, .Ti), (.Dinh, .Suu):
            txt = "Giản hạ thủy (nước khe suối)"
            color = NguHanhColor.Thuy.color
        case (.Mau, .Dan), (.Ky, .Mao):
            txt = "Thành đầu thổ (đất đầu thành)"
            color = NguHanhColor.Tho.color
        case (.Canh, .Thin), (.Tan, .Ty):
            txt = "Bạch lạp kim (đèn nến trắng)"
            color = NguHanhColor.Kim.color
        case (.Nham, .Ngo), (.Quy, .Mui):
            txt = "Dương liễu mộc (cây dương liều)"
            color = NguHanhColor.Moc.color
        case (.Giap, .Than), (.At, .Dau):
            txt = "Tuyền trung thủy (nước giữa suối)"
            color = NguHanhColor.Thuy.color
        case (.Binh, .Tuat), (.Dinh, .Hoi):
            txt = "Ốc thượng thổ (đất mái nhà)"
            color = NguHanhColor.Tho.color
        case (.Mau, .Ti), (.Ky, .Suu):
            txt = "Tích lịch hỏa (lửa sấm sét)"
            color = NguHanhColor.Hoa.color
        case (.Canh, .Dan), (.Tan, .Mao):
            txt = "Tòng bách mộc (cây tòng bách)"
            color = NguHanhColor.Moc.color
        case (.Nham, .Thin), (.Quy, .Ty):
            txt = "Tràng lưu thủy (nước dòng sông)"
            color = NguHanhColor.Thuy.color
        case (.Giap, .Ngo), (.At, .Mui):
            txt = "Sa trung kim (vàng trong cát)"
            color = NguHanhColor.Kim.color
        case (.Binh, .Than), (.Dinh, .Dau):
            txt = "Sơn hạ hỏa (lửa dưới cát)"
            color = NguHanhColor.Hoa.color
        case (.Mau, .Tuat), (.Ky, .Hoi):
            txt = "Bình địa mộc (cây đồng bằng)"
            color = NguHanhColor.Moc.color
        case (.Canh, .Ti), (.Tan, .Suu):
            txt = "Bịch thượng thổ (đất trên vách)"
            color = NguHanhColor.Tho.color
        case (.Nham, .Dan), (.Quy, .Mao):
            txt = "Kim bạch kim (vàng bạch kim)"
            color = NguHanhColor.Kim.color
        case (.Giap, .Thin), (.At, .Ty):
            txt = "Phú đăng hỏa (lửa ngọn đèn lớn)"
            color = NguHanhColor.Hoa.color
        case (.Binh, .Ngo), (.Dinh, .Mui):
            txt = "Thiên thượng thủy (nước trên trời)"
            color = NguHanhColor.Thuy.color
        case (.Mau, .Than), (.Ky, .Dau):
            txt = "Đại Dịch Thổ (đất làm nhà)" //Đất trach thổ
            color = NguHanhColor.Tho.color
        case (.Canh, .Tuat), (.Tan, .Hoi):
            txt = "Xuyến thoa kim (vàng trong tay)"
            color = NguHanhColor.Kim.color
        case (.Nham, .Ti), (.Quy, .Suu):
            txt = "Tang khô mộc (gỗ cây dâu)"
            color = NguHanhColor.Moc.color
        case (.Giap, .Dan), (.At, .Mao):
            txt = "Đại khê thủy (nước suối lớn)"
            color = NguHanhColor.Thuy.color
        case (.Binh, .Thin), (.Dinh, .Ty):
            txt = "Sa trung thổ (đất giữa cát)"
            color = NguHanhColor.Tho.color
        case (.Mau, .Ngo), (.Ky, .Mui):
            txt = "Thiên thượng hỏa (lửa trên trời)"
            color = NguHanhColor.Hoa.color
        case (.Canh, .Than), (.Tan, .Dau):
            txt = "Thạch lựu mộc (cây thạch lựu)"
            color = NguHanhColor.Moc.color
        case (.Nham, .Tuat), (.Quy, .Hoi):
            txt = "Đại hải thuỷ (nước biển lớn)"
            color = NguHanhColor.Thuy.color
        default:
            txt = "Không có thông tin"
            color = Constants.colorDefault
        }
    }
}
