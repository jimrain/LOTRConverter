//
//  CurrencySection.swift
//  LOTRConverter
//
//  Created by Jim Rainville on 1/15/25.
//

import SwiftUI

struct CurrencySection: View {
    @Binding var currency1: Currency
    @Binding var currency2: Currency
    @Binding var showSelectCurrency: Bool

    @Binding var currencyTip: CurrencyTip
    @Binding var amount1: String
    @Binding var amount2: String
    
    @FocusState.Binding var typing: Typing?
    let typingValue: Typing
    
    var body: some View {
        VStack {
            // Currency
            HStack {
                // Currency Image
                Image(currency1.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 33)
                
                // Currency Text
                Text(currency1.name)
                    .font(.headline)
                    .foregroundStyle(.white)
            }
            .padding(.bottom, -5)
            .onTapGesture {
                showSelectCurrency.toggle()
                typing = nil
                // Once this has been tapped the user knows they can use it
                // so never show the tip again
                currencyTip.invalidate(reason: .actionPerformed)
            }
            .popoverTip(currencyTip, arrowEdge: .bottom)
            
            // Text Field
            TextField("Amount", text: $amount1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            // if this text field has focus then set the leftTyping property to true. This will be used below.
                .focused($typing, equals: typingValue)
                .onChange(of: amount1) {
                    if typing != nil {
                        amount2 = currency1.convert(amount1, to: currency2)
                    }
                    
                }
            
        }
    }
}

#Preview {
    @Previewable @State var leftCurrency: Currency = .goldPenny
    @Previewable @State var rightCurrency: Currency = .silverPenny
    @Previewable @State var showSelectCurrency: Bool = false
    @Previewable @State var currencyTip = CurrencyTip(title: Text("Change Currency"), message: Text("Select your preferred currency"))
    @Previewable @State var leftAmount: String = ""
    @Previewable @State var rightAmount: String = ""
    @Previewable @FocusState var typing: Typing?
    
    
    CurrencySection(currency1: $leftCurrency, currency2: $rightCurrency, showSelectCurrency: $showSelectCurrency, currencyTip: $currencyTip, amount1: $leftAmount, amount2: $rightAmount, typing: $typing, typingValue: .left)
}
