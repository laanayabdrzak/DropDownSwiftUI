//
//  ContentView.swift
//  DropDownSwiftUI
//
//  Created by LAANAYA Abderrazak on 3/3/2024.
//

import SwiftUI


struct ContentView: View {
    private let manufacturers = [
        "BMW",
        "Mercedes",
        "VolksWagen",
        "Audi",
        "Skoda"
    ]
    
    private let types = [
        "Coupe",
        "Sedan",
        "SUV"
    ]
    
    @State private var selectedMake: String?
    @State private var selectedType: String?
    
    var body: some View {
        VStack(spacing: 16) {
            DropDownView(title: "Make",
                         prompt: "Select",
                         options: manufacturers,
                         selection: $selectedMake)
            
            DropDownView(title: "Type",
                         prompt: "Select",
                         options: types,
                         selection: $selectedType)
        }
        
    }
}

#Preview {
    ContentView()
}
