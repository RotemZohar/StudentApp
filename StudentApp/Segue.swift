//
//  Segue.swift
//  StudentApp
//
//  Created by admin on 13/05/2022.
//

import UIKit

class Segue: UIStoryboardSegue {
    
    override func perform() {
        let source = self.source as! MainViewController
        let dest = self.destination

        
        source.addChild(self.destination)
        dest.view.frame = source.containerView.frame
        dest.view.frame.origin.x = 0
        dest.view.frame.origin.y = 0
        source.containerView.addSubview(dest.view)
    }

}
