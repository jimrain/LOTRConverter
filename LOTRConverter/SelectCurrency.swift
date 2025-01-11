//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Jim Rainville on 1/8/25.
//
import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @State var topCurrency: Currency
    @State var bottomCurrency: Currency

    var body: some View {
        ZStack {
            // Parchment background image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    
                
                // Currency Icons
                IconGrid(selectedCurrency: topCurrency)
                
                // Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding()
                    
                
                // Currency Icons
                IconGrid(selectedCurrency: bottomCurrency)
                
                // Done Button
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                // This overrides the forgroundSytle on the VStack
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    SelectCurrency(topCurrency: .silverPenny, bottomCurrency: .goldPenny)
}
