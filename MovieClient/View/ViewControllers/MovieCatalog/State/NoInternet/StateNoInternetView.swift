//
//  StateNoInternetView.swift
//  MovieClient
//
//  Created by  Jose Valdez. 
//

import UIKit

class StateNoInternetView: UIView {

    // This property must be bound to the whole view in Interface Builder
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet public weak var tryAgainButton: UIButton!
    
    // From Code
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    // From IB
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
}

// MARK: Init
extension StateNoInternetView {
    
    private func commonInit() {
        
        // Name of the .xib file
        let nibName = className(some: self)
        
        // Load and add this custom view
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        
        // Expand to fill its parent
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
