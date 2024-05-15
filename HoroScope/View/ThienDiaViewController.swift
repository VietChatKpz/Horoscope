//
//  ThienDiaViewController.swift
//  HoroScope
//
//  Created by VietChat on 13/5/24.
//

import UIKit

class ThienDiaViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var ttView: UIView!
    
    var thienBan: ThienBan = ThienBan(solarBirthDate: SolarDate(dd: 0, mm: 0, yy: 0, hour: 0, minute: 0), name: "", sex: true)
    var list: [DiaBan] = []
    var index = 0
    
    let trietLabel = UILabel()
    let tuanLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        configurationAnSao()
    }
        
    func configurationAnSao() {
        let lunar = LunarDate(solarDate: thienBan.solarBirthDate)
        let menhIndex = Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi.rawValue // Dựa vào tháng âm tìm mệnh thuộc vị trí nào trên lá số
        let anThanIndex = AnThan.generateArray(startWith: .Menh)[(12 - menhIndex) % 12] //Tìm vị trí bắt đầu của vòng An Thần
        let listAnThan = AnThan.generateArray(startWith: anThanIndex) // Danh sách An Thần
        let thaiTueIndex = ThaiTue.generateArray(startWith: .ThaiTue)[(12 - lunar.yyTxt.chi.rawValue) % 12]  //Tìm vị trí bắt đầu của vòng Thái Tuế dựa vào chi năm sinh
        let listThaiTue = ThaiTue.generateArray(startWith: thaiTueIndex) // Danh sách Thái Tuế
        let cucIndex = Cuc(menh: Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi, can: lunar.yyTxt.can).cuc.rawValue // Kiểm tra thuộc cục nào trả ra giá trị cục đấy
        let trangSinhList = listTrangSinh(lunar: lunar, cucIndex: cucIndex) //Danh sách Tràng Sinh
        let locTonList = listLocTon(lunar: lunar) // Danh sách Lộc Tồn
        let listTieuVan = listTieuVan(lunar: lunar) // Danh sách Tiểu Vận theo năm - Chi
        let listThangHan = thangHan(lunar: lunar, listTV: listTieuVan) // Vòng tháng hạn trên lá số
        let listCan = listCan(lunar: lunar) // Vòng Can Cung Vị trên lá số
        list = listDiaBan(listCan: listCan, listAnThan: listAnThan, cucIndex: cucIndex, trangSinhList: trangSinhList, locTonList: locTonList, listThaiTue: listThaiTue, listTieuVan: listTieuVan, listThangHan: listThangHan)
        anTuVi(lunar: lunar, list: list)
    }
    
    func listTrangSinh(lunar: LunarDate, cucIndex: Int) -> [TrangSinh] {
        //Kiểm tra Dương Nam, Dương Nữ, Âm Nam, Âm Nữ trả ra vòng tràng sinh thuận hay ngược
        return (thienBan.sex && lunar.yyTxt.can.rawValue % 2 == 0) || (!thienBan.sex && lunar.yyTxt.can.rawValue % 2 != 0) ? TrangSinh.generateArray(startWith: TrangSinh.trangSinhStartList[cucIndex - 2]) : TrangSinh.generateArray(startWith: TrangSinh.trangSinhStartReversedList[cucIndex - 2], reverse: true)
    }
    
    func listLocTon(lunar: LunarDate) -> [LocTon] {
        //Kiểm tra Dương Nam, Dương Nữ, Âm Nam, Âm Nữ trả ra vòng lộc tồn thuận hay ngược
        return (thienBan.sex && lunar.yyTxt.can.rawValue % 2 == 0) || (!thienBan.sex && lunar.yyTxt.can.rawValue % 2 != 0) ? LocTon.generateArray(startWith: LocTon.locTonStartList[lunar.yyTxt.can.rawValue]) : LocTon.generateArray(startWith: LocTon.locTonStartReversedList[lunar.yyTxt.can.rawValue], reverse: true)
    }
    
    func listCan(lunar: LunarDate) -> [Can] {
        var listCan = Can.generateArray(startWith: Can.listStart[lunar.yyTxt.can.rawValue % 5])
        let suffixCan = listCan.suffix(2)
        listCan.removeLast(2)
        listCan.insert(contentsOf: suffixCan, at: 0)
        return listCan
    }
    
    func listTieuVan(lunar: LunarDate) -> [Chi] {
        let vitri = Chi.listTieuVan[lunar.yyTxt.chi.rawValue % 4]
        let chi = Chi.generateArray(startWith: lunar.yyTxt.chi)[(12 - vitri) % 12]
        return Chi.generateArray(startWith: chi)
    }
    
    func thangHan(lunar: LunarDate, listTV: [Chi]) -> [Int] {
        let date = Date().toYear
        let chiNow = CanChi(yy: date).chi // Năm Chi hiện tại
        var number = Array(1...12)
        var index = 0
        if let indexNew = listTV.firstIndex(where: {$0 == chiNow}) {
            index = indexNew    // Năm Chi hiện tại thuộc vị trí năm hạn(tiểu hạn) nào trên lá số
        }
        let vtThang = index - lunar.mm + (lunar.hhTxt.chi.rawValue + 1)
        let vtThangNew = vtThang < -11 ? (vtThang % 12) + 12 : (vtThang + 12) > 11 ? vtThang % 12 : vtThang + 12
        let subArray1 = number[12 - vtThangNew..<12]
        let subArray2 = number[0..<12 - vtThangNew]
        number = Array(subArray1) + Array(subArray2)
        return number
    }
    
    func listDiaBan(listCan: [Can], listAnThan: [AnThan], cucIndex: Int, trangSinhList: [TrangSinh], locTonList: [LocTon], listThaiTue: [ThaiTue], listTieuVan: [Chi], listThangHan: [Int]) -> [DiaBan] {
        var list = [DiaBan]()
        for chi in Chi.list {
            let diaBan = DiaBan(id: chi.rawValue, cungVi: chi, cungViCan: listCan[chi.rawValue], cungThan: listAnThan[chi.rawValue], cungCuc: cucIndex + listAnThan[chi.rawValue].rawValue * 10, trangSinh: trangSinhList[chi.rawValue], locTon: locTonList[chi.rawValue], thaiTue: listThaiTue[chi.rawValue], tieuVan: listTieuVan[chi.rawValue], thangHan: listThangHan[chi.rawValue])
            list.append(diaBan)
            if diaBan.cungThan.rawValue == 5 {
                diaBan.saoKhac.append(.ThienThuong)
            }else if diaBan.cungThan.rawValue == 7 {
                diaBan.saoKhac.append(.ThienSu)
            }else if diaBan.thaiTue.rawValue == 1 {
                diaBan.saoKhac.append(.ThienKhong)
            }
        }
        return list
    }
        
    func anTuVi(lunar: LunarDate, list: [DiaBan]) {
        let dd = lunar.dd //Ngày âm năm sinh
        let mm = lunar.mm //Tháng âm năm sinh
        let hIndex = lunar.hhTxt.chi.rawValue //Giờ gì(Tí, Sửu,...)
        let cucIndex = Cuc(menh: Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi, can: lunar.yyTxt.can).cuc.rawValue // Cục nào
        let menhIndex = Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi.rawValue // Vị trí Mệnh ở đâu trên lá số
        let yyIndex = lunar.yyTxt.chi.rawValue // Chi năm sinh
        let yyCanIndex = lunar.yyTxt.can.rawValue // Can năm sinh
        let isYYTxtCan = lunar.yyTxt.can.rawValue % 2 == 0 // Can âm hay dương
        var index = 0
        var indexNew = 0
        var numberNew = 0
        var vitri = 2
        var a = 0
        //Tìm vị trí tử vi dựa trên ngày sinh và cục
        if dd % cucIndex != 0 {
            indexNew = (dd / cucIndex) + 1
            numberNew = indexNew * cucIndex
            a = numberNew - dd
            if a % 2 != 0 {
                index = indexNew - a
                vitri = vitri + index
            }else {
                index = indexNew + a
                vitri = vitri + index
            }
        }else {
            index = dd / cucIndex
            vitri = vitri + index
        }
        //An sao tử vi
        let vtTuVi = vitri - 1 > 0 ? vitri - 1 : (vitri - 1) + 12
        let vtThienDong = (vitri + 6) > 11 ? (vitri + 6) - 12 : (vitri + 6)
        let vtVuKhuc = (vitri + 7) > 11 ? (vitri + 7) - 12 : (vitri + 7)
        let vtThaiDuong = (vitri + 8) > 11 ? (vitri + 8) - 12 : (vitri + 8)
        let vtLiemTrinh = (vitri + 3) > 11 ? (vitri + 3) - 12 : (vitri + 3)
        let vtThienCo = (vitri + 10) > 11 ? (vitri + 10) - 12 : (vitri + 10)
        list[vtTuVi].cungTuVi.append(.TuVi)
        list[vtLiemTrinh].cungTuVi.append(.LiemTrinh)
        list[vtThienDong].cungTuVi.append(.ThienDong)
        list[vtVuKhuc].cungTuVi.append(.VuKhuc)
        list[vtThaiDuong].cungTuVi.append(.ThaiDuong)
        list[vtThienCo].cungTuVi.append(.ThienCo)
        
        let vitriTP = 4 - vtTuVi > 0 ? 4 - vtTuVi : 4 - vtTuVi + 12
        //An sao thiên phủ
        let vtThaiAm = vitriTP + 1 > 11 ? vitriTP + 1 - 12 : vitriTP + 1
        let vtCuMon = vitriTP + 3 > 11 ? vitriTP + 3 - 12 : vitriTP + 3
        let vtThienLuong = vitriTP + 5 > 11 ? vitriTP + 5 - 12 : vitriTP + 5
        let vtThienPhu = vitriTP > 11 ? vitriTP - 12 : vitriTP
        let vtPhaQuan = vitriTP + 10 > 11 ? vitriTP + 10 - 12 : vitriTP + 10
        let vtThamLang = vitriTP + 2 > 11 ? vitriTP + 2 - 12 : vitriTP + 2
        list[vtThienPhu].cungThienPhu.append(.ThienPhu)
        list[vtThaiAm].cungThienPhu.append(.ThaiAm)
        list[vtThamLang].cungThienPhu.append(.ThamLang)
        list[vtCuMon].cungThienPhu.append(.CuMon)
        list[vitriTP + 4 > 11 ? vitriTP + 4 - 12 : vitriTP + 4].cungThienPhu.append(.ThienTuong)
        list[vtThienLuong].cungThienPhu.append(.ThienLuong)
        list[vitriTP + 6 > 11 ? vitriTP + 6 - 12 : vitriTP + 6].cungThienPhu.append(.ThatSat)
        list[vtPhaQuan].cungThienPhu.append(.PhaQuan)
        
        //An sao theo tháng
        let vtHuuBat = SaoThang.HuuBat.vitriDiaBan[mm - 1]
        list[SaoThang.TaPhu.vitriDiaBan[mm - 1]].saoThang.append(.TaPhu)
        list[vtHuuBat].saoThang.append(.HuuBat)
        list[SaoThang.ThienHinh.vitriDiaBan[mm - 1]].saoThang.append(.ThienHinh)
        list[SaoThang.ThienRieu.vitriDiaBan[mm - 1]].saoThang.append(.ThienRieu)
        list[SaoThang.ThienY.vitriDiaBan[mm - 1]].saoThang.append(.ThienY)
        list[SaoThang.ThienGiai.vitriDiaBan[mm - 1]].saoThang.append(.ThienGiai)
        list[SaoThang.DiaGiai.vitriDiaBan[mm - 1]].saoThang.append(.DiaGiai)
        
        //An sao theo giờ
        let vtVanXuong = SaoGio.VanXuong.vitriDiaBan[hIndex]
        let vtVanKhuc = SaoGio.VanKhuc.vitriDiaBan[hIndex]
        list[vtVanXuong].saoGio.append(.VanXuong)
        list[vtVanKhuc].saoGio.append(.VanKhuc)
        list[SaoGio.DiaKhong.vitriDiaBan[hIndex]].saoGio.append(.DiaKhong)
        list[SaoGio.DiaKhiep.vitriDiaBan[hIndex]].saoGio.append(.DiaKhiep)
        list[SaoGio.ThaiPhu.vitriDiaBan[hIndex]].saoGio.append(.ThaiPhu)
        list[SaoGio.PhongCao.vitriDiaBan[hIndex]].saoGio.append(.PhongCao)
        
        //An sao theo cung Mệnh
        list[4].saoKhac.append(.ThienLa)
        list[10].saoKhac.append(.DiaVong)
        
        //An sao dựa vào sao tháng và sao giờ
        //SaoThang.TaPhu.vitriDiaBan[mm - 1]: vị trí sao Tả Phù trên Địa Bàn
        //lunar.dd - 1: ngày sinh âm vì đếm bắt đầu từ 0 nên -1
        //(SaoThang.TaPhu.vitriDiaBan[mm - 1] + (lunar.dd - 1)) > 11 Kiểm tra đếm đã hết 1 vòng hay chưa, nếu quá số vòng ta lấy số dư chia 12
        let vitriTaPhu = (SaoThang.TaPhu.vitriDiaBan[mm - 1] + (lunar.dd - 1))
        list[vitriTaPhu > 11 ? (vitriTaPhu % 12) : vitriTaPhu].saoKhac.append(.TamThai)
        let vitriVanXuong = (SaoGio.VanXuong.vitriDiaBan[hIndex] + (lunar.dd - 2))
        list[vitriVanXuong > 11 ? (vitriVanXuong % 12) : vitriVanXuong].saoKhac.append(.AnQuang)
        let vitriHuuBat = (SaoThang.HuuBat.vitriDiaBan[mm - 1] - (lunar.dd - 1))
        list[vitriHuuBat < -11 ? ((vitriHuuBat % 12) + 12) % 12 : (vitriHuuBat + 12) > 11 ? vitriHuuBat : (vitriHuuBat + 12) % 12].saoKhac.append(.BatToa)
        let vitriVanKhuc = (SaoGio.VanKhuc.vitriDiaBan[hIndex] - (lunar.dd - 2))
        list[vitriVanKhuc < -11 ? ((vitriVanKhuc % 12) + 12) % 12 : (vitriVanKhuc + 12) > 11 ? vitriVanKhuc : (vitriVanKhuc + 12) % 12].saoKhac.append(.ThienQuy)
        list[(menhIndex + yyIndex) > 11 ? (menhIndex + yyIndex) - 12 : (menhIndex + yyIndex)].saoKhac.append(.ThienTai)
        let thanIndex = 2 + (mm + (hIndex + 1) - 2) > 11 ? 2 + (mm + (hIndex + 1) - 2) - 12 : 2 + (mm + (hIndex + 1) - 2)
        list[thanIndex].than = "<THÂN>"
        list[(thanIndex + yyIndex) > 11 ? (thanIndex + yyIndex) - 12 : (thanIndex + yyIndex)].saoKhac.append(.ThienTho)
        let vitriThaiTue = (yyIndex - mm + (hIndex + 1))
        list[vitriThaiTue < -11 ? (vitriThaiTue % 12) + 12 : (vitriThaiTue + 12) > 11 ? vitriThaiTue % 12 : vitriThaiTue + 12].saoKhac.append(.DauQuan)
        var listChiHT = Chi.generateArray(startWith: .Dan)
        var listChiLT = Chi.generateArray(startWith: .Dan)
        if (thienBan.sex && isYYTxtCan) || (!thienBan.sex && !isYYTxtCan) {
            listChiHT = Chi.generateArray(startWith: Chi.listStartHoaTinh[yyIndex % 4])
            listChiLT = Chi.generateReversedArray(startWith: Chi.listStartLinhTinh[yyIndex % 4])
        }else {
            listChiHT = Chi.generateReversedArray(startWith: Chi.listStartHoaTinh[yyIndex % 4])
            listChiLT = Chi.generateArray(startWith: Chi.listStartLinhTinh[yyIndex % 4])
        }
        list[listChiHT[hIndex].rawValue].saoKhac.append(.HoaTinh)
        list[listChiLT[hIndex].rawValue].saoKhac.append(.LinhTinh)
        
        //An Sao Theo Tuổi
        list[SaoTuoi.PhuongCac.vitriDiaBan[yyIndex]].saoTuoi.append(.PhuongCac)
        list[SaoTuoi.GiaiThan.vitriDiaBan[yyIndex]].saoTuoi.append(.GiaiThan)
        list[SaoTuoi.LongTri.vitriDiaBan[yyIndex]].saoTuoi.append(.LongTri)
        list[SaoTuoi.NguyetDuc.vitriDiaBan[yyIndex]].saoTuoi.append(.NguyetDuc)
        list[SaoTuoi.ThienDuc.vitriDiaBan[yyIndex]].saoTuoi.append(.ThienDuc)
        list[SaoTuoi.ThienHy.vitriDiaBan[yyIndex]].saoTuoi.append(.ThienHy)
        list[SaoTuoi.ThienMa.vitriDiaBan[yyIndex]].saoTuoi.append(.ThienMa)
        list[SaoTuoi.ThienKhoc.vitriDiaBan[yyIndex]].saoTuoi.append(.ThienKhoc)
        list[SaoTuoi.ThienHu.vitriDiaBan[yyIndex]].saoTuoi.append(.ThienHu)
        list[SaoTuoi.DaoHoa.vitriDiaBan[yyIndex]].saoTuoi.append(.DaoHoa)
        list[SaoTuoi.HongLoan.vitriDiaBan[yyIndex]].saoTuoi.append(.HongLoan)
        list[SaoTuoi.HoaCai.vitriDiaBan[yyIndex]].saoTuoi.append(.HoaCai)
        list[SaoTuoi.KiepSat.vitriDiaBan[yyIndex]].saoTuoi.append(.KiepSat)
        list[SaoTuoi.PhaToai.vitriDiaBan[yyIndex]].saoTuoi.append(.PhaToai)
        list[SaoTuoi.CoThan.vitriDiaBan[yyIndex]].saoTuoi.append(.CoThan)
        list[SaoTuoi.QuaTu.vitriDiaBan[yyIndex]].saoTuoi.append(.QuaTu)
        
        //An Sao Theo Can Tuổi
        list[SaoThienCanTuoi.DaLa.vitriDiaBan[yyCanIndex]].saoCanTuoi.append(.DaLa)
        list[SaoThienCanTuoi.KinhDuong.vitriDiaBan[yyCanIndex]].saoCanTuoi.append(.KinhDuong)
        list[SaoThienCanTuoi.LuuHa.vitriDiaBan[yyCanIndex]].saoCanTuoi.append(.LuuHa)
        list[SaoThienCanTuoi.QuocAn.vitriDiaBan[yyCanIndex]].saoCanTuoi.append(.QuocAn)
        list[SaoThienCanTuoi.DuongPhu.vitriDiaBan[yyCanIndex]].saoCanTuoi.append(.DuongPhu)
        list[SaoThienCanTuoi.VanTinh.vitriDiaBan[yyCanIndex]].saoCanTuoi.append(.VanTinh)
        list[SaoThienCanTuoi.ThienKhoi.vitriDiaBan[yyCanIndex]].saoCanTuoi.append(.ThienKhoi)
        list[SaoThienCanTuoi.ThienViet.vitriDiaBan[yyCanIndex]].saoCanTuoi.append(.ThienViet)
        list[SaoThienCanTuoi.ThienQuan.vitriDiaBan[yyCanIndex]].saoCanTuoi.append(.ThienQuan)
        list[SaoThienCanTuoi.ThienPhuc.vitriDiaBan[yyCanIndex]].saoCanTuoi.append(.ThienPhuc)
        list[SaoThienCanTuoi.ThienTru.vitriDiaBan[yyCanIndex]].saoCanTuoi.append(.ThienTru)
        
        //Thái Dương - Tử vi
        //Vũ Khúc - Tử vi
        //Thiên Đồng - Tử vi
        //Thái Âm  - Thiên Phú
        //An bộ sao Tứ Hỏa
        switch lunar.yyTxt.can {
        case .Canh:
            list[vtThaiDuong].tuHoa.append(.HoaLoc)
            list[vtVuKhuc].tuHoa.append(.HoaQuyen)
            list[vtThaiAm].tuHoa.append(.HoaKhoa)
            list[vtThienDong].tuHoa.append(.HoaKy)
        case .Tan:
            list[vtCuMon].tuHoa.append(.HoaLoc)
            list[vtThaiDuong].tuHoa.append(.HoaQuyen)
            list[vtVanKhuc].tuHoa.append(.HoaKhoa)
            list[vtVanXuong].tuHoa.append(.HoaKy)
        case .Nham:
            list[vtThienLuong].tuHoa.append(.HoaLoc)
            list[vtTuVi].tuHoa.append(.HoaQuyen)
            list[vtThienPhu].tuHoa.append(.HoaKhoa)
            list[vtVuKhuc].tuHoa.append(.HoaKy)
        case .Quy:
            list[vtPhaQuan].tuHoa.append(.HoaLoc)
            list[vtCuMon].tuHoa.append(.HoaQuyen)
            list[vtThaiAm].tuHoa.append(.HoaKhoa)
            list[vtThamLang].tuHoa.append(.HoaKy)
        case .Giap:
            list[vtLiemTrinh].tuHoa.append(.HoaLoc)
            list[vtPhaQuan].tuHoa.append(.HoaQuyen)
            list[vtVuKhuc].tuHoa.append(.HoaKhoa)
            list[vtThaiDuong].tuHoa.append(.HoaKy)
        case .At:
            list[vtThienCo].tuHoa.append(.HoaLoc)
            list[vtThienLuong].tuHoa.append(.HoaQuyen)
            list[vtTuVi].tuHoa.append(.HoaKhoa)
            list[vtThaiAm].tuHoa.append(.HoaKy)
        case .Binh:
            list[vtThienDong].tuHoa.append(.HoaLoc)
            list[vtThienCo].tuHoa.append(.HoaQuyen)
            list[vtVanXuong].tuHoa.append(.HoaKhoa)
            list[vtLiemTrinh].tuHoa.append(.HoaKy)
        case .Dinh:
            list[vtThaiAm].tuHoa.append(.HoaLoc)
            list[vtThienDong].tuHoa.append(.HoaQuyen)
            list[vtThienCo].tuHoa.append(.HoaKhoa)
            list[vtCuMon].tuHoa.append(.HoaKy)
        case .Mau:
            list[vtThamLang].tuHoa.append(.HoaLoc)
            list[vtThaiAm].tuHoa.append(.HoaQuyen)
            list[vtHuuBat].tuHoa.append(.HoaKhoa)
            list[vtThienCo].tuHoa.append(.HoaKy)
        case .Ky:
            list[vtVuKhuc].tuHoa.append(.HoaLoc)
            list[vtThamLang].tuHoa.append(.HoaQuyen)
            list[vtThienLuong].tuHoa.append(.HoaKhoa)
            list[vtVanKhuc].tuHoa.append(.HoaKy)
        }
        
        addLabel(lunar: lunar)
    }
}

