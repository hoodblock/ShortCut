//
//  SwipeToDismissModifier.swift
//  Shortcut
//
//  Created by Thomas on 2025/2/18.
//

import SwiftUI

/// 一个自定义的 `ViewModifier`，用于实现通过滑动手势来关闭当前视图的功能。
public struct SwipeToDismissModifier: ViewModifier {
    @Environment(\.dismiss) var dismiss
    
    /// 定义视图的内容，并添加滑动手势
        /// - Parameter content: 要应用此修饰符的内容
        /// - Returns: 添加了滑动手势的视图
    public func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture()
                    .onChanged { value in
                        // 当水平滑动的距离超过 100 时，触发关闭操作
                        if value.translation.width > 100 {
                            dismiss()
                        }
                    }
            )
    }
}

public extension View {
    
    /// 为视图添加滑动手势以关闭当前视图
       /// - Returns: 应用了滑动手势的视图
    func swipeToDismiss() -> some View {
        self.modifier(SwipeToDismissModifier())
    }
}
