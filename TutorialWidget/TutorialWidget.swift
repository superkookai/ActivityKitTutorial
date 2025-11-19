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
            TimeTrackingWidgetExpandView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.bottom) {
                    TimeTrackingWidgetExpandView(context: context)
                }
            } compactLeading: {
                Text("⏰")
            } compactTrailing: {
                TimeTrackingWidgetView(context: context)
            } minimal: {
                
            }

        }

    }
}

struct TimeTrackingWidgetView: View {
    let context: ActivityViewContext<TimeTrackingAttributes>
    
    var body: some View {
        Text(context.state.startTime, style: .relative)
    }
}

struct TimeTrackingWidgetExpandView: View {
    let context: ActivityViewContext<TimeTrackingAttributes>
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Timer Tracking".uppercased())
                .foregroundStyle(.secondary)
                .minimumScaleFactor(0.8)
            
            Text(context.state.startTime, style: .relative)
                .bold()
            
            Button {
                
            } label: {
                Text("Contact Superkookai")
                    .padding(8)
            }
            .buttonStyle(.borderedProminent)
            .tint(.pink)

        }
    }
}
