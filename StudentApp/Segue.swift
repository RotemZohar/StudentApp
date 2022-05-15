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
        } else if (source.parent is MainViewController){
            view = source.parent as! MainViewController
        } else {
            return;
        }
        
        view.addChild(self.destination)
        dest.view.frame = view.containerView.frame
        dest.view.frame.origin.x = 0
        dest.view.frame.origin.y = 0
        view.containerView.addSubview(dest.view)
        
    }

}
