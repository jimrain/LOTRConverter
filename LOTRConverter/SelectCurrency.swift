//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Jim Rainville on 1/8/25.
//
import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @State var selectedCurrency: Currency

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
                
                // Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    
                
                // Currency Icons

                
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
        }
    }
}

#Preview {
    SelectCurrency(selectedCurrency: .silverPiece)
}
