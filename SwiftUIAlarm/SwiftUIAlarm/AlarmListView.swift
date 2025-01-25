//
//  AlarmListView.swift
//  SwiftUIAlarm
//
//  Created by Tae joong Yoon on 2019/06/14.
//  Copyright © 2019 Tae joong Yoon. All rights reserved.
//

import SwiftUI

struct AlarmListView : View {
    @EnvironmentObject var alarmData: AlarmData
    @State var alarmList: [Alarm] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(alarmList) { alarm in
                    NavigationLink(
                        destination: AlarmAddView(alarmList: $alarmList, alarmToEdit: alarm).environmentObject(self.alarmData)
                    ) {
                        AlarmView(alarmList: alarmList, alarm: alarm)
                    }
                }
                .onDelete(perform: deleteAlarm)
            }
            .navigationBarTitle(Text("Alarm"))
            .navigationBarItems(
                trailing: NavigationLink(
                    destination: AlarmAddView(alarmList: $alarmList).environmentObject(self.alarmData)
                ) {
                    Image(systemName: "plus")
                }
            )
        }
        .onAppear() {
            alarmList = alarmData.alarms
        }
    }
    
    func deleteAlarm(at offsets: IndexSet) {
        alarmData.alarms.remove(atOffsets: offsets)
        alarmList = alarmData.alarms
    }
}
