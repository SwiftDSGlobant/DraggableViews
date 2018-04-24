//
//  DroppableView.swift
//  DragView
//
//  Created by Aldo Antonio Martinez Avalos on 24/04/18.
//  Copyright © 2018 Aldo Antonio Martinez Avalos. All rights reserved.
//

import Foundation
import UIKit

class DroppableView: UIView, Droppable {
    
    func onDrop(view: UIView, value: DraggableItem<Any>) {
        print(value.value)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
