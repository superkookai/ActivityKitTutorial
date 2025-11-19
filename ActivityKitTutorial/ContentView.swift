//
//  ContentView.swift
//  ActivityKitTutorial
//
//  Created by Weerawut Chaiyasomboon on 19/11/2568.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    @State private var isTrackingTime = false
    @State private var startTime: Date? = nil
    @State private var activity: Activity<TimeTrackingAttributes>? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                if let startTime {
                    Text(startTime, style: .relative)
                        .font(.title)
                        .frame(width: 150, height: 80)
                        .background(.regularMaterial,in: .capsule)
                } else {
                    Text(" ")
                        .font(.title)
                        .frame(width: 150, height: 80)
                }
                
                Button {
                    isTrackingTime.toggle()
                    if isTrackingTime {
                        startTime = .now
                        //Start Live Activity
                        let attributes = TimeTrackingAttributes()
                        let state = TimeTrackingAttributes.ContentState(startTime: .now)
                        activity = try? Activity<TimeTrackingAttributes>.request(attributes: attributes, contentState: state, pushType: nil)
                    } else {
                        //Stop Live Activity
                        guard let startTime else { return }
                        let state = TimeTrackingAttributes.ContentState(startTime: startTime)
                        Task {
                            await activity?.end(using: state, dismissalPolicy: .immediate)
                        }
                        self.startTime = nil
                    }
                } label: {
                    Text(isTrackingTime ? "STOP" : "START")
                        .font(.title.bold())
                        .foregroundStyle(.white)
                        .frame(width: 200, height: 200)
                        .background(
                            Circle()
                                .fill(isTrackingTime ? .red : .green)
                        )
                }
                
                Spacer()
                Spacer()
            }
            .navigationTitle("Timer Tracker")
        }
    }
}

#Preview {
    ContentView()
}
