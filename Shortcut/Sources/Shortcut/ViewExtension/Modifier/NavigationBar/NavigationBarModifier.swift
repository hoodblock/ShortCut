//
//  NavigationBarModifier.swift
//  B101
//
//  Created by Thomas on 2025/1/11.
//

import SwiftUI


/// 一个自定义的 `ViewModifier`，用于扩展`自定义标题`导航栏。
public struct NavigationBarModifier: ViewModifier {

    func viewWidth(_ size: CGSize, _ width: CGFloat) -> CGFloat {
        return width
    }
    /// 标题
    var title: String
    /// 标题颜色
    var titleColor: Color = Color.color(hexString: "#FF1A1A1A")
    /// 返回按钮
    var backImageName: String = "point_left_black_icon"
    /// 导航栏背景颜色
    var navBackgroundColor: Color
    /// 点击的返回回调
    var backAction: (() -> Void)?
    /// 最右侧图片名称
    var rightImageName: String?
    /// 最右侧按钮响应
    var rightAction: (() -> Void)?
    /// 次右侧图片名称
    var subRightImageName: String?
    /// 次右侧按钮响应
    var subRightAction: (() -> Void)?

    public func body(content: Content) -> some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack {
                    // 标题
                    Text(title)
                        .font(Font.system(size: 15))
                        .foregroundColor(titleColor)
                        .push(.center)
                    
                    // 返回按钮
                    if let backAction = backAction {
                        Button(action: backAction) {
                            HStack {
                                Image(backImageName, bundle: .module)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: viewWidth(geometry.size, 20), height: viewWidth(geometry.size, 20))
                                    .padding(viewWidth(geometry.size, 10))
                            }
                        }
                        .push(.leading)
                    }
                    
                    // 右侧第一个按钮（如果有）
                    if let rightImageName = rightImageName {
                        Button(action: {
                            rightAction?()  // 如果有 action，则执行
                        }) {
                            Image(rightImageName, bundle: .module)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: viewWidth(geometry.size, 20), height: viewWidth(geometry.size, 20))
                                .padding(viewWidth(geometry.size, 10))
                        }
                        .push(.trailing)
                    }
                    
                    // 右侧第二个按钮（如果有）
                    if let subRightImageName = subRightImageName {
                        Button(action: {
                            subRightAction?()  // 如果有 action，则执行
                        }) {
                            Image(subRightImageName, bundle: .module)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: viewWidth(geometry.size, 20), height: viewWidth(geometry.size, 20))
                                .padding(viewWidth(geometry.size, 10))
                        }
                        .push(.trailing)
                        .padding(.trailing, 35) // 给第二个按钮留点空间避免重叠
                    }
                }
                .padding([.leading, .trailing, .bottom], viewWidth(geometry.size, 10))
                .background(navBackgroundColor)
                content
            }
        }
    }
}

public extension View {
    
    /// 自定义标题导航栏修饰符，用于为视图添加自定义的标题导航栏
      ///
      /// - Parameters:
      ///   - title: 导航栏标题
      ///   - titleColor: 标题颜色，默认为十六进制颜色 `#FF1A1A1A`
      ///   - backImageName: 返回按钮图标名称，默认为 `"point_left_black_icon"`
      ///   - navBackgroundColor: 导航栏背景颜色，默认为十六进制颜色 `#FFF0F2F5`
      ///   - backgroundColor: 页面背景颜色，默认为十六进制颜色 `#FFF0F2F5`
      ///   - backAction: 返回按钮点击事件，默认为 `nil`
      ///   - rightImageName: 右侧按钮图标名称，默认为 `nil`
      ///   - rightAction: 右侧按钮点击事件，默认为 `nil`
      ///   - subRightImageName: 右侧第二个按钮图标名称，默认为 `nil`
      ///   - subRightAction: 右侧第二个按钮点击事件，默认为 `nil`
      ///
      /// - Returns: 添加了自定义导航栏的视图
    func customNavigationBar(title: String, titleColor: Color = Color.color(hexString: "FF1A1A1A"), backImageName: String = "point_left_black_icon", navBackgroundColor: Color = Color.color(hexString: "#FFF0F2F5"), backgroundColor: Color = Color.color(hexString: "#FFF0F2F5"), backAction: (() -> Void)? = nil, rightImageName: String? = nil, rightAction: (() -> Void)? = nil, subRightImageName: String? = nil, subRightAction: (() -> Void)? = nil) -> some View {
        self.modifier(NavigationBarModifier(title: title, titleColor: titleColor, backImageName: backImageName, navBackgroundColor: navBackgroundColor, backAction: backAction, rightImageName: rightImageName, rightAction: rightAction, subRightImageName: subRightImageName, subRightAction: subRightAction
        ))
        .background(backgroundColor)
        .navigationBarBackButtonHidden(true)
    }
}



