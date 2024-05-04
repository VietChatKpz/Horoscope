//
//  MenuViewController.swift
//  HoroScope
//
//  Created by VietChat on 4/5/24.
//

import UIKit
import MBRadioButton

class MenuViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var yyTF: UITextField!
    @IBOutlet weak var mmTF: UITextField!
    @IBOutlet weak var ddTF: UITextField!
    @IBOutlet weak var hTF: UITextField!
    @IBOutlet weak var mTF: UITextField!
    @IBOutlet weak var namBT: RadioButton!
    @IBOutlet weak var nuBT: RadioButton!
    @IBOutlet weak var button: UIButton!
    
    var groupContainer = RadioButtonContainer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configuration()
    }
    @IBAction func onClick(_ sender: Any) {
        guard let name = nameTF.text, name.isEmpty,
        let yy = yyTF.text, yy.isEmpty,
        let mm = mmTF.text, mm.isEmpty,
        let dd = ddTF.text, dd.isEmpty,
        let h = hTF.text, h.isEmpty,
        let m = mTF.text, m.isEmpty else { return }
        
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension MenuViewController {
    func configuration() {
        nameTF.layer.borderColor = UIColor.hexStringToUIColor(hex: "D83842").withAlphaComponent(0.3).cgColor
        yyTF.layer.borderColor = UIColor.hexStringToUIColor(hex: "D83842").withAlphaComponent(0.3).cgColor
        mmTF.layer.borderColor = UIColor.hexStringToUIColor(hex: "D83842").withAlphaComponent(0.3).cgColor
        ddTF.layer.borderColor = UIColor.hexStringToUIColor(hex: "D83842").withAlphaComponent(0.3).cgColor
        hTF.layer.borderColor = UIColor.hexStringToUIColor(hex: "D83842").withAlphaComponent(0.3).cgColor
        mTF.layer.borderColor = UIColor.hexStringToUIColor(hex: "D83842").withAlphaComponent(0.3).cgColor
        button.backgroundColor = UIColor.hexStringToUIColor(hex: "D83842").withAlphaComponent(0.3)
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
    }
}

extension MenuViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor =  UIColor.hexStringToUIColor(hex: "D83842").cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor =  UIColor.hexStringToUIColor(hex: "D83842").withAlphaComponent(0.3).cgColor
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let name = (nameTF.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let yy = (yyTF.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let mm = (mmTF.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let dd = (ddTF.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let h = (hTF.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let m = (mTF.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        
        button.backgroundColor = name || yy || mm || dd || h || m ? UIColor.hexStringToUIColor(hex: "D83842").withAlphaComponent(0.3) : UIColor.hexStringToUIColor(hex: "D83842")
        
    }
}


extension MenuViewController: RadioButtonDelegate {
    func radioButtonDidSelect(_ button: MBRadioButton.RadioButton) {
        
    }
    
    func radioButtonDidDeselect(_ button: MBRadioButton.RadioButton) {
        
    }
}
