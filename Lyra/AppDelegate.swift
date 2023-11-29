//
//  AppDelegate.swift
//  Lyra
//
//  Created by Stella Luna on 11/29/23.
//

import Foundation
import IOKit
import SwiftUI

class AppData: ObservableObject {
    @Published var arrayText = ""
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        let source = IOPSNotificationCreateRunLoopSource(
            {
                _ in
                NSLog("[Power Info] Update detected, however, the app does not yet support autoupdate.")
                
                
            },nil).takeRetainedValue()
        
        CFRunLoopAddSource(CFRunLoopGetCurrent(),source,.defaultMode)
    }
}