/// 一个自定义的 `ViewModifier`，用于扩展`自定义搜索`导航栏。
public struct SearchNavigationBarModifier: ViewModifier {
    
    func viewWidth(_ size: CGSize, _ width: CGFloat) -> CGFloat {
        return width
    }
    /// 默认展示的搜索提示
    var defaultSearch: String = "Search or type URL"
    /// 导航返回图片名称
    var backImageName: String = "search_to_left_icon"
    /// 导航栏背景颜色
    var navBackgroundColor: Color
    /// 导航返回响应
    var backAction: (() -> Void)?
    /// 搜索响应
    var searchAction: ((String) -> Void)?
    /// 扫描响应
    var scanAction: (() -> Void)?

    @State private var searchString: String = String()
    
    public func body(content: Content) -> some View {
        GeometryReader { geometry in
            VStack (spacing: 0) {
                HStack () {
                    // 返回按钮
                    if let backAction = backAction {
                        Button(action: backAction) {
                            HStack {
                                Image(backImageName, bundle: .module)
                                    .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 20), height: viewWidth(geometry.size, 20)))
                                    .padding(viewWidth(geometry.size, 10))
                            }
                        }
                    }
                    // search
                    RoundedRectangle(cornerRadius: viewWidth(geometry.size, 20))
                        .frame(height: viewWidth(geometry.size, 40))
                        .foregroundColor(Color.color(hexString: "FFFFFFFF"))
                        .overlay {
                            HStack (spacing: 3) {
                                Image("search_gray_icon", bundle: .module)
                                    .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 16), height: viewWidth(geometry.size, 16)))
                                TextField(defaultSearch, text: $searchString)
                                    .keyboardType(.webSearch)
                                    .foregroundColor(searchString.count > 0 ? Color.color(hexString: "#FF1A1A1A") : Color.color(hexString: "#FF8A8A8E"))
                                    .submitLabel(.go)
                                    .onSubmit {
                                        if let searchAction = searchAction {
                                            searchAction(searchString)
                                        }
                                    }
                                // 点击到相机
                                if let scanAction = scanAction {
                                    // 竖线
                                    Text("|")
                                        .font(Font.system(size: 15))
                                        .foregroundColor(Color.color(hexString: "#FFB1B1B4"))
                                    Button(action: scanAction) {
                                        HStack {
                                            Image("search_scan_icon", bundle: .module)
                                                .resizeRatioFitSize(CGSize(width: viewWidth(geometry.size, 20), height: viewWidth(geometry.size, 20)))
                                                .padding(viewWidth(geometry.size, 10))
                                        }
                                    }
                                    .restyle()
                                }
                            }
                            .padding([.leading], viewWidth(geometry.size, 16))
                            .padding([.trailing], viewWidth(geometry.size, 8))
                        }
                }
                .padding([.leading, .bottom], viewWidth(geometry.size, 10))
                .padding([.trailing], viewWidth(geometry.size, 20))
                .background(navBackgroundColor)
                content
            }
        }
    }
}


public extension View {
    
    /// 自定义搜索导航栏修饰符，用于为视图添加自定义的搜索导航栏
      ///
      /// - Parameters:
      ///   - backImageName: 返回按钮图标名称，默认为 `"search_to_left_icon"`
      ///   - navBackgroundColor: 导航栏背景颜色，默认为十六进制颜色 `#FFF0F2F5`
      ///   - backgroundColor: 页面背景颜色，默认为十六进制颜色 `#FFF0F2F5`
      ///   - backAction: 返回按钮点击事件，默认为 `nil`
      ///   - searchAction: 搜索按钮点击事件，默认为 `nil`
      ///   - scanAction:扫描按钮点击事件，默认为 `nil`
      ///
      /// - Returns: 添加了自定义导航栏的视图
    func customSearchNavigationBar(backImageName: String = "search_to_left_icon", navBackgroundColor: Color = Color.color(hexString: "#FFF0F2F5"), backgroundColor: Color = Color.color(hexString: "#FFF0F2F5"), backAction: (() -> Void)? = nil, searchAction: ((String) -> Void)? = nil, scanAction: (() -> Void)? = nil) -> some View {
        self.modifier(SearchNavigationBarModifier(backImageName: backImageName, navBackgroundColor: navBackgroundColor, backAction: backAction, searchAction: searchAction, scanAction: scanAction))
            .background(backgroundColor)
            .navigationBarBackButtonHidden(true)
    }
}
