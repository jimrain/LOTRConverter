//
//  CurrencySection.swift
//  LOTRConverter
//
//  Created by Jim Rainville on 1/15/25.
//

import SwiftUI

struct CurrencySection: View {
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    @Binding var showSelectCurrency: Bool

    @Binding var currencyTip: CurrencyTip
    @Binding var leftAmount: String
    @Binding var rightAmount: String
    
    @FocusState.Binding var leftTypeing: Bool
    @FocusState.Binding var rightTypeing: Bool
    
    var body: some View {
        VStack {
            // Currency
            HStack {
                // Currency Image
                Image(leftCurrency.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 33)
                
                // Currency Text
                Text(leftCurrency.name)
                    .font(.headline)
                    .foregroundStyle(.white)
            }
            .padding(.bottom, -5)
            .onTapGesture {
                showSelectCurrency.toggle()
                leftTypeing = false
                rightTypeing = false
                // Once this has been tapped the user knows they can use it
                // so never show the tip again
                currencyTip.invalidate(reason: .actionPerformed)
            }
            .popoverTip(currencyTip, arrowEdge: .bottom)
            
            // Text Field
            TextField("Amount", text: $leftAmount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            // if this text field has focus then set the leftTyping property to true. This will be used below.
                .focused($leftTypeing)
                .onChange(of: leftAmount) {
                    if leftTypeing {
                        rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
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
    @Previewable @FocusState var leftTyping: Bool
    @Previewable @FocusState var rightTyping: Bool
    
    
    CurrencySection(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency, showSelectCurrency: $showSelectCurrency, currencyTip: $currencyTip, leftAmount: $leftAmount, rightAmount: $rightAmount, leftTypeing: $leftTyping, rightTypeing: $rightTyping)
}
