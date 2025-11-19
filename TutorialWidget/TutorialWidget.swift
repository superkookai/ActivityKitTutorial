//
//  TutorialWidget.swift
//  TutorialWidget
//
//  Created by Weerawut Chaiyasomboon on 19/11/2568.
//

import WidgetKit
import SwiftUI
import ActivityKit

struct TutorialWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TimeTrackingAttributes.self) { context in
            TimeTrackingWidgetView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.bottom) {
                    TimeTrackingWidgetView(context: context)
                }
            } compactLeading: {
                Text("👈👈 Leading")
            } compactTrailing: {
                Text("Trailing 👉👉")
            } minimal: {
                Text("MI")
            }

        }

    }
}

struct TimeTrackingWidgetView: View {
    let context: ActivityViewContext<TimeTrackingAttributes>
    
    var body: some View {
        Text(context.state.startTime, style: .relative)
            .padding()
            .background(.regularMaterial,in: .capsule)
    }
}
