//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Jim Rainville on 1/5/25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfotip: Bool = false
    @State var showSelectCurrency: Bool = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @FocusState var leftTypeing
    @FocusState var rightTypeing
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    let defaults = UserDefaults.standard
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        
        
        ZStack {
            // Background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                // Prancing Pony image view
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    
                HStack {
                    // Left currency section
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
                    
                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // Right conversion secton
                    VStack {
                        // Currency
                        HStack {
                            // Currency Text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // Currency Image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            // Once this has been tapped the user knows they can use it
                            // so never show the tip again
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                    
                        // Text Field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .multilineTextAlignment(.trailing)
                            .focused($rightTypeing)
                            .onChange(of: rightAmount) {
                                if rightTypeing {
                                    leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                                }
                                
                            }
                        
                    }
                }
                .padding()
                .background(Color.black.opacity(0.5))
                .clipShape(.capsule)
                .keyboardType(.decimalPad)
                
                Spacer()
                
                // Info button
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfotip.toggle()
                        //print("showExchangeInfotip: \(showExchangeInfotip)")
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    }
                
            }
             // .border(.blue)
        }
        // This is an important point! It might make sense to put this closer to where they are
        // triggered. E.g. the button where the showExchangeInfotip is toggled. In fact I left the
        // onChange methodes for the rightAmount and leftAmount where the text fields for those
        // are changed. BUT - since these onChange and sheet methods are triggered but properties
        // that have view scope I can just put them here and the end of the view.
        .task {
            // the .task method runs whenever the view is loaded.
            try? Tips.configure()
            let leftCurrencyRaw = defaults.object(forKey:"LeftCurrency") as? Double ?? Currency.silverPiece.rawValue
            leftCurrency = Currency(rawValue: leftCurrencyRaw)!
            let rightCurrencyRaw = defaults.object(forKey:"RightCurrency") as? Double ?? Currency.goldPiece.rawValue
            rightCurrency = Currency(rawValue: rightCurrencyRaw)!
        }
        .onChange(of: leftCurrency) {
            defaults.set(leftCurrency.rawValue, forKey: "LeftCurrency")
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        }
        .onChange(of: rightCurrency) {
            defaults.set(rightCurrency.rawValue, forKey: "RightCurrency")
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        }
        .sheet(isPresented: $showExchangeInfotip) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}
