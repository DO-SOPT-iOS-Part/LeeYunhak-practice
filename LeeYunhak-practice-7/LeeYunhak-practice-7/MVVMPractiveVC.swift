//
//  MVVMPractiveVC.swift
//  LeeYunhak-practice-7
//
//  Created by 이윤학 on 12/2/23.
//

import UIKit

import Then
import SnapKit

class MVVMPractiveVC: UIViewController {
    var viewModel = MVVMPracticeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        bindViewModel()
    }
    
    private func setLayout() {
        [tableView, randomButton].forEach {
            self.view.addSubview($0)
        }
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        randomButton.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
    }
    
    @objc private func randomButtonTap() {
        viewModel.randomButtonTap()
    }
    
    private lazy var randomButton = UIButton().then {
        $0.setTitle("두근두근 뽑기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self,
                     action: #selector(randomButtonTap),
                     for: .touchUpInside)
        $0.backgroundColor = .blue
    }
    private lazy var tableView = UITableView(frame: .zero, style: .plain).then {
        $0.register(CustomTVC.self, forCellReuseIdentifier: CustomTVC.identifier)
        $0.delegate = self
    }
    
    private func bindViewModel() {
        self.tableView.dataSource = viewModel
        self.viewModel.soptModel.bind { [weak self] _ in
            guard let self else { return }
            self.tableView.reloadData()
        }
    }
}

extension MVVMPractiveVC: UITableViewDelegate {}
