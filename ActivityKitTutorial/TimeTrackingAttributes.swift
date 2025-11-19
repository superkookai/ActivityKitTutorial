//
//  TimeTrackingAttributes.swift
//  ActivityKitTutorial
//
//  Created by Weerawut Chaiyasomboon on 19/11/2568.
//

import ActivityKit
import SwiftUI

struct TimeTrackingAttributes: ActivityAttributes {
    typealias TimeTrackingStatus = ContentState
    
    struct ContentState: Hashable, Codable {
        var startTime: Date
    }
}
