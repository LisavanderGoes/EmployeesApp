//
//  Created by Peter Combee on 14/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class BarButtonItem: UIBarButtonItem {
    
    var tapAction: (() -> Void)?
    
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
        tapAction?()
    }
}
