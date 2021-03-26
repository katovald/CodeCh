//
//  Color.swift
//  MovieClient
//
//  Created by  Jose Valdez. 
//

import UIKit

enum Color: String {
    case mainBlack
    case mainBlue
}

extension Color {
    
    func color() -> UIColor {
        return UIColor(named: self.rawValue) ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}
