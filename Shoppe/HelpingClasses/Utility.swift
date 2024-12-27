//
//  Utility.swift
//  Shoppe
//
//  Created by Naveed Khalid on 26/12/2024.
//

import Foundation

class Utility {
    // Singleton instance
    static let shared = Utility()
    
    private init() {} // Private initializer to prevent instantiation
    
    // Validate email format using if-else
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        if emailPred.evaluate(with: email) {
            return false
        } else {
            return true
        }
    }
    
    // Check if string is empty or contains only whitespace using if-else
    func isEmpty(_ text: String) -> Bool {
        let trimmedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedText.isEmpty {
            return true
        } else {
            return false
        }
    }
}
