import SwiftUI
import SwiftData
import AVKit

@main
struct SwiftUIAlarmApp: App {
    @StateObject private var alarmData = AlarmData()
    
    var body: some Scene {
        WindowGroup {
            AlarmListView(alarmList: alarmData.alarms)
                .environmentObject(alarmData)
        }
    }
}


