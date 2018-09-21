//
//  Created by WebIQ Stagiaire on 21-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class BarButtonItem: UIBarButtonItem {
    
    var tabActionClosure: (() -> Void)?
    
    override init() {
        super.init()
        target = self
        action = #selector(executeTapAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        target = self
        action = #selector(executeTapAction)
    }
    
    @objc private func executeTapAction() {
        tabActionClosure?()
    }
}
