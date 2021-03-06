//
//  LogLevel.swift
//  MovieClient
//
//  Created by Jose Valdez. 
//

enum LogLevel: Int {
    
    case fatal
    case error
    case warning
    case important
    case info
    case debug
    
    func icon() -> String {
        
        switch self {
            
        case .fatal:
            return "đ"
        case .error:
            return "â"
        case .warning:
            return "â ī¸"
        case .important:
            return "đ"
        case .info:
            return "âšī¸"
        case .debug:
            return "đ"
        }
    }
}
