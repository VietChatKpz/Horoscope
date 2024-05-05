//
//  HomeViewController.swift
//  HoroScope
//
//  Created by VietChat on 26/4/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
//    let solar = SolarDate(dd: 31, mm: 10, yy: 2000, hour: 5, minute: 30)
    var thienBan: ThienBan = ThienBan(solarBirthDate: SolarDate(dd: 0, mm: 0, yy: 0, hour: 0, minute: 0), name: "", sex: true)
//    let lunar = LunarDate(solarDate: solar)
    var list: [DiaBan] = []
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        data()
        
    }
    
    func setupCollectionView() {
        collectionView.collectionViewLayout = createLayout()
        collectionView.register(UINib(nibName: "ThienBanCell", bundle: nil), forCellWithReuseIdentifier: "ThienBanCell")
        collectionView.register(UINib(nibName: "DiaBanCell", bundle: nil), forCellWithReuseIdentifier: "DiaBanCell")
//        collectionView.delegate = self
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
    
    func data() {
        let lunar = LunarDate(solarDate: thienBan.solarBirthDate)
        let menhIndex = Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi.rawValue
        let anThanIndex = AnThan.generateArray(startWith: .Menh, length: 12)[12-menhIndex]
        let listAnThan = AnThan.generateArray(startWith: anThanIndex, length: 12)
        let cucIndex = Cuc(menh: Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi, can: lunar.yyTxt.can).cuc.rawValue
        let cuc = Cuc(menh: Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi, can: lunar.yyTxt.can).cuc
        if thienBan.sex {
            if lunar.yyTxt.can.rawValue % 2 == 0 {
                switch cuc {
                case .ThuyNhiCuc:
                    let trangSinhIndex = TrangSinh.generateArray(startWith: .DeVuong, length: 12)
                case .MocTamCuc:
                    print("2")
                case .KimTuCuc:
                    print("3")
                case .ThoNguCuc:
                    let trangSinhIndex = TrangSinh.generateArray(startWith: .DeVuong, length: 12)
                case .HoaLucCuc:
                    print("5")
                }
            }else {
                switch cuc {
                case .ThuyNhiCuc:
                    print("6")
                case .MocTamCuc:
                    print("7")
                case .KimTuCuc:
                    print("8")
                case .ThoNguCuc:
                    print("9")
                case .HoaLucCuc:
                    print("10")
                }
            }
        }else {
            if lunar.yyTxt.can.rawValue % 2 == 0 {
                switch cuc {
                case .ThuyNhiCuc:
                    print("11")
                case .MocTamCuc:
                    print("12")
                case .KimTuCuc:
                    print("13")
                case .ThoNguCuc:
                    print("14")
                case .HoaLucCuc:
                    print("15")
                }
            }else {
                switch cuc {
                case .ThuyNhiCuc:
                    print("141")
                case .MocTamCuc:
                    print("21")
                case .KimTuCuc:
                    print("31")
                case .ThoNguCuc:
                    print("41")
                case .HoaLucCuc:
                    print("51")
                }
            }
        }
        for chi in Chi.list {
            let diaBan = DiaBan(cungChi: chi, cungThan: listAnThan[chi.rawValue], cungCuc: cucIndex + listAnThan[chi.rawValue].rawValue*10)
            list.append(diaBan)
        }
        anTuVi(lunar: lunar, list: list)
    }
    
    func anTuVi(lunar: LunarDate, list: [DiaBan]) {
        let number = lunar.dd
        let cucIndex = Cuc(menh: Menh(with: lunar.mm, chi: lunar.hhTxt.chi).chi, can: lunar.yyTxt.can).cuc.rawValue
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
        list[vitri - 1].cungTuVi.append(.TuVi)
        list[(vitri+3) > 11 ? (vitri+3) - 12 : (vitri+3)].cungTuVi.append(.LiemTrinh)
        list[(vitri+6) > 11 ? (vitri+6) - 12 : (vitri+6)].cungTuVi.append(.ThienDong)
        list[(vitri+7) > 11 ? (vitri+7) - 12 : (vitri+7)].cungTuVi.append(.VuKhuc)
        list[(vitri+8) > 11 ? (vitri+8) - 12 : (vitri+8)].cungTuVi.append(.ThaiDuong)
        list[(vitri+10) > 11 ? (vitri+10) - 12 : (vitri+10)].cungTuVi.append(.ThienCo)
        
        let vitriTV = vitri-1
        let vitriTP = 2+2-vitriTV
        if vitriTP > 0 {
            vitriTPNew = 4 - vitriTV
        }else {
            vitriTPNew = 4 - vitriTV + 12
        }
        list[vitriTPNew > 11 ? vitriTPNew-12 : vitriTPNew].cungThienPhu.append(.ThienPhu)
        list[vitriTPNew+1 > 11 ? vitriTPNew+1-12 : vitriTPNew+1].cungThienPhu.append(.ThaiAm)
        list[vitriTPNew+2 > 11 ? vitriTPNew+2-12 : vitriTPNew+2].cungThienPhu.append(.ThamLang)
        list[vitriTPNew+3 > 11 ? vitriTPNew+3-12 : vitriTPNew+3].cungThienPhu.append(.CuMon)
        list[vitriTPNew+4 > 11 ? vitriTPNew+4-12 : vitriTPNew+4].cungThienPhu.append(.ThienTuong)
        list[vitriTPNew+5 > 11 ? vitriTPNew+5-12 : vitriTPNew+5].cungThienPhu.append(.ThienLuong)
        list[vitriTPNew+6 > 11 ? vitriTPNew+6-12 : vitriTPNew+6].cungThienPhu.append(.ThatSat)
        list[vitriTPNew+10 > 11 ? vitriTPNew+10-12 : vitriTPNew+10].cungThienPhu.append(.PhaQuan)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "DiaBanCell", for: indexPath) as! DiaBanCell
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ThienBanCell", for: indexPath) as! ThienBanCell
        cell1.backgroundColor = .blue
        cell2.backgroundColor = .black
        if indexPath.row != 6 {
            cell1.diaBan = list[3]
            switch indexPath.row {
            case 0:
                cell1.diaBan = list[5]
            case 1:
                cell1.diaBan = list[6]
            case 2:
                cell1.diaBan = list[7]
            case 3:
                cell1.diaBan = list[8]
            case 4:
                cell1.diaBan = list[4]
            case 5:
                cell1.diaBan = list[3]
            case 7:
                cell1.diaBan = list[9]
            case 8:
                cell1.diaBan = list[10]
            case 9:
                cell1.diaBan = list[2]
            case 10:
                cell1.diaBan = list[1]
            case 11:
                cell1.diaBan = list[0]
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
