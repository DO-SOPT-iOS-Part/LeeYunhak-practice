//
//  ViewController.swift
//  LeeYunhak-practice-5
//
//  Created by 이윤학 on 11/25/23.
//

import UIKit

import SnapKit
import Then

class ViewController: UIViewController {
    var clickCount: Int = 0
    
    private let activityIndicator = UIActivityIndicatorView().then {
        $0.color = .black
        $0.hidesWhenStopped = true
        $0.style = .medium
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        layout()
        
    }
    private func setAnimation() {
        if self.clickCount > 5 {
            self.activityIndicator.startAnimating()
            self.activityIndicator.isHidden = false
            return
        }
        let randomX = CGFloat.random(in: 0 ... UIScreen.main.bounds.width - self.startButton.bounds.size.width)
        let randomY = CGFloat.random(in: 0 ... UIScreen.main.bounds.height - self.startButton.bounds.size.height)
        
        UIView.animateKeyframes(withDuration: 1, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4) {
                self.startButton.frame = .init(origin: .init(x: randomX, y: randomY),
                                               size: self.startButton.bounds.size)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.3) {
                self.startButton.alpha = 0
            }
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3) {
                self.startButton.alpha = 1
            }
            
        } completion: { _ in
            self.clickCount += 1
        }
    }
    
    private func layout() {
        [activityIndicator, startButton, pauseButton].forEach {
            self.view.addSubview($0)
        }
        activityIndicator.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        activityIndicator.isHidden = true
        
        startButton.snp.makeConstraints {
            $0.bottom.leading.equalTo(self.view.safeAreaLayoutGuide)
            $0.width.equalTo(80)
            $0.height.equalTo(40)
        }
        
        pauseButton.snp.makeConstraints {
            $0.bottom.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.width.equalTo(80)
            $0.height.equalTo(40)
        }
    }
    
    @objc private func startButtonTap() {
        setAnimation()
    }
    
    @objc private func pauseButtonTap() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
    }
    
    private lazy var startButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(startButtonTap),
                     for: .touchUpInside)
        $0.setTitle("시작", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    private lazy var pauseButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(pauseButtonTap),
                     for: .touchUpInside)
        $0.setTitle("일시 정지", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
}

