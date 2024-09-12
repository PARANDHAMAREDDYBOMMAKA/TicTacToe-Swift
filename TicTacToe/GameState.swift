//
//  GameState.swift
//  TicTacToe
//
//  Created by Sunny on 12/09/24.
//

import Foundation

class GameState: ObservableObject {
    @Published var board = [[Cell]]()
    @Published var turn = Tile.Cross
    @Published var noughtScore = 0
    @Published var crossScore = 0
    @Published var showAlert = false
    @Published var alertMessage = "Draw"

    init() {
        resetBoard()
    }

    func placeTile(_ row: Int, _ column: Int) {
        if board[row][column].tile != Tile.Empty {
            return
        }
        board[row][column].tile = turn
        
        if checkForVictory() {
            let winner = turn == Tile.Cross ? "X" : "O"
            alertMessage = winner + " Win!"
            showAlert = true
            
            if turn == Tile.Cross {
                crossScore += 1
            } else {
                noughtScore += 1
            }
        } else if checkForDraw() {
            alertMessage = "Draw"
            showAlert = true
        } else {
            turn = turn == Tile.Cross ? Tile.Nought : Tile.Cross
        }
    }

    func checkForVictory() -> Bool {
        for i in 0..<3 {
            if board[i][0].tile == turn && board[i][1].tile == turn && board[i][2].tile == turn {
                return true
            }
            if board[0][i].tile == turn && board[1][i].tile == turn && board[2][i].tile == turn {
                return true
            }
        }
        if board[0][0].tile == turn && board[1][1].tile == turn && board[2][2].tile == turn {
            return true
        }
        if board[0][2].tile == turn && board[1][1].tile == turn && board[2][0].tile == turn {
            return true
        }
        return false
    }

    func checkForDraw() -> Bool {
        for row in board {
            for cell in row {
                if cell.tile == Tile.Empty {
                    return false
                }
            }
        }
        return true
    }

    func resetBoard() {
        var newBoard = [[Cell]]()
        
        for _ in 0...2 {
            var row = [Cell]()
            for _ in 0...2 {
                row.append(Cell(tile: Tile.Empty))
            }
            newBoard.append(row)
        }
        board = newBoard
        turn = Tile.Cross
    }
}
