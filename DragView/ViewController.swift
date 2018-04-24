//
//  ViewController.swift
//  DragView
//
//  Created by Aldo Antonio Martinez Avalos on 24/04/18.
//  Copyright © 2018 Aldo Antonio Martinez Avalos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var droppableView: DroppableView!
    @IBOutlet weak var imageView: DraggableImageView!
    
    var droppableDelegate: Droppable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.delegate = self
        droppableDelegate = droppableView
    }

}

extension ViewController: Draggable {
    
    func canDrag(view: UIView) {
        
    }
    
    func dragInto(view: UIView) {
        droppableDelegate?.onDrop(view: view, value: droppable(view: view))
    }
    
    func droppable(view: UIView) -> DraggableItem<Any> {
        return DraggableItem(value: 0)
    }
    
    func onDrag(view: UIView, recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        view.center = CGPoint(x:view.center.x + translation.x,
                              y:view.center.y + translation.y)
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        if droppableView.frame.contains(view.center), recognizer.state == .ended {
            dragInto(view: view)
        }
    }
    
}
