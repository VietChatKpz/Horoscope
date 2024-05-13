//
//  HomeViewController.swift
//  HoroScope
//
//  Created by VietChat on 26/4/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var trietView: UIView!
    
    var thienBan: ThienBan = ThienBan(solarBirthDate: SolarDate(dd: 0, mm: 0, yy: 0, hour: 0, minute: 0), name: "", sex: true)
    var list: [DiaBan] = []
    var index = 0
    
//    private var trietLabel: UILabel {
//        let label = UILabel()
//        label.backgroundColor = Constants.colorDefault
//        label.textColor = .white
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        label.text = "Triệt"
//        return label
//    }
//    
//    private var tuanLabel: UILabel {
//        let label = UILabel()
//        label.backgroundColor = Constants.colorDefault
//        label.textColor = .white
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        label.text = "Tuần"
//        return label
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        configurationAnSao()
    }
    
    func configurationAnSao() {
        let lunar = LunarDate(solarDate: thienBan.solarBirthDate)
        let lunarChiIndex = lunar.yyTxt.chi.rawValue
        let menhIndex = Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi.rawValue
        let anThanIndex = AnThan.generateArray(startWith: .Menh)[(12 - menhIndex) % 12]
        let listAnThan = AnThan.generateArray(startWith: anThanIndex)
        let thaiTueIndex = ThaiTue.generateArray(startWith: .ThaiTue)[(12 - lunarChiIndex) % 12]
        let listThaiTue = ThaiTue.generateArray(startWith: thaiTueIndex)
        let cucIndex = Cuc(menh: Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi, can: lunar.yyTxt.can).cuc.rawValue
        var trangSinhList = TrangSinh.generateArray(startWith: .DeVuong)
        var locTonList = LocTon.generateArray(startWith: .BacSi)
        let isYYTxtCan = lunar.yyTxt.can.rawValue % 2 == 0
        if (thienBan.sex && isYYTxtCan) || (!thienBan.sex && !isYYTxtCan) {
            //an sao vong trang sinh
            trangSinhList = TrangSinh.generateArray(startWith: TrangSinh.trangSinhStartList[cucIndex - 2])
            //an sao vong loc ton
            locTonList = LocTon.generateArray(startWith: LocTon.locTonStartList[lunar.yyTxt.can.rawValue])
        }else {
            trangSinhList = TrangSinh.generateReversedArray(startWith: TrangSinh.trangSinhStartReversedList[cucIndex - 2])
            locTonList = LocTon.generateReversedArray(startWith: LocTon.locTonStartReversedList[lunar.yyTxt.can.rawValue])
        }
        for chi in Chi.list {
            let diaBan = DiaBan(id: chi.rawValue,cungVi: chi, cungThan: listAnThan[chi.rawValue], cungCuc: cucIndex + listAnThan[chi.rawValue].rawValue * 10, trangSinh: trangSinhList[chi.rawValue], locTon: locTonList[chi.rawValue], thaiTue: listThaiTue[chi.rawValue])
            list.append(diaBan)
            if diaBan.cungThan.rawValue == 5 {
                diaBan.saoKhac.append(.ThienThuong)
            }else if diaBan.cungThan.rawValue == 7 {
                diaBan.saoKhac.append(.ThienSu)
            }else if diaBan.thaiTue.rawValue == 1 {
                diaBan.saoKhac.append(.ThienKhong)
            }
        }
        anTuVi(lunar: lunar, list: list)
        addLabel()
    }
    
    func anTuVi(lunar: LunarDate, list: [DiaBan]) {
        let number = lunar.dd
        let mm = lunar.mm
        let hIndex = lunar.hhTxt.chi.rawValue
        let cucIndex = Cuc(menh: Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi, can: lunar.yyTxt.can).cuc.rawValue
        let menhIndex = Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi.rawValue
        let yyIndex = lunar.yyTxt.chi.rawValue
        let yyCanIndex = lunar.yyTxt.can.rawValue
        let isYYTxtCan = lunar.yyTxt.can.rawValue % 2 == 0
        var index = 0
        var indexNew = 0
        var numberNew = 0
        var vitri = 2
        var a = 0
        var vitriTPNew = 0
        if number % cucIndex != 0 {
            indexNew = (number / cucIndex) + 1
            numberNew = indexNew * cucIndex
            a = numberNew - number
            if a % 2 != 0 {
                index = indexNew - a
                vitri = vitri + index
            }else {
                index = indexNew + a
                vitri = vitri + index
            }
        }else {
            index = number / cucIndex
            vitri = vitri + index
        }
        //An sao tử vi
        let vtTuVi = vitri - 1
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
        
        let vitriTV = vitri - 1
        let vitriTP = 2 + 2 - vitriTV
        if vitriTP > 0 {
            vitriTPNew = 4 - vitriTV
        }else {
            vitriTPNew = 4 - vitriTV + 12
        }
        
        //An sao thiên phủ
        let vtThaiAm = vitriTPNew + 1 > 11 ? vitriTPNew + 1 - 12 : vitriTPNew + 1
        let vtCuMon = vitriTPNew + 3 > 11 ? vitriTPNew + 3 - 12 : vitriTPNew + 3
        let vtThienLuong = vitriTPNew + 5 > 11 ? vitriTPNew + 5 - 12 : vitriTPNew + 5
        let vtThienPhu = vitriTPNew > 11 ? vitriTPNew - 12 : vitriTPNew
        let vtPhaQuan = vitriTPNew + 10 > 11 ? vitriTPNew + 10 - 12 : vitriTPNew + 10
        let vtThamLang = vitriTPNew + 2 > 11 ? vitriTPNew + 2 - 12 : vitriTPNew + 2
        list[vtThienPhu].cungThienPhu.append(.ThienPhu)
        list[vtThaiAm].cungThienPhu.append(.ThaiAm)
        list[vtThamLang].cungThienPhu.append(.ThamLang)
        list[vtCuMon].cungThienPhu.append(.CuMon)
        list[vitriTPNew + 4 > 11 ? vitriTPNew + 4 - 12 : vitriTPNew + 4].cungThienPhu.append(.ThienTuong)
        list[vtThienLuong].cungThienPhu.append(.ThienLuong)
        list[vitriTPNew + 6 > 11 ? vitriTPNew + 6 - 12 : vitriTPNew + 6].cungThienPhu.append(.ThatSat)
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
        list[vitriHuuBat < -11 ? ((vitriHuuBat % 12) + 12) : (vitriHuuBat + 12) > 11 ? vitriHuuBat : vitriHuuBat + 12].saoKhac.append(.BatToa)
        let vitriVanKhuc = (SaoGio.VanKhuc.vitriDiaBan[hIndex] - (lunar.dd - 2))
        list[vitriVanKhuc < -11 ? ((vitriVanKhuc % 12) + 12) : (vitriVanKhuc + 12) > 11 ? vitriVanKhuc : vitriVanKhuc + 12].saoKhac.append(.ThienQuy)
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
    }
}

