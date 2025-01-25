//
//  AlarmAddView.swift
//  SwiftUIAlarm
//
//  Created by Tae joong Yoon on 2019/06/19.
//  Copyright © 2019 Tae joong Yoon. All rights reserved.
//

import SwiftUI

struct AlarmAddView : View {
    @EnvironmentObject var alarmData: AlarmData
    @Environment(\.presentationMode) var presentationMode
    
    @State var date: Date = Date()
    @State var repeatDay: [RepeatDay] = []
    @State var label: String = "Alarm"
    @State var isSnoozed: Bool = true
    @Binding var alarmList: [Alarm]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                DatePicker("", selection: $date, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                List {
                    AlarmAddRepeatCellView(repeatDay: $repeatDay)
                    AlarmAddLabelCellView(label: $label)
                    AlarmAddSnoozeCellView(isSnoozed: $isSnoozed)
                }.listStyle(GroupedListStyle())
            }
            .navigationBarTitle(Text("New Alarm"), displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: self.cancel) {
                    Text("Cancel")
                },
                trailing: Button(action: self.createAlarm) {
                    Text("Save")
                }
            )
        }
    }
    
    private func cancel() {
        self.presentationMode.wrappedValue.dismiss()
    }
    
    private func createAlarm() {
        let newAlarm = Alarm(
            date: date,
            label: label,
            repeatDay: repeatDay,
            isActive: true,
            isSnooze: isSnoozed
        )
        
        self.alarmData.alarms.append(newAlarm)
        alarmList = alarmData.alarms
        self.presentationMode.wrappedValue.dismiss()
    }
}
