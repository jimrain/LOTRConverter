//
//  ConvertTest.swift
//  LOTRConverter
//
//  Created by Jim Rainville on 1/13/25.
//

import Foundation

class ConvertExercise {
    func convert(_ intValue: Int) -> String {
        let convertedAmount = Double(intValue) / 3
        
        let string = String(format: "%.15f", convertedAmount) // Format to 15 decimal places to ensure accuracy
        
        print("String \(string)")
        let parts = string.components(separatedBy: ".")
        print("Parts: \(parts)")
        print("Parts count: \(parts.count) Parts 1 count: \(parts[1].count)")
        if parts.count > 1 && parts[1].count < 3 {
            print("Part 1: \(parts[1])")
            if Int(parts[1]) == 0 {
                return String(parts[0])
            } else {
                return String(convertedAmount)
            }
            
            
            
        } else {
            if parts.count > 1  {
                print("Part 1: \(parts[1])")
                if Int(parts[1]) == 0 {
                    return String(parts[0])
                } else {
                    return String(format: "%.2f", convertedAmount)
                }
                
            } else {
                return String(format: "%.2f", convertedAmount)
            }
        }
    }
}
