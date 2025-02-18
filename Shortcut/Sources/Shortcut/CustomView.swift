//
//  CustomView.swift
//  Shortcut
//
//  Created by Thomas on 2025/2/18.
//

import SwiftUI

public struct CustomView: View {
    
    public init() {
        
    }
    
    public var body: some View {
        Text("Hello, SwiftUI Package!")
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