//MARK: -UIView Tuần - Triệt
extension HomeViewController {
    func addLabel() {
        
//        trietLabel.frame = CGRect(x: 30, y: 40, width: 50, height: 20)
//        trietView.addSubview(trietLabel)
//        trietView.addSubview(tuanLabel)
    }
}

//MARK: - Collectionview Layout initilize
extension HomeViewController {
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
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "DiaBanCell", for: indexPath) as! DiaBanCell
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ThienBanCell", for: indexPath) as! ThienBanCell
        if indexPath.row != 6 {
            cell1.diaBan = list[3]
            switch indexPath.row {
            case 0:
                cell1.diaBan = list[5]
            case 1:
                cell1.diaBan = list[6]
                cell1.lineLeft.isHidden = true
                cell1.lineRight.isHidden = true
            case 2:
                cell1.diaBan = list[7]
                cell1.lineRight.isHidden = true
            case 3:
                cell1.diaBan = list[8]
            case 4:
                cell1.diaBan = list[4]
                cell1.lineTop.isHidden = true
                cell1.lineBottom.isHidden = true
            case 5:
                cell1.diaBan = list[3]
                cell1.lineBottom.isHidden = true
            case 7:
                cell1.diaBan = list[9]
                cell1.lineTop.isHidden = true
                cell1.lineBottom.isHidden = true
            case 8:
                cell1.diaBan = list[10]
                cell1.lineBottom.isHidden = true
            case 9:
                cell1.diaBan = list[2]
            case 10:
                cell1.diaBan = list[1]
                cell1.lineLeft.isHidden = true
                cell1.lineRight.isHidden = true
            case 11:
                cell1.diaBan = list[0]
                cell1.lineRight.isHidden = true
            default:
                cell1.diaBan = list[11]
            }
            return cell1
        } else {
            cell2.thienBan = ThienBan(solarBirthDate: thienBan.solarBirthDate, name: thienBan.name, sex: thienBan.sex)
            return cell2
        }
    }
}
