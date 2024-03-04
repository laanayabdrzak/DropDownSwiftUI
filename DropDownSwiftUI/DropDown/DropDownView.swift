//
//  DropDownView.swift
//  DropDownSwiftUI
//
//  Created by LAANAYA Abderrazak on 3/3/2024.
//

import SwiftUI

struct DropDownView: View {
    let title: String
    let prompt: String
    let options: [String]
    
    @State private var isExpanded: Bool = false
    @Binding var selection: String?
    @Environment (\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.footnote)
                .foregroundStyle(.gray)
                .opacity(0.8)
            
            VStack {
                HStack {
                    Text(selection ?? prompt)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .rotationEffect(.degrees(isExpanded ? -180 : 0))
                }
                .background(colorScheme == .dark ? .black : .white)
                .frame(height: 40)
                .padding(.horizontal)
                .onTapGesture {
                    withAnimation(.snappy) { isExpanded.toggle() }
                }
                
                if isExpanded {
                    VStack {
                        ForEach(options, id: \.self) { option in
                            HStack {
                                Text(option)
                                    .foregroundStyle(selection == option ? Color.primary : .gray )
                                
                                Spacer()
                                
                                if selection == option {
                                    Image(systemName: "checkmark")
                                        .font(.subheadline)
                                }
                                
                            }
                            .frame(height: 40)
                            .padding(.horizontal)
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    selection = option
                                    isExpanded.toggle()
                                }
                            }
                        }
                        .transition(.move(edge: .bottom))
                    }
                }
            }
            .background(colorScheme == .dark ? .black : .white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .primary.opacity(0.4), radius: 4)
            .frame(width: 150)
        }
    }
}

#Preview {
    DropDownView(title: "Car",
                 prompt: "Select",
                 options: ["Audi", "BMW", "Mercedes", "JEEP"],
                 selection: .constant("BMW"))
}
