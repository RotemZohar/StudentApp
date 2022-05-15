//
//  Segue.swift
//  StudentApp
//
//  Created by admin on 13/05/2022.
//

import UIKit

class Segue: UIStoryboardSegue {
    
    override func perform() {
        var view: MainViewController
        let source = self.source
        let dest = self.destination

        
        if (source is MainViewController) {
            view = source as! MainViewController
        } else {
            view = source.parent as! MainViewController
        }
        
        if (view.children.count > 0 && view.containerView.subviews.count > 0) {
            view.children[0].removeFromParent()
            view.containerView.subviews[0].removeFromSuperview()
        }
        
        view.addChild(self.destination)
        dest.view.frame = view.containerView.frame
        dest.view.frame.origin.x = 0
        dest.view.frame.origin.y = 0
        view.containerView.addSubview(dest.view)
        
    }

}
