//
//  cell.swift
//  TicTacToe
//
//  Created by Sunny on 12/09/24.
//

import Foundation
import SwiftUI

struct Cell {
    var tile: Tile

    func displayTile() -> String {
        switch tile {
        case .Nought:
            return "O"
        case .Cross:
            return "X"
        case .Empty:
            return " "
        }
    }

    func tileColor() -> Color {
        switch tile {
        case .Nought:
            return Color.red
        case .Cross:
            return Color.black
        case .Empty:
            return Color.gray
        }
    }
}

enum Tile {
    case Nought
    case Cross
    case Empty
}
