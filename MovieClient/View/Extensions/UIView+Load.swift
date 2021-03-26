//
//  UIView+Load.swift
//  MovieClient
//
//  Created by  Jose Valdez. 
//

import UIKit

extension UIView {
    
    static func getNib() -> UINib {
        let nibName = className(some: self)
        return UINib(nibName: nibName, bundle: nil)
    }
}

public func className(some: Any) -> String {
    return (some is Any.Type) ? "\(some)" : "\(type(of: some))"
}

