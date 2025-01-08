//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Jim Rainville on 1/8/25.
//
import SwiftUI

struct ExchangeRate: View {
    let lefImage: ImageResource
    let text: String
    let rightImage: ImageResource
        
    var body: some View {
        HStack {
            // Left currenty image
            Image(lefImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            // Exchange rate text
            Text(text)
            
            // Right currency Image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(lefImage: .silverpiece, text: "One Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
}
