//
//  CurrencyIcon.swift
//  LOTRConverter
//
//  Created by Jim Rainville on 1/8/25.
//
import SwiftUI

struct CurrencyIcon: View {
    let currencyImage: ImageResource
    let currencyName: String
    
    var body: some View {
        
        // Currency Icons
        ZStack(alignment: .bottom) {
            // Currency Image
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            
            // Currency Name
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(Color.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
        
        
        
    }
}

#Preview {
    CurrencyIcon(currencyImage: .silverpenny, currencyName: "Silver Penny")
}
