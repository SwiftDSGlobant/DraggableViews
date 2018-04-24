//
//  DraggableImageView.swift
//  DragView
//
//  Created by Aldo Antonio Martinez Avalos on 24/04/18.
//  Copyright © 2018 Aldo Antonio Martinez Avalos. All rights reserved.
//

import Foundation
import UIKit

class DraggableImageView: UIImageView {
    
    var delegate: Draggable?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureGestures()
    }
    
    func configureGestures() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 1
        addGestureRecognizer(panGesture)
    }
    
    @objc func handlePan(recognizer: UIPanGestureRecognizer) {
        delegate?.onDrag(view: self, recognizer: recognizer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureGestures()
    }
    
}
