//
//  ActivityButtonView.swift
//  Treat
//
//  Created by Marina Martin on 22/05/24.
//

import UIKit

class ActivityButtonView: UIButton {

    // MARK: Variables
    
    var type: ActivityType = .show
    var isPressed: Bool = false
    
    // MARK: components
    
    let background: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let symbolImage: UIImageView = {
        var config = UIImage.SymbolConfiguration(hierarchicalColor: UIColor(named: "ShowDark") ?? .black)
        config = config.applying(UIImage.SymbolConfiguration(font: .systemFont(ofSize: 20)))
        
        let symbol = UIImage(systemName: "circle", withConfiguration: config)
        
        let image = UIImageView(image: symbol)
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Vazio"
        label.textColor = .black
        label.font = UIFont(name: "RadioCanada-Regular_bold", size: 17)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        //configData()
    }
    
    init(type: ActivityType) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.type = type
        
        self.addTarget(self, action: #selector(ChangeColor), for: .touchUpInside)
        self.isUserInteractionEnabled = true
        
        self.nameLabel.text = getName(activity: type)
        self.background.backgroundColor = UIColor(named: isPressed ? getDarkColor(activity: type) : getLightColor(activity: type))
        
        symbolSetup(type: type)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func symbolSetup(type: ActivityType){
        var config = UIImage.SymbolConfiguration(hierarchicalColor: UIColor(named: isPressed ? getLightColor(activity: type) : getDarkColor(activity: type)) ?? .black)
        config = config.applying(UIImage.SymbolConfiguration(font: .systemFont(ofSize: 25)))
        let symbol = UIImage(systemName: getSymbol(activity: type), withConfiguration: config)
        self.symbolImage.image = symbol
    }
    
    //MARK: Constraints
    
    func setConstraints(){
        self.addSubview(background)
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            background.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            background.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        background.addSubview(symbolImage)
        NSLayoutConstraint.activate([
            symbolImage.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            symbolImage.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 5)
        ])
        
        background.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: symbolImage.trailingAnchor, constant: 6),
            nameLabel.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -5),
        ])
    }
    
    @objc public func ChangeColor(){
        print("mudei")
        isPressed.toggle()
    }
}
