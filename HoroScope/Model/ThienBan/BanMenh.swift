//
//  BanMenh.swift
//  HoroScope
//
//  Created by Hai Nam on 23/4/24.
//

import Foundation

class BanMenh {
    let txt: String
    init(can: Can, chi: Chi) {
        switch (can, chi) {
        case (.Giap, .Ti), (.Binh, .Suu):
            txt = "Hải trung kim"
        case (.Binh, .Dan), (.Dinh, .Mao):
            txt =  "Lô trung Hỏa (lửa trong lò)"
        case (.Mau, .Thin), (.Ky, .Ty):
            txt = "Đại lâm mộc (cây ở trong rừng)"
        case (.Canh, .Ngo), (.Tan, .Mui):
            txt = "Lộ bàng thổ (đất bên đường)"
        case (.Nham, .Than), (.Quy, .Dau):
            txt = "Kiếm phong kim (vàng đầy gươm)"
        case (.Giap, .Tuat), (.At, .Hoi):
            txt = "Sơn đầu hỏa (lửa đầu núi)"
        case (.Binh, .Ti), (.Dinh, .Suu):
            txt = "Giản hạ thủy (nước khe suối)"
        case (.Mau, .Dan), (.Ky, .Mao):
            txt = "Thành đầu thổ (đất đầu thành)"
        case (.Canh, .Thin), (.Tan, .Ty):
            txt = "Bạch lạp kim (đèn nến trắng)"
        case (.Nham, .Ngo), (.Quy, .Mui):
            txt = "Dương liễu mộc (cây dương liều)"
        case (.Giap, .Than), (.At, .Dau):
            txt = "Tuyền trung thủy (nước giữa suối)"
        case (.Binh, .Tuat), (.Dinh, .Hoi):
            txt = "Ốc thượng thổ (đất mái nhà)"
        case (.Mau, .Ti), (.Ky, .Suu):
            txt = "Tích lịch hỏa (lửa sấm sét)"
        case (.Canh, .Dan), (.Tan, .Mao):
            txt = "Tòng bách mộc (cây tòng bách)"
        case (.Nham, .Thin), (.Quy, .Ty):
            txt = "Tràng lưu thủy (nước dòng sông)"
        case (.Giap, .Ngo), (.At, .Mui):
            txt = "Sa trung kim (vàng trong cát)"
        case (.Binh, .Than), (.Dinh, .Dau):
            txt = "Sơn hạ hỏa (lửa dưới cát)"
        case (.Mau, .Tuat), (.Ky, .Hoi):
            txt = "Bình địa mộc (cây đồng bằng)"
        case (.Canh, .Ti), (.Tan, .Suu):
            txt = "Bịch thượng thổ (đất trên vách)"
        case (.Nham, .Dan), (.Quy, .Mao):
            txt = "Kim bạch kim (vàng bạch kim)"
        case (.Giap, .Thin), (.At, .Ty):
            txt = "Phú đăng hỏa (lửa ngọn đèn lớn)"
        case (.Binh, .Ngo), (.Dinh, .Mui):
            txt = "Thiên thượng thủy (nước trên trời)"
        case (.Mau, .Than), (.Ky, .Dau):
            txt = "Đất trach thổ (đất làm nhà)"
        case (.Canh, .Tuat), (.Tan, .Hoi):
            txt = "Xuyến thoa kim (vàng trong tay)"
        case (.Nham, .Ti), (.Quy, .Suu):
            txt = "Tang khô mộc (gỗ cây dâu)"
        case (.Giap, .Dan), (.At, .Mao):
            txt = "Đại khê thủy (nước suối lớn)"
        case (.Binh, .Thin), (.Dinh, .Ty):
            txt = "Sa trung thổ (đất giữa cát)"
        case (.Mau, .Ngo), (.Ky, .Mui):
            txt = "Thiên thượng hỏa (lửa trên trời)"
        case (.Canh, .Than), (.Tan, .Dau):
            txt = "Thạch lựu mộc (cây thạch lựu)"
        case (.Nham, .Tuat), (.Quy, .Hoi):
            txt = "Đại hải thuỷ (nước biển lớn)"
        default:
            txt = "Không có thông tin"
        }

    }
}
