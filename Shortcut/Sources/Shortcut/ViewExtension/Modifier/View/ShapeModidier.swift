//
//  ShapeModidier.swift
//  B101
//
//  Created by Thomas on 2025/1/11.
//

import SwiftUI

/// 一个自定义的 `ViewModifier`，用于扩展视图的可点击区域。
/// 默认情况下，SwiftUI 中某些视图的可点击区域可能仅限于内容本身。
/// 使用此修饰符可以将可点击区域扩展到整个矩形区域。
public struct ClickableShapeModifier: ViewModifier {
    
    /// 定义视图的内容，并将其可点击区域扩展到整个矩形区域
      /// - Parameter content: 要应用此修饰符的内容
      /// - Returns: 扩展了可点击区域的视图
    public func body(content: Content) -> some View {
        content
            .contentShape(Rectangle())
    }
}

public extension View {
    /// 为视图扩展可点击区域到整个矩形区域
     /// - Returns: 应用了可点击区域扩展的视图
    func clickableShape() -> some View {
        self.modifier(ClickableShapeModifier())
    }
}




/// 一个自定义的 `Shape`，用于创建带有指定圆角半径和圆角位置的圆角矩形。
public struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    /// 定义形状的路径
      /// - Parameter rect: 形状的绘制区域
      /// - Returns: 带有指定圆角的路径
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

/// 一个自定义的 `ViewModifier`，用于将视图裁剪为带有指定圆角的形状。
public struct RoundedCornerModifier: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    /// 定义视图的内容，并将其裁剪为带有指定圆角的形状
       /// - Parameter content: 要应用此修饰符的内容
       /// - Returns: 裁剪后的视图
    public func body(content: Content) -> some View {
        content
            .clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

public extension View {
    /// 为视图添加指定圆角的裁剪效果
     /// - Parameters:
     ///   - radius: 圆角半径
     ///   - corners: 需要圆角化的角落
     /// - Returns: 应用了圆角裁剪的视图
    func roundedCorners(radius: CGFloat, corners: UIRectCorner) -> some View {
        self.modifier(RoundedCornerModifier(radius: radius, corners: corners))
    }
}
