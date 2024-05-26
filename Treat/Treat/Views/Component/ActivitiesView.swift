//
//  ActivitiesView.swift
//  Treat
//
//  Created by Marina Martin on 21/05/24.
//

import UIKit

extension AddSheetView{
    
    //MARK: Constraints
    func setActivityStack(){
        view.addSubview(galeryButton)
        NSLayoutConstraint.activate([
            galeryButton.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 12),
            galeryButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22),
        ])

        view.addSubview(showButton)
        NSLayoutConstraint.activate([
            showButton.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 12),
            showButton.leadingAnchor.constraint(equalTo: galeryButton.nameLabel.trailingAnchor, constant: 10)
        ])

        view.addSubview(playButton)
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 12),
            playButton.leadingAnchor.constraint(equalTo: showButton.nameLabel.trailingAnchor, constant: 10)
        ])

        view.addSubview(cafeButton)
        NSLayoutConstraint.activate([
            cafeButton.topAnchor.constraint(equalTo: galeryButton.bottomAnchor, constant: 10),
            cafeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22)
        ])

        view.addSubview(cinemaButton)
        NSLayoutConstraint.activate([
            cinemaButton.topAnchor.constraint(equalTo: galeryButton.bottomAnchor, constant: 10),
            cinemaButton.leadingAnchor.constraint(equalTo: cafeButton.nameLabel.trailingAnchor, constant: 10)
        ])

        view.addSubview(restaurantButton)
        NSLayoutConstraint.activate([
            restaurantButton.topAnchor.constraint(equalTo: galeryButton.bottomAnchor, constant: 10),
            restaurantButton.leadingAnchor.constraint(equalTo: cinemaButton.nameLabel.trailingAnchor, constant: 10)
        ])

        view.addSubview(parkButton)
        NSLayoutConstraint.activate([
            parkButton.topAnchor.constraint(equalTo: cafeButton.bottomAnchor, constant: 10),
            parkButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22)
        ])

        view.addSubview(othersButton)
        NSLayoutConstraint.activate([
            othersButton.topAnchor.constraint(equalTo: cafeButton.bottomAnchor, constant: 10),
            othersButton.leadingAnchor.constraint(equalTo: parkButton.nameLabel.trailingAnchor, constant: 10)
        ])
    }
}
