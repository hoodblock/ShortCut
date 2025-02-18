// The Swift Programming Language
// https://docs.swift.org/swift-book


public struct Shortcut {
    
    var DEBUG: Bool = false
    
    public init(_ DEBUG: Bool) {
        self.DEBUG = DEBUG
    }
    
    public func log(_ msg: String) {
        if DEBUG {
            print("Shortcut\t\(msg)")
        }
    }
}
