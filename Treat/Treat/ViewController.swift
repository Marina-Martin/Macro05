//
//  ViewController.swift
//  Treat
//
//  Created by Marina Martin on 13/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let title = UILabel()
        
        title.text = "Suas Atividades"
        title.textColor = UIColor(named: "AppWhite")
        title.font = UIFont(name: "RadioCanada-Regular_bold", size: 32)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "AppBlack")
        
        setConstraints()
    }

    func setConstraints(){
        setTitleLabel()
    }
    
    func setTitleLabel() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
    }
}

#Preview(){
    return ViewController()
}
