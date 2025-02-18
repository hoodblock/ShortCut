//
//  View+Extension.swift
//  B101
//
//  Created by Thomas on 2025/1/11.
//

import Foundation
import SwiftUI
import System

public extension View {
    
    func viewWidth(_ size: CGSize, _ width: CGFloat) -> CGFloat {
        return width
    }
    
    /// 为视图添加圆角背景填充效果
    ///
    /// - Parameters:
    ///   - radius: 圆角半径
    ///   - fill: 背景填充样式（例如颜色、渐变等）
    ///
    /// - Returns: 带有圆角背景填充的视图
    func rounded(_ radiud: CGFloat, fill: some ShapeStyle) -> some View {
        background(RoundedRectangle(cornerRadius: radiud).fill(fill))
    }
    
    /// 为视图添加背景渐变
    ///
    /// - Parameters:
    ///   - colors: 颜色数组，可相同，可不同
    ///   - unitpoint: 渐变方向
    ///
    /// - Returns: 返回渐变视图
    func gradientBackColor(_ colors: [Color], _ unitpoint: UnitPoint = .topLeading) -> some View {
        if unitpoint == .topLeading {
            return background(LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
        } else if unitpoint == .leading {
            return background(LinearGradient(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing))
        } else if unitpoint == .top {
            return background(LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom))
        }
        return background(LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
    /// 为视图添加前景渐变
    ///
    /// - Parameters:
    ///   - colors: 颜色数组，可相同，可不同
    ///   - unitpoint: 渐变方向
    ///
    /// - Returns: 返回渐变视图
    func gradientForeColor(_ colors: [Color], _ unitpoint: UnitPoint = .topLeading) -> some View {
        if unitpoint == .topLeading {
            return foregroundStyle(.linearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
        } else if unitpoint == .leading {
            return foregroundStyle(.linearGradient(colors: colors, startPoint: .leading, endPoint: .trailing))
        } else if unitpoint == .top {
            return foregroundStyle(.linearGradient(colors: colors, startPoint: .top, endPoint: .bottom))
        }
        return foregroundStyle(.linearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
    /// 填充视图空白区域
    ///
    /// - Parameters:
    ///   - alignment: 方位，让视图靠向某一边，其余用空白填充
    ///
    /// - Returns: 返回视图
    func push(_ alignment: Alignment) -> some View {
        switch alignment {
        case .leading:
            return frame(maxWidth: .infinity, alignment: .leading)
        case .center:
            return frame(maxWidth: .infinity, alignment: .center)
        case .trailing:
            return frame(maxWidth: .infinity, alignment: .trailing)
        case .top:
            return frame(maxHeight: .infinity, alignment: .top)
        case .bottom:
            return frame(maxHeight: .infinity, alignment: .bottom)
        default:
            return frame(maxWidth: .infinity, alignment: alignment)
        }
    }
}

public extension View {
    
    func hoverable(_ isHovere: Binding<Bool>) -> some View {
        self.onHover(perform: { isHovered in
            withAnimation {
                isHovere.wrappedValue = isHovered
            }
        })
    }
    
}


public extension View {
    
    /// 空白Vew，安全距离
    func safeTopMargin(backgroundColor: Color) -> some View {
        Spacer()
            .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
            .background(backgroundColor)
    }
}
