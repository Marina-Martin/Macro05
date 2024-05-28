//
//  Enum.swift
//  Treat
//
//  Created by Marina Martin on 16/05/24.
//

import Foundation

public enum ActivityType{
    case show
    case cafe
    case galery
    case play
    case cinema
    case restaurant
    case park
    case others
    case empty
}

func getType (activity: String) -> ActivityType {
    switch activity{
    case "Show":
        return .show
    case "Café":
        return .cafe
    case "Exposição":
        return .galery
    case "Peça":
        return .play
    case "Cinema":
        return .cinema
    case "Restaurante":
        return .restaurant
    case "Parque":
        return .park
    default:
        return .others
    }
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
    case .empty:
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
    case .empty:
        return "Outros"
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
    case .empty:
        return "Outros"
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
    default:
        return "ellipsis.rectangle"
    }
}

func getSize (activity: ActivityType) -> CGFloat {
    switch activity{
    case .play:
        return 115
    default:
        return 90
    }
}
