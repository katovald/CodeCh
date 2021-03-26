//
//  Image.swift
//  MovieClient
//
//  Created by  Jose Valdez. 
//

import UIKit

enum Image: String {
    case AppIconWhite
    case AppTitleIcon
    case CalendarWhite
    case CountryWhite
    case CurrencyWhite
    case DownloadingWhite
    case ErrorWhite
    case GenreWhite
    case NoInternetWhite
    case OriginalWhite
    case ProducedByWhite
    case StarWhite
}

extension Image {
    
    func image() -> UIImage {
        return UIImage(named: self.rawValue) ?? UIImage()
    }
}
