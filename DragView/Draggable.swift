//
//  Draggable.swift
//  DragView
//
//  Created by Aldo Antonio Martinez Avalos on 24/04/18.
//  Copyright © 2018 Aldo Antonio Martinez Avalos. All rights reserved.
//

import UIKit

class DraggableItem<T> {
    var value: T
    init(value: T) {
        self.value = value
    }
}

protocol Draggable: class {
    func canDrag(view: UIView) -> Bool
    func item(for view: UIView) -> DraggableItem<Any>
    func onDrag(view: UIView, recognizer: UIPanGestureRecognizer)
}

protocol Droppable {
    func onDrop(view: UIView, value: DraggableItem<Any>)
}