//MARK: -UIView Tuần - Triệt
extension ThienDiaViewController {
    func addLabel(lunar: LunarDate) {
        let height = Int(CGSize.getSafeAreaSize().height)
        let width = Int(CGSize.getSafeAreaSize().width)
        let widthLabel = 48 // Chiều rộng của label Tuần - Triệt
        let heightLabel = 24 // Chiều cao của label Tuần - Triệt
        let widthLabel2 = 24 // Chiều rộng một nửa của label Tuần - Triệt
        let heightLabel2 = 12 // Chiều cao một nửa của label Tuần - Triệt
        let widthCell = width/4 // Chiều rộng của 1 cell
        let heightCell = height/4 // Chiều cao của 1 cell
        
        //CGRect: Tí Sửu - Ngọ Mùi - Thân Dậu - Tỵ Thìn - Dần Mão - Tuất Hợi: Các vị trí x, y, chiều rộng, chiều cao của label trên collectionView
        let listFrame = [
            CGRect(x: widthCell * 2 - widthLabel2, y: heightCell * 3 - heightLabel2, width: widthLabel, height: heightLabel),  //Tí Sửu
            CGRect(x: widthCell * 2 - widthLabel2, y: heightCell - heightLabel2, width: widthLabel, height: heightLabel),   // Ngọ Mùi
            CGRect(x: widthCell * 3 + widthCell / 2 - widthLabel2, y: heightCell - heightLabel2, width: widthLabel, height: heightLabel),   // Thân Dậu
            CGRect(x: widthCell / 2 - widthLabel2, y: heightCell - heightLabel2, width: widthLabel, height: heightLabel),   // Tỵ Thìn
            CGRect(x: widthCell / 2 - widthLabel2, y: heightCell * 3 - heightLabel2, width: widthLabel, height: heightLabel),   // Dần Mão
            CGRect(x: widthCell * 3 + widthCell / 2 - widthLabel2, y: heightCell * 3 - heightLabel2, width: widthLabel, height: heightLabel)    // Tuất Hợi
        ]
        
        let yyCan = lunar.yyTxt.can
        switch yyCan {
        case .Canh, .At:
            trietLabel.frame = listFrame[1]
        case .Tan, .Binh:
            trietLabel.frame = listFrame[3]
        case .Nham, .Dinh:
            trietLabel.frame = listFrame[4]
        case .Quy, .Mau:
            trietLabel.frame = listFrame[0]
        case .Giap, .Ky:
            trietLabel.frame = listFrame[2]
        }
        trietLabel.text = "Triệt"
        trietLabel.backgroundColor = Constants.colorDefault
        trietLabel.textColor = .white
        trietLabel.textAlignment = .center
        let listDis: [[Can : Chi]] = [
            [.Giap:.Dan, .At:.Mao, .Binh:.Thin, .Dinh:.Ty, .Mau:.Ngo, .Ky:.Mui, .Canh:.Than, .Tan:.Dau, .Nham:.Tuat, .Quy:.Hoi],    // Tí Sửu
            [.Giap:.Than, .At:.Dau, .Binh:.Tuat, .Dinh:.Hoi, .Mau:.Ti, .Ky:.Suu, .Canh:.Dan, .Tan:.Mao, .Nham:.Thin, .Quy:.Ty],     // Ngọ Mùi
            [.Giap:.Tuat, .At:.Hoi, .Binh:.Ti, .Dinh:.Suu, .Mau:.Dan, .Ky:.Mao, .Canh:.Thin, .Tan:.Ty, .Nham:.Ngo, .Quy:.Mui],  // Thân Dậu
            [.Giap:.Ngo, .At:.Mui, .Binh:.Than, .Dinh:.Dau, .Mau:.Tuat, .Ky:.Hoi, .Canh:.Ti, .Tan:.Suu, .Nham:.Dan, .Quy:.Mao],  // Tỵ Thìn
            [.Giap:.Thin, .At:.Ty, .Binh:.Ngo, .Dinh:.Mui, .Mau:.Than, .Ky:.Dau, .Canh:.Tuat, .Tan:.Hoi, .Nham:.Ti, .Quy:.Suu],     // Mão Dần
            [.Giap:.Ti, .At:.Suu, .Binh:.Dan, .Dinh:.Mao, .Mau:.Thin, .Ky:.Ty, .Canh:.Ngo, .Tan:.Mui, .Nham:.Than, .Quy:.Dau]       // Tuất Hợi
        ]
        let canChi: (Can, Chi) = (lunar.yyTxt.can, lunar.yyTxt.chi) // Can chi năm sinh
        if let index = listDis.enumerated().compactMap({ $0.element[canChi.0] == canChi.1 ? $0.offset : nil }).first {
            tuanLabel.frame = listFrame[index]
        }else {
            print("Không tìm thấy tuần")
        }
        tuanLabel.text = "Tuần"
        tuanLabel.backgroundColor = Constants.colorDefault
        tuanLabel.textColor = .white
        tuanLabel.textAlignment = .center
        ttView.addSubview(trietLabel)
        ttView.addSubview(tuanLabel)
        
        // Các điểm x, y của từng cell tương ứng trên collectionView
        let points: [CGPoint] = [ CGPoint(x: widthCell * 2 + widthCell / 2, y: heightCell * 3),
                                  CGPoint(x: widthCell + widthCell / 2, y: heightCell * 3),
                                  CGPoint(x: widthCell, y: heightCell * 3),
                                  CGPoint(x: widthCell, y: heightCell * 2 + heightCell / 2),
                                  CGPoint(x: widthCell, y: heightCell + heightCell / 2),
                                  CGPoint(x: widthCell, y: heightCell),
                                  CGPoint(x: widthCell + widthCell / 2, y: heightCell),
                                  CGPoint(x: widthCell * 2 + widthCell / 2, y: heightCell),
                                  CGPoint(x: widthCell * 3, y: heightCell),
                                  CGPoint(x: widthCell * 3, y: heightCell + heightCell / 2),
                                  CGPoint(x: widthCell * 3, y: heightCell * 2 + heightCell / 2),
                                  CGPoint(x: widthCell * 3, y: heightCell * 3) ]
        let vtMenh = list.firstIndex(where: { $0.cungThan == .Menh })
        let vtQuanLoc = list.firstIndex(where: { $0.cungThan == .QuanLoc })
        let vtTaiBach = list.firstIndex(where: { $0.cungThan == .TaiBach })
        let vtThienDi = list.firstIndex(where: { $0.cungThan == .ThienDi })
        let customLine = CustomLineView(frame: self.view.bounds)
        if let vtMenh = vtMenh {
            customLine.addPoint(points[vtMenh])
        }
        if let vtQuanLoc = vtQuanLoc {
            customLine.addPoint(points[vtQuanLoc])
        }
        if let vtTaiBach = vtTaiBach {
            customLine.addPoint(points[vtTaiBach])
        }
        if let vtThienDi = vtThienDi {
            customLine.addPoint(points[vtThienDi])
        }
        customLine.backgroundColor = .clear
        self.ttView.addSubview(customLine)
    }
}

