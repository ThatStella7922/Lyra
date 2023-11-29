//
//  MacIOKit.swift
//  Adapted from Battery Webhook 1.0
//
//  Created by Stella Luna on 11/21/23.
//

import Foundation
import IOKit
import IOKit.ps

/**
 Returns the current power source as string.
 
 - Returns:
 Battery Power, AC Power or Unknown
 
 - Warning: Only available on macOS
 */
func GetMacPowerSource() -> String {
    guard let snapshot = IOPSCopyPowerSourcesInfo()?.takeRetainedValue() else { return "Unknown" }
    guard let sources: NSArray = IOPSCopyPowerSourcesList(snapshot)?.takeRetainedValue() else { return "Unknown" }
    for ps in sources {
        guard let info: NSDictionary = IOPSGetPowerSourceDescription(snapshot, ps as CFTypeRef)?.takeUnretainedValue() else { return "Unknown" }

        if let powerSource = info[kIOPSPowerSourceStateKey] as? String {
            return powerSource
        }
    }
    
    return "Unknown"
}

/**
 Returns whether or not the Mac is charging
 
 - Returns:
 it's a bool
 
 - Warning: Only available on macOS
 */
func GetMacIsCharging() -> Bool {
    guard let snapshot = IOPSCopyPowerSourcesInfo()?.takeRetainedValue() else { return false }
    guard let sources: NSArray = IOPSCopyPowerSourcesList(snapshot)?.takeRetainedValue() else { return false }
    for ps in sources {
        guard let info: NSDictionary = IOPSGetPowerSourceDescription(snapshot, ps as CFTypeRef)?.takeUnretainedValue() else { return false }

        if let isCharging = info[kIOPSIsChargingKey] as? Bool {
            return isCharging
        }
    }
    
    return false
}

func GetIOPSArray() -> NSArray {
    guard let snapshot = IOPSCopyPowerSourcesInfo()?.takeRetainedValue() else { return [] }
    guard let sources: NSArray = IOPSCopyPowerSourcesList(snapshot)?.takeRetainedValue() else { return [] }
    return sources
}
