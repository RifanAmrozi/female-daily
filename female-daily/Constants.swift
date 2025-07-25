//
//  Constants.swift
//  female-daily
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 22/07/25.
//

import SwiftUI

struct Constants {
    static let BackgroundColor: Color = Color(red: 1, green: 1, blue: 1)
    static let PrimaryAccentPrimary800: Color = Color(red: 0.62, green: 0.09, blue: 0.3)
    static let PrimarySecondary500: Color = Color(red: 0.93, green: 0.27, blue: 0.38)
    static let GreyscaleGrey800: Color = Color(red: 0.26, green: 0.27, blue: 0.29)
    static let PrimarySecondary800: Color = Color(red: 0.6, green: 0.09, blue: 0.23)
    static let PrimaryAccentPrimary50: Color = Color(red: 0.99, green: 0.95, blue: 0.97)
    static let GreyscaleGrey950: Color = Color(red: 0.14, green: 0.15, blue: 0.16)
    static let PrimarySecondary50: Color = Color(red: 1, green: 0.95, blue: 0.95)
    static let PrimarySecondary700: Color = Color(red: 0.72, green: 0.1, blue: 0.24)
    static let GreyscaleGrey600: Color = Color(red: 0.34, green: 0.36, blue: 0.39)
    static let PrimaryAccentPrimary600: Color = Color(red: 0.86, green: 0.15, blue: 0.47)
    static let PrimaryAccentPrimary700: Color = Color(red: 0.75, green: 0.09, blue: 0.37)
    static let GreyscaleGrey500: Color = Color(red: 0.39, green: 0.42, blue: 0.45)
    static let PrimarySecondary400: Color = Color(red: 0.96, green: 0.46, blue: 0.53)
    
    struct API{
        static let baseURL: String="http://10.60.59.97:8080/api/v1"
        static let tempURL: String="http://192.168.110.244:8080/api/v1"
    }
    
    struct Ticket{
        static let id: String="A1BJXB281"
    }
    struct Brand {
        static let all: [Int: String] = [
            1: "Wardah",
            2: "Emina",
            3: "Kahf"
        ]
    }
}
