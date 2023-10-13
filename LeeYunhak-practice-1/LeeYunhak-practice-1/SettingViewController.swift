//
//  SettingViewController.swift
//  LeeYunhak-practice-1
//
//  Created by 이윤학 on 10/10/23.
//

import UIKit

final class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        bindText()
        setStyle()
    }
    
    @IBOutlet weak var settingTitleLabel: UILabel!
    @IBOutlet weak var emailTextEditorLabel: UITextField!
    @IBOutlet weak var passwordTextEditorLabel: UITextField!
    @IBOutlet weak var genderSelection: UISegmentedControl!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var ageLabel: UILabel!
    
    var email: String?
    var password: String?
    var gender: Int?
    var age: Int?
    
    var delegate: GetDataProtocol?
    
    private func bindText() {
        emailTextEditorLabel.text = email
        
        passwordTextEditorLabel.text = password
        
        genderSelection.selectedSegmentIndex = gender ?? 0
        ageSlider.minimumValue = 5
        ageSlider.maximumValue = 80
        
        ageSlider.value = Float(age ?? 30)
        ageLabel.text = "\(age ?? 30)"
    }
    
    private func setStyle() {
        self.ageLabel.font = .preferredFont(forTextStyle: .headline)
        self.ageLabel.shadowColor = .systemGray6
        setAgeColor()
    }
    
    private func setAgeColor() {
        self.ageLabel.textColor = ageSlider.value < 20 ? .systemGreen : .systemTeal
        self.ageSlider.tintColor = ageSlider.value < 20 ? .systemGreen : .systemTeal
    }
    
    @IBAction func emailTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let email = textField.text {
            self.email = email
        }
    }
    
    @IBAction func passwordTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let password = textField.text {
            self.password = password
        }
    }
    
    @IBAction func genderSelectionDidEditing(_ sender: Any) {
        guard let segmentedControl = sender as? UISegmentedControl else {return}
        self.gender = segmentedControl.selectedSegmentIndex
    }
    
    @IBAction func ageSliderDidEditing(_ sender: Any) {
        guard let slider = sender as? UISlider else {return}
        self.age = Int(slider.value)
        ageLabel.text = "\(age ?? 0)"
        setAgeColor()
    }
    
    @IBAction func saveAndBackButton(_ sender: Any) {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        }
        delegate?.getData(email: email, password: password, gender: gender, age: age)
    }
}
