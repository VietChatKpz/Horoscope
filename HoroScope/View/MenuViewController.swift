//
//  MenuViewController.swift
//  HoroScope
//
//  Created by VietChat on 4/5/24.
//

import UIKit
import MBRadioButton

class MenuViewController: UIViewController {
    
    @IBOutlet private weak var nameTF: UITextField!
    @IBOutlet private weak var yyTF: UITextField!
    @IBOutlet private weak var mmTF: UITextField!
    @IBOutlet private weak var ddTF: UITextField!
    @IBOutlet private weak var hTF: UITextField!
    @IBOutlet private weak var mTF: UITextField!
    @IBOutlet private weak var namBT: RadioButton!
    @IBOutlet private weak var nuBT: RadioButton!
    @IBOutlet private weak var button: UIButton!
    
    private var sexBool: Bool = true
    private var groupContainer = RadioButtonContainer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
    @IBAction func onClick(_ sender: Any) {
        guard let name = nameTF.text, !name.isEmpty,
              let yy = yyTF.text, !yy.isEmpty,
              let mm = mmTF.text, !mm.isEmpty,
              let dd = ddTF.text, !dd.isEmpty,
              let h = hTF.text, !h.isEmpty,
              let m = mTF.text, !m.isEmpty else { return }
        guard let year = Int(yy), let month = Int(mm), let day = Int(dd), let minute = Int(m), let hour = Int(h) else { return }
        if isValidDate(day, month, year) {
            let vc = ThienDiaViewController()
            vc.thienBan = ThienBan(solarBirthDate: SolarDate(dd: day, mm: month, yy: year, hour: hour, minute: minute), name: name, sex: sexBool)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension MenuViewController {
    func configuration() {
        nameTF.layer.borderColor = Constants.colorBorder
        yyTF.layer.borderColor = Constants.colorBorder
        mmTF.layer.borderColor = Constants.colorBorder
        ddTF.layer.borderColor = Constants.colorBorder
        hTF.layer.borderColor = Constants.colorBorder
        mTF.layer.borderColor = Constants.colorBorder
        button.backgroundColor = Constants.colorButtonAlpha
        nameTF.becomeFirstResponder()
        nameTF.delegate = self
        yyTF.delegate = self
        mmTF.delegate = self
        ddTF.delegate = self
        hTF.delegate = self
        mTF.delegate = self
        nameTF.addPadding(.left(8))
        yyTF.addPadding(.left(8))
        mmTF.addPadding(.left(8))
        ddTF.addPadding(.left(8))
        hTF.addPadding(.left(8))
        mTF.addPadding(.left(8))
        groupContainer.addButtons([namBT, nuBT])
        groupContainer.delegate = self
        groupContainer.selectedButton = sexBool ? namBT: nuBT
    }
    
    /// isValidDate
    /// ham dung de validate Date
    /// - Parameters:
    ///   - day: <#day description#>
    ///   - month: <#month description#>
    ///   - year: <#year description#>
    ///   Doi date sang lich calendar xem co ngay do trong lich khong
    ///   Check lại xem date có trung voi ngay trong lich khong
    /// - Returns: <#description#>
    func isValidDate(_ day: Int, _ month: Int, _ year: Int) -> Bool {
        let calendar = Calendar.current
        guard let date = calendar.date(from: DateComponents(year: year, month: month, day: day)) else {
            return false
        }
        guard calendar.component(.year, from: date) == year &&
                calendar.component(.month, from: date) == month &&
                calendar.component(.day, from: date) == day else {
            return false
        }
        return true
    }
}

extension MenuViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor =  UIColor.hexStringToUIColor(hex: "D83842").cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor =  Constants.colorBorder
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let name = (nameTF.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let yy = (yyTF.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let mm = (mmTF.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let dd = (ddTF.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let h = (hTF.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let m = (mTF.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        
        button.backgroundColor = name || yy || mm || dd || h || m ? Constants.colorButtonAlpha : isValidDate(Int(ddTF.text ?? "") ?? 0, Int(mmTF.text ?? "") ?? 0, Int(yyTF.text ?? "") ?? 0) ? Constants.colorButton : Constants.colorButtonAlpha
        
    }
}


extension MenuViewController: RadioButtonDelegate {
    func radioButtonDidSelect(_ button: MBRadioButton.RadioButton) {
        sexBool = button == namBT
    }
    
    func radioButtonDidDeselect(_ button: MBRadioButton.RadioButton) {
        
    }
}
