//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Christian Fleschhut on 11.07.20.
//  Copyright © 2020 Christian Fleschhut. All rights reserved.
//

import SwiftUI

struct Converter: View {
    @State var text: String = "100"
    var output: String {
        let parsed = Double(text)
        return parsed.map { String($0 * 1.13) } ?? "parse error"
    }

    var body: some View {
        HStack {
            TextField(text, text: $text).frame(width: 100)
            Text("EUR")
            Text("=")
            Text(output)
            Text("USD")
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
