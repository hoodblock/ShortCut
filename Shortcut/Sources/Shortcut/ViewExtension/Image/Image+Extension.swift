//
//  Image+Extension.swift
//  B101
//
//  Created by Thomas on 2025/1/11.
//

import SwiftUI

public extension Image {
    
    /// 调整图像大小自适应，同时保持宽高比
      ///
      /// - Returns: 返回自适应大小图片
    func resizeRatioFit() -> some View {
        resizable()
        .aspectRatio(contentMode: .fit)
    }
    
    /// 调整图像大小，最大限度填充，同时不保持宽高比
      ///
      /// - Returns: 返回铺满区域的图片
    func resizeRatioFill() -> some View {
        resizable()
        .aspectRatio(contentMode: .fill)
    }
    
    /// 调整图像大小，同时保持宽高比
      ///
      /// - Parameters:
      ///   - size: 指定图片大小
      ///
      /// - Returns: 返回指定图片大小视图
    func resizeRatioFitSize(_ size: CGSize) -> some View {
        resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: size.width, height: size.height)
    }
    
    /// 调整图像大小，同时不保持宽高比
      ///
      /// - Parameters:
      ///   - size: 指定图片大小
      ///
      /// - Returns: 返回指定图片大小视图
    func resizeRatioFillSize(_ size: CGSize) -> some View {
        resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: size.width, height: size.height)
    }
}
