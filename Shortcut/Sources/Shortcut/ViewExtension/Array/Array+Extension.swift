//
//  Array+Extension.swift
//  B101
//
//  Created by Thomas on 2025/1/11.
//

import Foundation

public extension Array {
    
    /// 添加一个元素
    func appending(_ newElement: Element, condition: Bool = true) -> [Element] {
        condition ? self + [newElement] : self
    }
    
    /// 添加一个元素数组
    func appending(_ newElements: [Element], condition: Bool = true) -> [Element] {
        condition ? self + newElements : self
    }
    
}


public extension Array {
    
    /// 安全下标访问，越界时返回nil
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    /// 安全下标访问，越界时返回默认值
    subscript(safe index: Index, default defaultValue: Element) -> Element {
        return indices.contains(index) ? self[index] : defaultValue
    }
}
