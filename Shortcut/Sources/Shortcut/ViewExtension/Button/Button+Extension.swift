//
//  Button+Extension.swift
//  B101
//
//  Created by Thomas on 2025/1/11.
//

import SwiftUI


public extension Button {
    
    @MainActor func restyle(_ backColor: Color) -> some View {
        background(backColor)
            .buttonStyle(.plain)
    }
    
    @MainActor func restyle() -> some View {
        buttonStyle(.plain)
    }
}
