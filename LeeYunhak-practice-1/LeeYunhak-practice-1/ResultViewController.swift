//
//  ResultViewController.swift
//  LeeYunhak-practice-1
//
//  Created by 이윤학 on 10/7/23.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        bindText()
        setStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bindText()
        super.viewWillAppear(true)
    }
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    
    @IBOutlet var settingButtonLabel: UIButton!
    @IBOutlet var backButtonLabel: UIButton!
    
    var email: String?
    var password: String?
    var gender: Int? = nil
    var age: Int? = nil
    
    var delegate: GetDataProtocol?
    //var loginDataCompletion: (([String]) -> Void)?
    
    private func setStyle() {
        self.titleLabel.font = .systemFont(ofSize: 26, weight: .bold)
        
        self.settingButtonLabel.tintColor = .systemRed
        self.settingButtonLabel.backgroundColor = .systemGray6
        
        self.backButtonLabel.tintColor = .systemGray
        self.backButtonLabel.backgroundColor = .systemGray6
        
    }
    
    private func bindText() {
        self.emailLabel.text = "Email : \(email ?? "Check your Email")"
        self.passwordLabel.text = "Password : \(password ?? "Check your password")"
        self.genderLabel.text = "Gender: \(genderText())"
        self.ageLabel.text = "Age: \(ageText())"
    }
    
    private func genderText() -> String {
        switch gender {
        case 0 :
            return "Man"
        case 1 :
            return "Woman"
        case 2 :
            return "Etc."
        default :
            return "Check your gender"
        }
    }
    
    private func ageText() -> String {
        if let n = age {
            return "\(n)"
        } else {
            return "Check your age"
        }
    }
    
    
    
    @IBAction func backButtonTap(_ sender: Any) {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
        delegate?.getData(email: email, password: password, gender: gender, age: age)
        //guard let loginDataCompletion else {return}
        //loginDataCompletion([self.email, self.password])
    }
    
    
    @IBAction func SettingButtonTap(_ sender: Any) {
        guard let settingVC = self.storyboard?.instantiateViewController(identifier: "SettingViewController") as? SettingViewController else {return}
        settingVC.email = email
        settingVC.password = password
        settingVC.gender = gender ?? 2
        settingVC.age = age ?? 30
        
        settingVC.delegate = self
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
    
}

extension ResultViewController: GetDataProtocol {
    func getData(email: String?, password: String?, gender: Int?, age: Int?) {
        self.email = email
        self.password = password
        self.gender = gender
        self.age = age
    }
}
