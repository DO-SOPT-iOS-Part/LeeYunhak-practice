//
//  PanGesture.swift
//  LeeYunhak-practice-5
//
//  Created by 이윤학 on 11/25/23.
//

import UIKit

import SnapKit
import Then
import Lottie

class PanGestureVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        self.view.backgroundColor = .white
    }
    
    private func setLayout() {
        self.view.addSubview(lottieView)
        self.view.addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        lottieView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(200)
        }
    }
    
    
    @objc private func didImageViewMoved(_ sender: UIPanGestureRecognizer) {
        let transition = sender.translation(in: imageView)
        let changedX = imageView.center.x + transition.x
        let changedY = imageView.center.y + transition.y
        self.imageView.center = .init(x: changedX,
                                     y: changedY)
        self.lottieView.center = .init(x: changedX, y: changedY)
        sender.setTranslation(.zero, in: imageView)
        
        if sender.state == .began {
            self.isDragging(state: true)
        } else if sender.state == .ended {
            self.isDragging(state: false)
        }
    }
    
    private func isDragging(state: Bool) {
        if state {
            self.lottieView.isHidden = false
            self.lottieView.play()
        } else {
            self.lottieView.isHidden = true
            self.lottieView.pause()
        }
    }
    
    private lazy var imageView = UIImageView(image: UIImage(named: "image")).then {
        let gesture = UIPanGestureRecognizer(target: self,
                                             action: #selector(didImageViewMoved(_:)))
        $0.addGestureRecognizer(gesture)
        $0.isUserInteractionEnabled = true
    }
    
    private let lottieView = LottieAnimationView(name: "dragAnimation").then {
        $0.loopMode = .loop
    }

}
