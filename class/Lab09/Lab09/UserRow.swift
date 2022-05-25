//
//  Row.swift
//  Lab09
//
//  Created by 林峻霆 on 2022/5/25.
//


import SwiftUI

struct UserRow: View {
    var user: User
    var body: some View {
        HStack {
            Image("\(user.Device)")
                .resizable()
                .scaledToFit()
                .frame(width:20)
            Text("\(user.Device)")
            Spacer()
            Text("\(user.Smoothness) 分順暢度")
            Image(systemName: user.PowerConsumption ? "battery.0" :
                    "battery.100")
        }
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(user: User(Device: "iphone 8", Version: "12.2", BatteryHealth: 98, PowerConsumption: true, Smoothness: 3))
    }
}
