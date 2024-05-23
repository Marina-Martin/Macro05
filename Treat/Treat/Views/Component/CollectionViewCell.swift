//
//  ActivityCollectionViewCell.swift
//  Treat
//
//  Created by Marina Martin on 15/05/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    // MARK: Variables
    
    static let identifier = "ActivityCell"
    
    // MARK: Components
    
    let background: UIView = {
        let back = UIView()
        
        back.backgroundColor = UIColor(named: "ShowLight")
        back.layer.cornerRadius = 20
        
        back.translatesAutoresizingMaskIntoConstraints = false
        
        return back
    }()
    
    let activityLabel: UILabel = {
        let name = UILabel()
        
        name.text = "Nome da atividade"
        name.textColor = .black
        name.font = UIFont(name: "RadioCanada-Regular_bold", size: 20)
        
        name.translatesAutoresizingMaskIntoConstraints = false
        
        return name
    }()
    
    let descriptionLabel: UILabel = {
        let description = UILabel()
        
        description.text = "Uma breve descrição sobre como vou jogar bastante bola lol"
        description.numberOfLines = 2
        description.textColor = .secondaryLabel
        description.textColor = UIColor(named: "AppDarkGray")
        description.font = UIFont(name: "RadioCanada-Regular_Medium", size: 14)
        
        description.translatesAutoresizingMaskIntoConstraints = false
        
        return description
    }()
    
    let dateLabel: UILabel = {
        let date = UILabel()
        
        date.text = "22/02/2023"
        date.numberOfLines = 2
        date.textColor = UIColor(named: "AppDarkGray")
        date.font = UIFont(name: "RadioCanada-Regular_Bold", size: 16)
        
        date.translatesAutoresizingMaskIntoConstraints = false
        
        return date
    }()
    
    let symbolImage: UIImageView = {
        var config = UIImage.SymbolConfiguration(hierarchicalColor: UIColor(named: "ShowDark") ?? .purple)
        config = config.applying(UIImage.SymbolConfiguration(font: .systemFont(ofSize: 65)))
        
        let symbol = UIImage(systemName: "camera.macro", withConfiguration: config)
        
        let image = UIImageView(image: symbol)
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    func configData(title: String, description: String, date: String, type: ActivityType) {
        self.activityLabel.text = title
        self.descriptionLabel.text = description
        self.dateLabel.text = date
        self.background.backgroundColor = UIColor(named: getLightColor(activity: type))
        
        symbolSetup(type: type)
                
        setConstraints()
    }
    
    func symbolSetup(type: ActivityType){
        var config = UIImage.SymbolConfiguration(hierarchicalColor: UIColor(named: getDarkColor(activity: type)) ?? .black)
        config = config.applying(UIImage.SymbolConfiguration(font: .systemFont(ofSize: 65)))
        let symbol = UIImage(systemName: getSymbol(activity: type), withConfiguration: config)
        self.symbolImage.image = symbol
    }
    
    // MARK: - Setup
    
    func setConstraints(){
        self.addSubview(background)
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            background.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            background.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            background.bottomAnchor.constraint(equalTo: background.topAnchor, constant: 121)
        ])

        background.addSubview(symbolImage)
        NSLayoutConstraint.activate([
            symbolImage.topAnchor.constraint(equalTo: background.topAnchor, constant: 23),
            symbolImage.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 7),
            symbolImage.trailingAnchor.constraint(equalTo: symbolImage.leadingAnchor, constant: 90)
        ])
    
        background.addSubview(activityLabel)
        NSLayoutConstraint.activate([
            activityLabel.topAnchor.constraint(equalTo: background.topAnchor, constant: 15),
            activityLabel.leadingAnchor.constraint(equalTo: symbolImage.trailingAnchor, constant: 3),
            activityLabel.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -15)
        ])
    
        background.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: activityLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: symbolImage.trailingAnchor, constant: 3),
            descriptionLabel.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -15)
        ])
    
        background.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 14),
            dateLabel.leadingAnchor.constraint(equalTo: symbolImage.trailingAnchor, constant: 3),
            dateLabel.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -15)
        ])
    }
    
    //MARK: OVerride
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.background.backgroundColor = nil
        self.activityLabel.text = nil
        self.descriptionLabel.text = nil
        self.dateLabel.text = nil
        
        //o SF não tá como nil
    }
}
