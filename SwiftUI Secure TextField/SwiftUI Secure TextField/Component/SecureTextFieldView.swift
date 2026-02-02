//
//  SecureTextFieldView.swift
//  SwiftUI Secure TextField
//
//  Created by Bhargav Joshi on 02/02/26.
//

import SwiftUI

struct SecureTextFieldView: View {
    
    @Binding var text: String
    @State private var showPassword: Bool = false
    
    @FocusState private var focusedField: FieldType?
    
    let field: FieldType
    
    var body: some View {
        GeometryReader { geo in
            let height = geo.size.height
            let width = geo.size.width
            let collapsedSize = height * 0.7
            
            ZStack {
                // Background capsule
                Capsule()
                    .fill(Color.secondary.opacity(0.15))
                
                // Animated moving capsule (MAIN EFFECT)
                HStack {
                    if !showPassword {
                        Spacer()
                    }
                    
                    Capsule()
                        .fill(Color.accentColor.opacity(0.25))
                        .frame(
                            width: showPassword ? width : collapsedSize,
                            height: showPassword ? height : collapsedSize
                        )
                        .animation(.easeInOut(duration: 0.25), value: showPassword)
                        .padding(.trailing, showPassword ? 0 : 8)
                }
                
                // Content
                HStack {
                    ZStack {
                        TextField("Password", text: $text)
                            .opacity(showPassword ? 1 : 0)
                            .focused($focusedField, equals: field)
                            .opacity(showPassword ? 1 : 0)
                        
                        SecureField("Password", text: $text)
                            .opacity(!showPassword ? 1 : 0)
                            .focused($focusedField, equals: field)
                            .opacity(showPassword ? 0 : 1)
                    }
                    .padding(.leading, 20)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(.primary)
                    .animation(.easeInOut(duration: 0.25), value: showPassword)
                    
                    Spacer()
                    
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye" : "eye.slash")
                            .font(.system(size: 20, weight: .medium))
                            .padding(.trailing, 16)
                            .contentShape(Rectangle())
                    }
                    .disabled(text.count > 0 ? false : true)
                    .buttonStyle(.plain)
                }
            }
        }
    }
}


#Preview {
    @State var text: String = ""
    SecureTextFieldView(text: $text, field: .password)
        .frame(height: 70)
        .padding(.horizontal, 16)
}
