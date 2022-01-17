//
//  BoardView.swift
//  SetTheGame
//
//  Created by Macbook on 05.01.2022.
//

import UIKit

// THAT IS FIRST WHAT WE DO

class BoardView: UIView {
    
    // массив карт
    var cardViews = [SetCardView]() {
        willSet { removeSubviews() } // перед изменением массива cardView удаляем все с экрана
        didSet { addSubviews(); setNeedsLayout() } // после изменения массива cardView  - заново добавляем карточки на экран + обновляем констрейнты
    }
    
    private func removeSubviews() {         // перебираем все карты в массиве и каждую удаляем с экрана
        for card in cardViews {
            card.removeFromSuperview()
        }
    }
    
    private func addSubviews() {    // перебираем все карты в массиве и добавляем на экран
        for card in cardViews {
            addSubview(card)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var grid = Grid(
            layout: Grid.Layout.aspectRatio(Constant.cellAspectRatio),
            frame: bounds)
        grid.cellCount = cardViews.count
        for row in 0..<grid.dimensions.rowCount {
            for column in 0..<grid.dimensions.columnCount {                       // this block ???
                if cardViews.count > (row * grid.dimensions.columnCount + column) {
                    cardViews[row * grid.dimensions.columnCount + column].frame = grid[row,column]!.insetBy(
                                    dx: Constant.spacingDx, dy: Constant.spacingDy)
                    // this block ???
                }
            }
        }
    }
    
    struct Constant {
        static let cellAspectRatio: CGFloat = 0.7
        static let spacingDx: CGFloat  = 3.0
        static let spacingDy: CGFloat  = 3.0
    }
    
}

