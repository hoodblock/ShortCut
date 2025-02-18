//
//  Bundle+Extension.swift
//  B101
//
//  Created by Thomas on 2025/1/11.
//

import Foundation


public extension Bundle {
    
    /// 构建号
    var bundleNumber: String {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "100000000"
    }
    
    /// 名称
    var appName: String {
        return infoDictionary?["CFBundleName"] as? String ?? "App"
    }
    
    /// 版本号
    var versionNumber: String {
        return infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0"
    }
    
    /// 标识 bundle ID
    var appIdentifier: String {
        return infoDictionary?["CFBundleIdentifier"] as? String ?? "CFBundleIdentifier"
    }
}
