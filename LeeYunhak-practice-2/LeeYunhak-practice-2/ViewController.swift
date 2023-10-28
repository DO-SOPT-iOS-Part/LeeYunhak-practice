//
//  ViewController.swift
//  2Week-seminar
//
//  Created by yeonsu on 10/14/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        //setLayout()
        //setStackLayout()
        // setContentLayout()
        setStackScrollLayout()
    }
    
    private var scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    private var leftStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    private var rightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    private var contentView = UIView()
    
    private func setStackScrollLayout() {
            self.view.addSubview(scrollView)
            scrollView.addSubview(contentView)
            
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            contentView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                         scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                         scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                         scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
            
            NSLayoutConstraint.activate([contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
                                         contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
                                         contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
                                         contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
                                         contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)])
            
     
            
            
                    [leftStackView, rightStackView].forEach {
                        $0.translatesAutoresizingMaskIntoConstraints = false
                        contentView.addSubview($0)
                    }

            NSLayoutConstraint.activate([leftStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                                         leftStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                         leftStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                                         leftStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2)])

            NSLayoutConstraint.activate([rightStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                                         rightStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
                                         rightStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                                         rightStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2)])
            
                    [yellowView, blackView].forEach {
                        NSLayoutConstraint.activate([$0.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                                     $0.heightAnchor.constraint(equalToConstant: 600)])
                        $0.translatesAutoresizingMaskIntoConstraints = false
                        leftStackView.addArrangedSubview($0)
                    }
            
                    [greenView, blueView].forEach {
                        $0.translatesAutoresizingMaskIntoConstraints = false
                        NSLayoutConstraint.activate([$0.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                                     $0.heightAnchor.constraint(equalToConstant: 600)])
                        rightStackView.addArrangedSubview($0)
                    }

    }
    
    private func setContentLayout() {
            self.view.addSubview(scrollView)
            scrollView.addSubview(contentView)
            
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            contentView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                         scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                         scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                         scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
            
            NSLayoutConstraint.activate([contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
                                         contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
                                         contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
                                         contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)])
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
            let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
            contentViewHeight.priority = .defaultLow
            contentViewHeight.isActive = true
            
            
            [greenView, blueView].forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview($0)
            }
            
            
            NSLayoutConstraint.activate([greenView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                                         greenView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                         greenView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
                                         greenView.heightAnchor.constraint(equalToConstant: 800)])
            
            NSLayoutConstraint.activate([blueView.topAnchor.constraint(equalTo: self.greenView.bottomAnchor),
                                         blueView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                         blueView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
                                         blueView.heightAnchor.constraint(equalToConstant: 800),
                                         blueView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)])
    }
    
    // 바둑판 생성
    private func setLayout() {
        [block1, block2, block3, block4].forEach { [weak self] view in
            guard let self else {return}
            
            // 오토사이징마스크로 인한 constraints 충돌을 피하기 위한 코드
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        let height = UIScreen.main.bounds.height/4
        let width = UIScreen.main.bounds.width/2
        
        NSLayoutConstraint.activate(
            [block1.topAnchor.constraint(equalTo: self.view.topAnchor),
             block1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
             block1.widthAnchor.constraint(equalToConstant: width),
             block1.heightAnchor.constraint(equalToConstant: height)
             ]
        )
        NSLayoutConstraint.activate(
            [block2.topAnchor.constraint(equalTo: self.block1.bottomAnchor),
             block2.leadingAnchor.constraint(equalTo: self.block1.trailingAnchor),
             block2.widthAnchor.constraint(equalToConstant: width),
             block2.heightAnchor.constraint(equalToConstant: height)
             ]
        )
        NSLayoutConstraint.activate(
            [block3.topAnchor.constraint(equalTo: self.block2.bottomAnchor),
             block3.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
             block3.widthAnchor.constraint(equalToConstant: width),
             block3.heightAnchor.constraint(equalToConstant: height)
             ]
        )
        NSLayoutConstraint.activate(
            [block4.topAnchor.constraint(equalTo: self.block3.bottomAnchor),
             block4.leadingAnchor.constraint(equalTo: self.block3.trailingAnchor),
             block4.widthAnchor.constraint(equalToConstant: width),
             block4.heightAnchor.constraint(equalToConstant: height)
             ]
        )
        
//        NSLayoutConstraint.activate(
//            [BadukEgg1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
//             BadukEgg1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100),
//             BadukEgg1.widthAnchor.constraint(equalToConstant: 6),
//             BadukEgg1.heightAnchor.constraint(equalToConstant: 6)]
//        )
//
//        NSLayoutConstraint.activate([BadukEgg2.topAnchor.constraint(equalTo: BadukEgg1.topAnchor, constant: 10),
//                                     BadukEgg2.leadingAnchor.constraint(equalTo: BadukEgg1.leadingAnchor, constant: 10),
//                                     BadukEgg2.widthAnchor.constraint(equalToConstant: 6),
//                                     BadukEgg2.heightAnchor.constraint(equalToConstant: 6)])
//        NSLayoutConstraint.activate([wall.topAnchor.constraint(equalTo: BadukEgg2.topAnchor, constant: 10),
//                                     wall.leadingAnchor.constraint(equalTo: BadukEgg2.leadingAnchor, constant: 10),
//                                     wall.widthAnchor.constraint(equalToConstant: 60),
//                                     wall.heightAnchor.constraint(equalToConstant: 20)])
    }
    
    // 바둑알 생성
    let BadukEgg1: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 6, height: 6)))
        
        view.backgroundColor = .black
        view.layer.cornerRadius = 3
        view.clipsToBounds = true
        return view
    }()
    
    let BadukEgg2: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 6, height: 6)))
        
        view.backgroundColor = .black
        view.layer.cornerRadius = 3
        view.clipsToBounds = true
        return view
    }()
    
    let wall: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 60, height: 20)))
        
        view.backgroundColor = .blue
        view.layer.cornerRadius = 3
        view.clipsToBounds = true
        return view
    }()
    
    let block1: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    let block2: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/4)))
            
        view.backgroundColor = .green
            
        return view
    }()

    let block3: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/4)))
            
        view.backgroundColor = .black
            
        return view
    }()

    let block4: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/4)))
            
        view.backgroundColor = .blue
            
        return view
    }()

    private func setStackLayout() {
        self.view.addSubview(HStackView)
        HStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [HStackView.topAnchor.constraint(equalTo: view.topAnchor),
             HStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             HStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             HStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)]
        )
        
        [makeColor(.yellow), makeColor(.white), makeColor(.black), makeColor(.white)].forEach{
            VStackView.addArrangedSubview($0)
        }

        [makeColor(.white), makeColor(.green), makeColor(.white), makeColor(.blue)].forEach{
            VStackView2.addArrangedSubview($0)
        }
        
        [VStackView, VStackView2].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            HStackView.addArrangedSubview($0)
        }
        
    }
    
    
    private var VStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    private var VStackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    private var HStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    private func makeColor(_ color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        return view
    }
    
    private var yellowView: UIView = {
       let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private var greenView: UIView = {
       let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    private var blackView: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    private var blueView: UIView = {
       let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private var whiteView1: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private var whiteView2: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private var whiteView3: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private var whiteView4: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
   
}

