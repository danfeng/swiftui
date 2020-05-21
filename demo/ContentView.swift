//
//  ContentView.swift
//  demo
//
//  Created by sundanlong on 2020/5/20.
//  Copyright © 2020 sundanlong. All rights reserved.
//

import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        Text("Hello, World!11111122").italic().tag(1).foregroundColor(.green)
//        let webview = WKWebView()
//        webview.load(URLRequest(url: "http://sina.com"))
//        webview
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
