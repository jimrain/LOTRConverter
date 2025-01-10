//
//  Currency.swift
//  LOTRConverter
//
//  Created by James Rainville on 1/9/25.
//
import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenney = 4
    case goldPiece = 1
    
    var id: Currency { self }
    
    var image: ImageResource {
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .silverPiece:
                .silverpiece
        case .goldPenney:
                .goldpenny
        case .goldPiece:
                .goldpiece
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny:
            "Copper Penny"
        case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPenney:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        }
    }
}
