//
//  MovieDetailReleaseCell.swift
//  MovieClient
//
//  Created by  Jose Valdez. 
//

import UIKit

class MovieDetailReleaseCell: UITableViewCell {
    
    // This property must be bound to the whole view in Interface Builder
    @IBOutlet private weak var allContentView: UIView!
    
    // MARK: Outlets
    @IBOutlet private weak var releaseDateLabel: UILabel!
    
    // From Code
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    // From IB
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
}

// MARK: Init
extension MovieDetailReleaseCell {
    
    private func commonInit() {
        
        // Name of the .xib file
        let nibName = className(some: self)
        
        // Load and add this custom view
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(allContentView)
        
        // Expand to fill its parent
        allContentView.frame = self.bounds
        allContentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        // This prevent the cell to change its color when selected
        selectionStyle = .none
    }
}

// MARK: Setup
extension MovieDetailReleaseCell {
    
    func setup(releaseDate: String) {
        releaseDateLabel.text = releaseDate
    }
}
