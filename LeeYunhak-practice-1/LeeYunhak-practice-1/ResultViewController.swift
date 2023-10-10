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
        // Do any additional setup after loading the view.
    }
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    
    var email: String = ""
    var password: String = ""


    var delegate: GetDataProtocol?
    var loginDataCompletion: (([String]) -> Void)?
    
    private func bindText() {
        self.emailLabel.text = "email : \(email)"
        self.passwordLabel.text = "password : \(password)"
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
