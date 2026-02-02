//
//  SecureTextFieldDemoView.swift
//  SwiftUI Secure TextField
//
//  Created by Bhargav Joshi on 02/02/26.
//

import SwiftUI

struct SecureTextFieldDemoView: View {
    
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            SecureTextFieldView(text: $password, field: .password)
                .frame(height: 70)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    SecureTextFieldDemoView()
}
