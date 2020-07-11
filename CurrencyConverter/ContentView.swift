//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Christian Fleschhut on 11.07.20.
//  Copyright © 2020 Christian Fleschhut. All rights reserved.
//

import SwiftUI

struct Converter: View {
    let rates: [String: Double] = ["USD": 1.13, "GBP": 0.89]
    @State var text: String = "100"
    let formatter: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .currency
        f.currencySymbol = ""
        return f
    }()
    var output: String {
        let parsed = Double(text)
        return parsed.flatMap { formatter.string(from: NSNumber(value: $0 * 1.13)) } ?? "parse error"
    }

    var body: some View {
        VStack {
            HStack {
                TextField(text, text: $text).frame(width: 100)
                Text("EUR")
                Text("=")
                Text(output)
                Text("USD")
            }
            List {
                ForEach(self.rates.keys.sorted(), id: \.self) { key in
                    HStack {
                        Text(key)
                        Spacer()
                        Text("\(self.rates[key]!)")
                    }
                }
            }.frame(height: 100)
        }
    }
}

struct ContentView: View {
    var body: some View {
        Converter()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
