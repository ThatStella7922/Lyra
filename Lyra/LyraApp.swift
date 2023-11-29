//
//  LyraApp.swift
//  Lyra
//
//  Created by Stella Luna on 11/29/23.
//

import SwiftUI

@main
struct LyraApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
