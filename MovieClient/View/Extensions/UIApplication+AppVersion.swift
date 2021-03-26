//
//  UIApplication+AppVersion.swift
//  MovieClient
//
//  Created by  Jose Valdez. 
//

import UIKit

extension UIApplication {
    
    class func appVersion() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    class func appBuild() -> String {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
    }
    
    class func versionBuild() -> String {
        let version = appVersion()
        let build = appBuild()
        return version == build ? "v\(version)" : "v\(version) (\(build))"
    }
}
