//
//  Enum.swift
//  Treat
//
//  Created by Marina Martin on 16/05/24.
//

import Foundation

enum ActivityType{
    case show
    case cafe
    case galery
    case play
    case cinema
    case restaurant
    case park
    case others
}

func getName (activity: ActivityType) -> String {
    switch activity{
    case .show:
        return "Show"
    case .cafe:
        return "Café"
    case .galery:
        return "Exposição"
    case .play:
        return "Peça"
    case .cinema:
        return "Cinema"
    case .restaurant:
        return "Restaurante"
    case .park:
        return "Parque"
    case .others:
        return "Outros"
    }
}

func getDarkColor (activity: ActivityType) -> String {
    switch activity{
    case .show:
        return "ShowDark"
    case .cafe:
        return "CafeDark"
    case .galery:
        return "GaleryDark"
    case .play:
        return "PlayDark"
    case .cinema:
        return "CinemaDark"
    case .restaurant:
        return "RestaurantDark"
    case .park:
        return "ParkDark"
    case .others:
        return "OthersDark"
    }
}

func getLightColor (activity: ActivityType) -> String {
    switch activity{
    case .show:
        return "ShowLight"
    case .cafe:
        return "CafeLight"
    case .galery:
        return "GaleryLight"
    case .play:
        return "PlayLight"
    case .cinema:
        return "CinemaLight"
    case .restaurant:
        return "RestaurantLight"
    case .park:
        return "ParkLight"
    case .others:
        return "OthersLight"
    }
}

func getSymbol (activity: ActivityType) -> String {
    switch activity{
    case .show:
        return "music.mic"
    case .cafe:
        return "cup.and.saucer"
    case .galery:
        return "paintbrush"
    case .play:
        return "theatermasks"
    case .cinema:
        return "movieclapper"
    case .restaurant:
        return "fork.knife"
    case .park:
        return "camera.macro"
    case .others:
        return "ellipsis.rectangle"
    }
}
