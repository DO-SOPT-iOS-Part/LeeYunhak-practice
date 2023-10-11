//
//  SettingViewController.swift
//  LeeYunhak-practice-1
//
//  Created by 이윤학 on 10/10/23.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        bindText()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet var settingTitleLabel: UILabel!
    @IBOutlet var emailTextEditorLabel: UITextField!
    @IBOutlet var passwordTextEditorLabel: UITextField!
    @IBOutlet var genderSelection: UISegmentedControl!
    @IBOutlet var ageSelection: UISlider!
    @IBOutlet var ageLabel: UILabel!
    
    var email: String? = nil
    var password: String? = nil
    var gender: Int? = nil
    var age: Int? = nil
    
    var delegate: GetDataProtocol?
    
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
    }
    
   
    @IBAction func saveAndBackButton(_ sender: Any) {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        }
        delegate?.getData(email: email, password: password, gender: gender, age: age)
    }
    
    
    private func bindText() {
        emailTextEditorLabel.text = email
        
        passwordTextEditorLabel.text = password
        
        genderSelection.selectedSegmentIndex = gender ?? 0
        ageSelection.minimumValue = 5
        ageSelection.maximumValue = 80
        
        ageSelection.value = Float(age ?? 30)
        ageLabel.text = "\(age ?? 30)"
    }
}
