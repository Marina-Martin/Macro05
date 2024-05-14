//
//  ViewController.swift
//  Treat
//
//  Created by Marina Martin on 13/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "AppBlack")
        
        navigationItem.title = "Suas Atividades"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "AppWhite") ?? .white, NSAttributedString.Key.font: UIFont(name: "RadioCanada-Regular_bold", size: 32)!]
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: (UIImage(systemName: "plus.circle.fill")), style: .plain, target: nil, action: nil),
            UIBarButtonItem(image: (UIImage(systemName: "line.3.horizontal.decrease.circle")), style: .plain, target: nil, action: nil),
            ]
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        //setConstraints()
    }

    func setConstraints(){
        //setTitleLabel()
    }
    
    func setTitleLabel() {
//        view.addSubview(titleLabel)
//        
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
//            titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
//        ])
    }
}

#Preview(){
    return ViewController()
}
