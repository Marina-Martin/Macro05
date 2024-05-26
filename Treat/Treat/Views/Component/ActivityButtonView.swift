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
    var action: (() -> Void)?
    
    // MARK: components
    
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
    }
    
    init(type: ActivityType) {
        super.init(frame: .zero)
        
        self.type = type
        self.nameLabel.text = getName(activity: type)
        
        setButton()
        
        symbolSetup(type: type)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setButton(){
        self.backgroundColor = UIColor(named: isPressed ? getDarkColor(activity: type) : getLightColor(activity: type))
        self.layer.cornerRadius = 15
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = true
        
        self.addTarget(self, action: #selector(onTap), for: .touchUpInside)
    }
    
    @objc
    func onTap() {
        changeColor()
        action?()
    }
    
    func symbolSetup(type: ActivityType){
        var config = UIImage.SymbolConfiguration(hierarchicalColor: UIColor(named: isPressed ? getLightColor(activity: type) : getDarkColor(activity: type)) ?? .black)
        config = config.applying(UIImage.SymbolConfiguration(font: .systemFont(ofSize: 25)))
        let symbol = UIImage(systemName: getSymbol(activity: type), withConfiguration: config)
        self.symbolImage.image = symbol
    }
    
    //MARK: Constraints
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        self.addSubview(symbolImage)
        NSLayoutConstraint.activate([
            symbolImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            symbolImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5)
        ])
        
        self.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: symbolImage.trailingAnchor, constant: 6),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
        ])
    }
    
    @objc private func changeColor(){
        print("mudei")
        isPressed.toggle()
        self.backgroundColor = UIColor(named: isPressed ? getDarkColor(activity: type) : getLightColor(activity: type))
        symbolSetup(type: self.type)
    }
    
    public func checkColor(currentType: ActivityType){
        self.backgroundColor = UIColor(named: currentType == self.type ? getDarkColor(activity: type) : getLightColor(activity: type))
        
        var config = UIImage.SymbolConfiguration(hierarchicalColor: UIColor(named: currentType == self.type ? getLightColor(activity: type) : getDarkColor(activity: type)) ?? .black)
        config = config.applying(UIImage.SymbolConfiguration(font: .systemFont(ofSize: 25)))
        let symbol = UIImage(systemName: getSymbol(activity: type), withConfiguration: config)
        self.symbolImage.image = symbol
    }
}
