//
//  IconGrid.swift
//  LOTRConverter
//
//  Created by Jim Rainville on 1/8/25.
//
import SwiftUI

struct IconGrid: View {
    @State var selectedCurrency: Currency

    var body: some View {
        
        // Currency Icons
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases) {currency in
                if selectedCurrency == currency {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color: .black, radius: 10)
                        .overlay{
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                } else {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture {
                            selectedCurrency = currency
                        }
                }
            }
        }
    }
            
}

#Preview {
    IconGrid(selectedCurrency: .silverPiece)
}
