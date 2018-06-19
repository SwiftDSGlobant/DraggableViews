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
        
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.delegate = self
    }

}

extension ViewController: Draggable {
    
    func canDrag(view: UIView) -> Bool {
        return true
    }
    
    func item(for view: UIView) -> DraggableItem<Any> {
        return DraggableItem(value: 0)
    }
    
    func onDrag(view: UIView, recognizer: UIPanGestureRecognizer) {
        guard canDrag(view: view) else { return }
        let translation = recognizer.translation(in: self.view)
        view.center = CGPoint(x:view.center.x + translation.x,
                              y:view.center.y + translation.y)
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        
        for subView in self.view.subviews {
            guard let droppableView = subView as? DroppableView else { continue }
            if droppableView.frame.contains(view.center), recognizer.state == .ended {
                droppableView.onDrop(view: view, value: item(for: view))
            }
        }
    }
    
}