//MARK: - Collectionview Layout initilize
extension ThienDiaViewController {
    func setupCollectionView() {
        collectionView.collectionViewLayout = createLayout()
        collectionView.register(UINib(nibName: "ThienBanCell", bundle: nil), forCellWithReuseIdentifier: "ThienBanCell")
        collectionView.register(UINib(nibName: "DiaBanCell", bundle: nil), forCellWithReuseIdentifier: "DiaBanCell")
        collectionView.dataSource = self
    }
    
    func createLayout() -> UICollectionViewLayout {
        let firstOrThirdLineItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/4),
                heightDimension: .fractionalHeight(1)))
        firstOrThirdLineItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        let firstOrThirdLineGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/4)),
            subitems: [firstOrThirdLineItem, firstOrThirdLineItem, firstOrThirdLineItem, firstOrThirdLineItem])
        
        //Define second line
        let secondLineSmallItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/2)))
        secondLineSmallItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        let leadingOrTrailingGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/4),
                heightDimension: .fractionalHeight(1)),
            subitems: [secondLineSmallItem, secondLineSmallItem])
        let secondLineMainItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/2),
                heightDimension: .fractionalHeight(1)))
        secondLineMainItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        let secondLineGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/2)),
            subitems: [leadingOrTrailingGroup, secondLineMainItem, leadingOrTrailingGroup])
        
        //return
        let resGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)),
            subitems: [firstOrThirdLineGroup, secondLineGroup, firstOrThirdLineGroup])
        let section = NSCollectionLayoutSection(group: resGroup)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

//MARK: CollectionView Data Source
extension ThienDiaViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "DiaBanCell", for: indexPath) as! DiaBanCell
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ThienBanCell", for: indexPath) as! ThienBanCell
        let diaBanIndex = [5,6,7,8,4,3,-1,9,10,2,1,0,11]
        if indexPath.row != 6 {
            cell1.diaBan = list[diaBanIndex[indexPath.row]]
            switch indexPath.row {
            case 1, 10:
                cell1.lineLeft.isHidden = true
                cell1.lineRight.isHidden = true
            case 2, 11:
                cell1.lineRight.isHidden = true
            case 4, 7:
                cell1.lineTop.isHidden = true
                cell1.lineBottom.isHidden = true
            case 5, 8:
                cell1.lineBottom.isHidden = true
            default:
                cell1.lineLeft.isHidden = false
                cell1.lineTop.isHidden = false
                cell1.lineRight.isHidden = false
                cell1.lineBottom.isHidden = false
            }
            return cell1
        } else {
            cell2.thienBan = ThienBan(solarBirthDate: thienBan.solarBirthDate, name: thienBan.name, sex: thienBan.sex)
            return cell2
        }
    }
}
