//
//  Editor.swift
//  Lab09
//
//  Created by 林峻霆 on 2022/5/25.
//


import SwiftUI

struct UserEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var iphonesData: UserData
    @State private var Device = ""
    @State private var Version = ""
    @State private var BatteryHealth : CGFloat = 100
    @State private var PowerConsumption = false
    @State private var Smoothness = 1
    var disableForm: Bool {
        Device.isEmpty || Version.isEmpty
    }
    
    var editUser: User?
    var iphone = ["iPhone 13 Pro Max","iPhone 13 Pro","iPhone 13","iPhone 12", "iPhone 12 Pro","iPhone 12 Pro Max", "iPhone 11", "iPhone 11 Pro", "iPhone 11 Pro Max", "iPhone XS", "iPhone XS Max", "iPhone X", "iPhone XR", "iPhone SE 2th", "iPhone SE", "iPhone 8","iPhone 8 Plus", "iPhone 7", "iPhone 7 Plus", "iPhone 6s", "iPhone 6s Plus"]
    @State private var selectedDecive = "iPhone 13 Pro Max"
    var body: some View {
        Form{
            TextField("iOS版本", text: $Version)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
            VStack {
                Image(Device)
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 250)
                Picker("設備", selection: $Device) {
                    ForEach(self.iphone, id:\.self) { (iphone) in
                        Text(iphone)
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            HStack {
                Text("電池健康度:")
                Slider(value: $BatteryHealth, in: 1...100, step: 1)
                Text("\(Int(BatteryHealth))")
            }
            Toggle("是否更耗電？", isOn:  $PowerConsumption)
            HStack {
                Stepper("順暢度表現:   \(Smoothness)", value: $Smoothness, in: 1...5)
            }
        }
        .navigationBarTitle(editUser == nil ? "Add new Device" : "Edit Device")
        .navigationBarItems(trailing: Button("save"){
            let user = User(Device: self.Device, Version: self.Version, BatteryHealth: Int(self.BatteryHealth), PowerConsumption: self.PowerConsumption, Smoothness: self.Smoothness)
            if let editUser = self.editUser{
                let index = self.iphonesData.users.firstIndex{
                    $0.id == editUser.id
                }!
                self.iphonesData.users[index] = user
            } else{
                self.iphonesData.users.insert(user, at: 0)
            }
            self.presentationMode.wrappedValue.dismiss()
        }.disabled(disableForm))
        .onAppear{
            if let editUser = self.editUser, self.Device == "" {
                self.Device = editUser.Device
                self.Version = editUser.Version
                self.BatteryHealth = CGFloat(editUser.BatteryHealth)
                self.PowerConsumption = editUser.PowerConsumption
                self.Smoothness = editUser.Smoothness
            }
        }
    }
}

struct Editor_Previews: PreviewProvider {
    static var previews: some View {
        UserEditor(iphonesData: UserData())
    }
}
