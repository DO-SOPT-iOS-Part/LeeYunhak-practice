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
        setTitleStyle()
    }
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    
    var email: String = ""
    var password: String = ""
    var gender: String = ""
    var age: String = ""
    
    var delegate: GetDataProtocol?
    var loginDataCompletion: (([String]) -> Void)?
    
    private func setTitleStyle() {
        self.titleLabel.font = .systemFont(ofSize: 26, weight: .bold)

    }
    
    private func bindText() {
        self.emailLabel.text = "Email : \(email == "" ? "Check your Email" : "\(email)")"
        self.passwordLabel.text = "Password : \(password == "" ? "Check your password" : "\(password)")"
        self.genderLabel.text = "Gender: \(gender == "" ? "Check your Gender" : "\(gender)")"
        self.ageLabel.text = "Age: \(age == "" ? "Check your age" : "\(age)")"
    }
    
    @IBAction func backButtonTap(_ sender: Any) {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
        delegate?.getLoginData(email: self.email, password: self.password)
        guard let loginDataCompletion else {return}
        loginDataCompletion([self.email, self.password])
    }
    
}
