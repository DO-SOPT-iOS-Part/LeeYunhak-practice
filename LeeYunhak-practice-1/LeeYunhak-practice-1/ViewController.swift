//
//  ViewController.swift
//  LeeYunhak-practice-1
//
//  Created by 이윤학 on 10/7/23.
//

import UIKit

class ViewController: UIViewController {
    private var email: String? = nil
    private var password: String? = nil
    private var gender: Int? = nil
    private var age: Int? = nil
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var idTextFieldLabel: UITextField!
    @IBOutlet var passwordTextFieldLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.title = "zedd"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bindData()
        super.viewWillAppear(true)
    }
    
    private func bindData() {
        self.idTextFieldLabel.text = email
        self.passwordTextFieldLabel.text = password
    }
    
    @IBAction func idTextFieldDidEditing(_ sender: Any) {
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
    
    @IBAction func loginButtonTap(_ sender: Any) {
        print("\(email ?? "")\n\(password ?? "")")
        pushToResultVC()
    }
    
    // NavigationController로 화면 전환 및 값 전달 함수
    func pushToResultVC() {
        guard let resultVC = self.storyboard?.instantiateViewController(identifier: "ResultViewController") as? ResultViewController else {return}
        resultVC.email = email == "" ? nil : email
        resultVC.password = password == "" ? nil : password
        resultVC.gender = gender
        resultVC.age = age
         // delegate 패턴으로 데이터 받기
        resultVC.delegate = self
        // 클로저를 이용해 데이터 받기
        // resultVC.loginDataCompletion = {data in
        //    print("클로저로 받아온 email : \(data[0]), 클로저로 받아온 password : \(data[1])")
        //}
        
        self.navigationController?.pushViewController(resultVC, animated: true)
    }
    
    // Present 방식으로 화면 전환 및 값 전달 함수
    func presentToResultVC() {
        guard let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        resultVC.email = self.email == "" ? nil : self.email
        resultVC.password = self.password == "" ? nil : password
        self.present(resultVC, animated: true)
    }
    
    
    
}

// Delegate 구현.
extension ViewController: GetDataProtocol {
    func getData(email: String?, password: String?, gender: Int?, age: Int?) {
        self.password = password
        self.email = email
        self.gender = gender
        self.age = age
    }
    
}
