//
//  SettingsView.swift
//  iExpense
//
//  Created by Mark Greene on 08/07/2025.
//
import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    
    @AppStorage("selectedFontSize") private var selectedSize = "Default"
    let textSizes = ["Small", "Default", "Large"]
    
    var font: Font {
        switch selectedSize {
        case "Small": return .footnote
        case "Large": return .title
        default: return .body
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Font Size") {
                    Picker("Font Size", selection: $selectedSize) {
                        ForEach(textSizes, id: \.self) { size in
                            Text(size)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Settings")
            
            .toolbar {
                Button("Save") {
                    dismiss()
                }
            }
        }
        .font(font)
    }
}

#Preview {
    SettingsView()
}
