//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Jim Rainville on 1/13/25.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    var message: Text? = Text("You can tap the left or right currency to bring up the Select Currency screen.")
    
    let image: Image? = Image(systemName: "hand.tap.fill")
}