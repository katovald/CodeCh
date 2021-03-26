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
            return "🆘"
        case .error:
            return "❌"
        case .warning:
            return "⚠️"
        case .important:
            return "💎"
        case .info:
            return "ℹ️"
        case .debug:
            return "🌀"
        }
    }
}
