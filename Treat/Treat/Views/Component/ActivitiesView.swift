//
//  ActivitiesView.swift
//  Treat
//
//  Created by Marina Martin on 21/05/24.
//

import UIKit

class ActivitiesView: UIView {

    //MARK: Variables
    
    let galeryButton = ActivityButtonView(type: .galery)
    let showButton = ActivityButtonView(type: .show)
    let playButton = ActivityButtonView(type: .play)
    let cafeButton = ActivityButtonView(type: .cafe)
    let cinemaButton = ActivityButtonView(type: .cinema)
    let restaurantButton = ActivityButtonView(type: .restaurant)
    let parkButton = ActivityButtonView(type: .park)
    let othersButton = ActivityButtonView(type: .others)
    
    //MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Constraints
    
    func setConstraints(){
        self.addSubview(galeryButton)
        NSLayoutConstraint.activate([
            galeryButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            galeryButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
        ])
        
        self.addSubview(showButton)
        NSLayoutConstraint.activate([
            showButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            showButton.leadingAnchor.constraint(equalTo: galeryButton.nameLabel.trailingAnchor, constant: 10)
        ])
        
        self.addSubview(playButton)
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            playButton.leadingAnchor.constraint(equalTo: showButton.nameLabel.trailingAnchor, constant: 10)
        ])
        
        self.addSubview(cafeButton)
        NSLayoutConstraint.activate([
            cafeButton.topAnchor.constraint(equalTo: galeryButton.bottomAnchor, constant: 20),
            cafeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0)
        ])
        
        self.addSubview(cinemaButton)
        NSLayoutConstraint.activate([
            cinemaButton.topAnchor.constraint(equalTo: galeryButton.bottomAnchor, constant: 20),
            cinemaButton.leadingAnchor.constraint(equalTo: cafeButton.nameLabel.trailingAnchor, constant: 10)
        ])
        
        self.addSubview(restaurantButton)
        NSLayoutConstraint.activate([
            restaurantButton.topAnchor.constraint(equalTo: galeryButton.bottomAnchor, constant: 20),
            restaurantButton.leadingAnchor.constraint(equalTo: cinemaButton.nameLabel.trailingAnchor, constant: 10)
        ])
        
        self.addSubview(parkButton)
        NSLayoutConstraint.activate([
            parkButton.topAnchor.constraint(equalTo: cafeButton.bottomAnchor, constant: 20),
            parkButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0)
        ])
        
        self.addSubview(othersButton)
        NSLayoutConstraint.activate([
            othersButton.topAnchor.constraint(equalTo: cafeButton.bottomAnchor, constant: 20),
            othersButton.leadingAnchor.constraint(equalTo: parkButton.nameLabel.trailingAnchor, constant: 10)
        ])
    }
}

#Preview(){
    ActivitiesView()
}
