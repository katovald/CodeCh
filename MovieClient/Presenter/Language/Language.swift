//
//  Language.swift
//  MovieClient
//
//  Created by  Jose Valdez. 
//

import Foundation

class Language {
    
    /**
     This function will return the localized text specified by its key
     */
    static func get(_ key: LanguageKey, from bundle: Bundle = .main) -> String {
        return NSLocalizedString(key.rawValue, tableName: nil, bundle: bundle, value: "", comment: "")
    }
    
    /**
     This function will replace any ocurrence of $0$, $1$, $2$, $3$ ... $X$
     on the localized text, for the specified values
     */
    static func get(_ key: LanguageKey, replacing values: [String], from bundle: Bundle = .main) -> String {
        
        var text = NSLocalizedString(key.rawValue, tableName: nil, bundle: bundle, value: "", comment: "")
        
        guard values.count > 0 else {
            return text
        }
        
        for index in 0..<values.count {
            text = text.replacingOccurrences(of: "$\(index)$", with: values[index])
        }
        return text
    }
    
    /**
     This function will replace any ocurrence of $0$, $1$, $2$, $3$ ... $X$
     on the main localized text, for the localized strings specified by its keys
     */
    static func get(_ key: LanguageKey, replacing keys: [LanguageKey], from bundle: Bundle = .main) -> String {
        
        let values = keys.map { parameterKey -> String in
            return get(parameterKey)
        }
        
        return Language.get(key, replacing: values, from: bundle)
    }
}
